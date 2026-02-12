<template>
  <section class="bg-white dark:bg-gray-900 antialiased">
    <div class="max-w-screen-xl px-4 py-8 mx-auto lg:px-6 sm:py-16 lg:py-24">
      <div class="max-w-3xl mx-auto text-center">
        <button
          @click="open = !open"
          class="flex items-center justify-center w-full text-4xl font-extrabold leading-tight tracking-tight text-gray-900 dark:text-white focus:outline-none"
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
      <transition name="fade">
        <div v-show="open">
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
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
.fade-enter-to,
.fade-leave-from {
  opacity: 1;
}
/* ...existing styles... */
</style>
