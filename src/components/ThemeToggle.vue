<script setup>
import { ref, onMounted } from "vue"

const isDark = ref(false)

function setTheme(dark) {
  isDark.value = dark
  document.documentElement.classList.toggle("dark", dark)
  localStorage.setItem("theme", dark ? "dark" : "light")
}

function toggleTheme() {
  setTheme(!isDark.value)
}

onMounted(() => {
  const saved = localStorage.getItem("theme")
  setTheme(
    saved === "dark" || (!saved && window.matchMedia("(prefers-color-scheme: dark)").matches),
  )
})
</script>

<template>
  <button
    @click="toggleTheme"
    class="absolute z-50 right-7 top-8 bottom-auto w-12 h-12 flex items-center justify-center rounded-full bg-red-600 dark:bg-gray-800 text-gray-800 dark:text-gray-100 shadow-lg transition cursor-pointer"
    aria-label="Toggle dark mode"
  >
    <span v-if="isDark">🌙</span>
    <span v-else>☀️</span>
  </button>
</template>
