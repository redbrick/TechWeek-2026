<script setup>
import { defineProps } from "vue"

// Dynamically get years from data folder using Vite's import.meta.glob
const files = import.meta.glob("../data/*.json")
const years = Object.keys(files)
  .map((file) => parseInt(file.match(/(\d{4})\.json$/)?.[1]))
  .filter(Boolean)
  .sort()
  .reverse()

const props = defineProps({
  title: String,
  subtitle: String,
})

function goToYear(year) {
  window.location.href = `/${year}`
}
</script>

<template>
  <div
    class="wrapper flex flex-col items-center text-center bg-red-600 text-white p-8 rounded-lg shadow-lg mt-8"
  >
    <h1 class="text-4xl font-bold mb-2">{{ props.title }}</h1>
    <p class="text-lg mb-0">{{ props.subtitle }}</p>
    <div class="mt-4 flex gap-2">
      <span v-for="year in years" :key="year">
        <button
          class="bg-white text-red-600 font-semibold px-3 py-1 rounded hover:bg-red-100 transition cursor-pointer"
          @click="goToYear(year)"
        >
          {{ year }}
        </button>
      </span>
    </div>
  </div>
</template>
