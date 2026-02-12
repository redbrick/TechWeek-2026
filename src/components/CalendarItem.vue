<template>
  <section
    class="bg-white dark:bg-gray-900 antialiased border-s border-gray-200 dark:border-gray-700"
  >
    <div class="max-w-screen-xl px-4 py-8 mx-auto lg:px-6">
      <div class="max-w-3xl mx-auto">
        <button
          @click="open = !open"
          class="flex cursor-pointer items-center w-full text-4xl font-extrabold leading-tight tracking-tight text-gray-900 dark:text-white focus:outline-none"
        >
          <svg
            :class="{ 'rotate-180': open, 'rotate-0': !open }"
            class="w-6 h-6 ml-2 transition-transform pr-2"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M19 9l-7 7-7-7"
            />
          </svg>
          {{ title }}
        </button>
      </div>
      <transition name="expand-fade">
        <div
          v-show="open"
          class="overflow-hidden inset-shadow-sm rounded-lg bg-white dark:bg-gray-800"
        >
          <slot></slot>
        </div>
      </transition>
    </div>
  </section>
</template>

<script>
export default {
  props: ['title'],
  data() {
    return {
      open: false,
    }
  },
}
</script>

<style scoped>
.expand-fade-enter-active,
.expand-fade-leave-active {
  transition:
    max-height 0.7s linear,
    opacity 0.3s linear;
}
.expand-fade-enter-from,
.expand-fade-leave-to {
  max-height: 0;
  opacity: 0;
}
.expand-fade-enter-to,
.expand-fade-leave-from {
  max-height: 1000px; /* Adjust as needed for your content */
  opacity: 1;
}
</style>
