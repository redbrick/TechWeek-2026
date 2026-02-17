<template>
  <section
    class="bg-white dark:bg-gray-900 antialiased border-s border-gray-200 dark:border-gray-700"
  >
    <div class="max-w-7xl px-4 py-8 mx-auto lg:px-6">
      <div class="max-w-3xl mx-auto">
        <h2
          class="text-4xl font-extrabold leading-tight tracking-tight text-gray-900 dark:text-white"
        >
          {{ title }}
        </h2>
        <div class="mt-4">
          <slot></slot>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  props: ["title"],
}
</script>
