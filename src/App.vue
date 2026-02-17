<script setup>
import ComingSoonPage from "./components/ComingSoonPage.vue"
import LiveSite from "./components/LiveSite.vue"
const isDevEnabled = import.meta.env.VITE_DEV === "true"
</script>

<template>
  <LiveSite v-if="!isDevEnabled" />
  <ComingSoonPage v-else />
</template>
