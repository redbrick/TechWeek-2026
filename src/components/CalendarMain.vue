<script setup>
import EventItem from './EventItem.vue'
import { ref } from 'vue'

// Example data structure for events grouped by date/location
const tabs = [
  {
    label: 'Wednesday-15th | Security',
    events: [
      {
        time: '15:00',
        heading: 'Documentation',
        location: 'LG26',
        description: `Vue’s\n<a href="https://vuejs.org/" target="_blank" rel="noopener">official documentation</a>\nprovides you with all information you need to get started.`,
      },
    ],
  },
  {
    label: 'Thursday-15th | Security',
    events: [
      {
        time: '15:00',
        heading: '1Documentation',
        location: 'LG26',
        description: `Vue’s\n<a href="https://vuejs.org/" target="_blank" rel="noopener">official documentation</a>\nprovides you with all information you need to get started.`,
      },
      {
        time: '15:00',
        heading: '1Documentation',
        location: 'LG26',
        description: `Vue’s\n<a href="https://vuejs.org/" target="_blank" rel="noopener">official documentation</a>\nprovides you with all information you need to get started.`,
      },
      {
        time: '15:00',
        heading: '1Documentation',
        location: 'LG26',
        description: `Vue’s\n<a href="https://vuejs.org/" target="_blank" rel="noopener">official documentation</a>\nprovides you with all information you need to get started.`,
      },
      {
        time: '15:00',
        heading: '1Documentation',
        location: 'LG26',
        description: `Vue’s\n<a href="https://vuejs.org/" target="_blank" rel="noopener">official documentation</a>\nprovides you with all information you need to get started.`,
      },
      {
        time: '15:00',
        heading: '1Documentation',
        location: 'LG26',
        description: `Vue’s\n<a href="https://vuejs.org/" target="_blank" rel="noopener">official documentation</a>\nprovides you with all information you need to get started.`,
      },
      {
        time: '15:00',
        heading: '1Documentation',
        location: 'LG26',
        description: `Vue’s\n<a href="https://vuejs.org/" target="_blank" rel="noopener">official documentation</a>\nprovides you with all information you need to get started.`,
      },
    ],
  },
]

const selectedTab = ref(0)
</script>

<template>
  <div class="w-full max-w-3xl mx-auto">
    <!-- Tab Navigation -->
    <div class="flex border-b border-gray-200 dark:border-gray-700 mb-4 justify-center">
      <button
        v-for="(tab, idx) in tabs"
        :key="tab.label"
        @click="selectedTab = idx"
        :class="[
          'py-2 px-4 -mb-px font-semibold focus:outline-none',
          selectedTab === idx
            ? 'border-b-2 border-blue-600 text-blue-600 dark:border-blue-400 dark:text-blue-400'
            : 'text-gray-500 hover:text-blue-600 dark:text-gray-400 dark:hover:text-blue-400',
        ]"
        type="button"
      >
        {{ tab.label }}
      </button>
    </div>

    <!-- Tab Content with Animation (fix snap) -->
    <transition name="list-fade" mode="out-in" appear>
      <div :key="selectedTab" class="space-y-4">
        <div
          v-for="event in tabs[selectedTab].events"
          :key="event.heading + event.time + event.location"
        >
          <EventItem>
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
