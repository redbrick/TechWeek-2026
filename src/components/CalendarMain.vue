<script setup>
import EventItem from "./EventItem.vue"
import { ref } from "vue"
import { defineProps } from "vue"

const props = defineProps({
  tabs: {
    type: Array,
    required: true,
  },
})

const selectedTab = ref(0)
</script>

<template>
  <div class="w-full max-w-3xl mx-auto">
    <!-- Tab Navigation -->
    <div class="px-2">
      <div class="flex flex-col md:flex-row gap-2 justify-center">
        <button
          v-for="(tab, idx) in props.tabs"
          :key="tab.label"
          @click="selectedTab = idx"
          :class="[
            'py-1 px-1 font-semibold focus:outline-none transition-colors duration-200 cursor-pointer',
            'rounded-t-lg',
            selectedTab === idx
              ? 'bg-blue-100 dark:bg-blue-900 border-b-2 border-blue-600 text-blue-600 dark:border-blue-400 dark:text-blue-400'
              : 'bg-gray-100 dark:bg-gray-800 text-gray-500 hover:text-blue-600 dark:text-gray-400 dark:hover:text-blue-400',
          ]"
          type="button"
        >
          {{ tab.label }}
        </button>
      </div>
    </div>
    <transition name="list-fade" mode="out-in" appear>
      <div :key="selectedTab" class="space-y-4">
        <div
          v-for="event in props.tabs[selectedTab]?.events || []"
          :key="event.heading + event.time + event.location"
        >
          <EventItem :event="event">
            <template #time>{{ event.time }}</template>
            <template #heading>{{ event.heading }}</template>
            <template #location>{{ event.location }}</template>
            <span v-html="event.description"></span>
          </EventItem>
        </div>
      </div>
    </transition>
  </div>
</template>

<style scoped>
.list-fade-enter-active,
.list-fade-leave-active {
  transition:
    opacity 0.5s cubic-bezier(0.4, 0, 0.2, 1),
    transform 0.5s cubic-bezier(0.4, 0, 0.2, 1);
}
.list-fade-enter-from {
  opacity: 0;
  transform: translateY(-20px);
}
.list-fade-enter-to {
  opacity: 1;
  transform: translateY(0);
}
.list-fade-leave-from {
  opacity: 1;
  transform: translateY(0);
}
.list-fade-leave-to {
  opacity: 0;
  transform: translateY(20px);
}
</style>
