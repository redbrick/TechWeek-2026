<script setup>
import CalendarMain from "./CalendarMain.vue"
import TitleBlock from "./TitleBlock.vue"
import YoutubeEmbed from "./YoutubeEmbed.vue"
</script>

<template>
  <div class="mx-auto flex min-h-screen w-full max-w-7xl flex-col gap-6 px-4 py-6 sm:px-6 lg:px-8">
    <header class="w-full">
      <TitleBlock />
    </header>

    <main class="grid grid-cols-1 items-start gap-6 lg:grid-cols-12">
      <section class="lg:col-span-5">
        <YoutubeEmbed urlID="tipxfFOPdDo?si=fAco-y9XacPtvruK" />
      </section>

      <section class="lg:col-span-7">
        <CalendarMain />
      </section>
    </main>
  </div>
</template>
