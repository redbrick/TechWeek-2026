<script setup>
import { defineProps } from "vue"
import { useRouter, useRoute } from "vue-router"

// Dynamically get years from data folder using Vite's import.meta.glob
const files = import.meta.glob("../data/*.json")
const years = Object.keys(files)
  .map((file) => parseInt(file.match(/(\d{4})\.json$/)?.[1]))
  .filter(Boolean)
  .sort()
  .reverse()

const router = useRouter()
const route = useRoute()

const props = defineProps({
  title: String,
  subtitle: String,
})

function goToYear(year) {
  router.push({ path: `/${year}` })
}

function goToCallForTalks() {
  router.push({ path: "/cft" })
}
</script>

<template>
  <div class="wrapper flex flex-col bg-red-600 text-white p-8 rounded-lg shadow-lg mt-8">
    <h1 class="text-4xl font-bold mb-2">{{ props.title }}</h1>
    <p class="text-lg mb-0">{{ props.subtitle }}</p>
    <div class="mt-4 flex gap-2">
      <span v-for="year in years" :key="year">
        <button
          :class="[
            'bg-white text-red-600 font-semibold px-3 py-1 rounded hover:bg-red-100 transition cursor-pointer',
            route.path === '/' + year ? 'ring-2 ring-blue-400 bg-blue-50' : '',
          ]"
          @click="goToYear(year)"
        >
          {{ year }}
        </button>
      </span>
      <button
        :class="[
          'bg-white text-red-600 font-semibold px-3 py-1 rounded hover:bg-red-100 transition cursor-pointer',
          route.path === '/cft' ? 'ring-2 ring-blue-400 bg-blue-50' : '',
        ]"
        @click="goToCallForTalks"
      >
        Call for Talks
      </button>
    </div>
  </div>
</template>
