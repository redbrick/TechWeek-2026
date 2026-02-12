<script setup>
import CalendarItem from './CalendarItem.vue'
import EventItem from './EventItem.vue'

const openReadmeInEditor = () => fetch('/__open-in-editor?file=README.md')
</script>

<template>
  <CalendarItem title="Wednesday-15th | Security">
    <EventItem>
      <template #time> 15:00 </template>
      <template #heading>Documentation</template>
      <template #location>LG26</template>

      Vue’s
      <a href="https://vuejs.org/" target="_blank" rel="noopener">official documentation</a>
      provides you with all information you need to get started.
    </EventItem>
  </CalendarItem>
  <CalendarItem title="Thusday-15th | Security">
    <EventItem>
      <template #time> 15:00 </template>
      <template #heading>Documentation</template>
      <template #location>LG26</template>

      Vue’s
      <a href="https://vuejs.org/" target="_blank" rel="noopener">official documentation</a>
      provides you with all information you need to get started.
    </EventItem>
  </CalendarItem>
</template>
