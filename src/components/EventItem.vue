<template>
  <div class="flow-root max-w-3xl mx-auto sm:mt-5">
    <div class="-my-4 divide-y divide-gray-200 dark:divide-gray-700">
      <div class="flex flex-col gap-2 py-4 sm:gap-6 sm:flex-row items-start">
        <p
          class="text-base sm:text-lg font-normal text-gray-500 sm:text-right dark:text-gray-400 shrink-0"
        >
          <slot name="time"></slot>
        </p>
        <h3 class="text-base sm:text-lg font-semibold text-gray-900 dark:text-white flex-1 min-w-0">
          <a href="#" class="hover:underline wrap-break-word"><slot name="heading"></slot></a>
        </h3>
        <p class="mt-1 text-xs sm:text-sm font-normal text-gray-500 dark:text-gray-400">
          <slot name="location"></slot>
        </p>
      </div>
    </div>
  </div>
</template>
