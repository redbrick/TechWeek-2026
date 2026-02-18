<script setup>
import CalendarMain from "../components/CalendarMain.vue"
import TitleBlock from "../components/TitleBlock.vue"
import YoutubeEmbed from "../components/YoutubeEmbed.vue"
import ThemeToggle from "../components/ThemeToggle.vue"
import FooterRedbrick from "../components/FooterRedbrick.vue"

import { ref, computed, watchEffect } from "vue"
import { useRoute } from "vue-router"

const route = useRoute()
const year = computed(() => {
  // Try to get year param from route, fallback to path, then default
  if (route.params.year && /^\d{4}$/.test(route.params.year)) {
    return route.params.year
  }
  const match = route.path.match(/\/(\d{4})/)
  return match ? match[1] : "2026"
})

const data = ref(null)

async function loadData() {
  try {
    data.value = (await import(`../data/${year.value}.json`)).default
  } catch {
    data.value = (await import("../data/2014.json")).default
  }
}

watchEffect(() => {
  loadData()
})

const subtitle = computed(() => {
  if (!data.value) return ""
  return `${data.value.location} ${data.value.start} - ${data.value.end} ${data.value.month} ${data.value.year}`
})

const calendarTabs = computed(() => {
  if (!data.value) return []
  return data.value.days.map((day) => ({
    label: `${day.day}: ${day.description}`,
    events: day.events.map((event) => ({
      time: event.time,
      heading: event.name,
      location: event.place?.id || "",
      description: event.description,
      by: event.by,
    })),
  }))
})

defineExpose({ data, calendarTabs, subtitle })
</script>

<template>
  <div class="mx-auto flex min-h-screen w-full max-w-7xl flex-col gap-6 px-4 py-6 sm:px-6 lg:px-8">
    <header class="w-full">
      <ThemeToggle class="float-right" />
      <TitleBlock :title="'Tech Week'" :subtitle="subtitle" />
    </header>

    <main class="grid grid-cols-1 items-start gap-6 lg:grid-cols-12">
      <section class="lg:col-span-5">
        <YoutubeEmbed :urlID="data && data.video ? data.video : ''" />
      </section>

      <section class="lg:col-span-7">
        <CalendarMain :tabs="calendarTabs" />
      </section>
    </main>
  </div>
  <FooterRedbrick />
</template>
