<template>
  <div>
    <TransitionRoot as="template" :show="open">
      <Dialog
        class="fixed inset-0 z-60 flex items-center justify-center overflow-y-auto"
        @close="emit('close')"
      >
        <TransitionChild
          as="template"
          enter="ease-in-out duration-500"
          enter-from="opacity-0"
          enter-to="opacity-100"
          leave="ease-in-out duration-500"
          leave-from="opacity-100"
          leave-to="opacity-0"
        >
          <div class="fixed inset-0 bg-gray-900/50 transition-opacity"></div>
        </TransitionChild>

        <TransitionChild
          as="template"
          enter="transform transition ease-in-out duration-500"
          enter-from="translate-y-full opacity-0"
          enter-to="translate-y-0 opacity-100"
          leave="transform transition ease-in-out duration-500"
          leave-from="translate-y-0 opacity-100"
          leave-to="-translate-y-full opacity-0"
        >
          <DialogPanel
            class="relative w-full max-w-md max-h-[90vh] bg-gray-800 rounded-xl shadow-xl flex flex-col overflow-y-auto"
          >
            <button
              type="button"
              class="absolute top-4 right-4 rounded-md text-gray-400 hover:text-white focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-500 cursor-pointer"
              @click="emit('close')"
            >
              <span class="sr-only">Close panel</span>
              <XMarkIcon class="size-6" aria-hidden="true" />
            </button>
            <div class="px-6 pt-6 pb-4">
              <DialogTitle class="text-base font-semibold text-white">{{
                event.heading
              }}</DialogTitle>
            </div>
            <div class="relative flex-1 px-6 pb-6">
              <!-- Show any json field and value in event -->
              <div v-for="(value, key) in event" :key="key" class="mb-4">
                <h3 class="text-sm font-medium text-gray-400">{{ key }}</h3>
                <p class="mt-1 text-sm text-gray-200">{{ value }}</p>
              </div>
            </div>
          </DialogPanel>
        </TransitionChild>
      </Dialog>
    </TransitionRoot>
  </div>
</template>

<script setup>
import { Dialog, DialogPanel, DialogTitle, TransitionChild, TransitionRoot } from "@headlessui/vue"
import { XMarkIcon } from "@heroicons/vue/24/outline"
import { defineProps, defineEmits } from "vue"

defineProps({
  open: Boolean,
  event: {
    type: Array,
    required: true,
  },
})
const emit = defineEmits(["close"])
</script>
