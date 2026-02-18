<script setup>
import ThemeToggle from "../components/ThemeToggle.vue"
import redbrickLogo from "../assets/redbrick.svg"
</script>

<template>
  <div
    class="min-h-screen w-full bg-gray-50 dark:bg-gray-900 flex items-center justify-center relative"
  >
    <ThemeToggle />
    <div class="w-full bg-white dark:bg-gray-800 rounded-lg shadow-md p-8 mt-3 mx-2">
      <h2 class="text-3xl font-bold mb-6 text-blue-700 dark:text-blue-300">
        Call for Talks: Techweek 2026
      </h2>
      <p class="mb-4 text-gray-700 dark:text-gray-200">
        Once again, <span class="font-semibold">Redbrick</span> is organising Techweek and looking
        for people to come and talk to our members. We'd like to hear from you! Talks we've had in
        the past can be found at
        <a href="https://techweek.dcu.ie" class="text-blue-600 underline">techweek.dcu.ie</a>. This
        year, we are looking for talks that fit the following themes:
      </p>
      <ul class="list-disc pl-6 mb-6 text-gray-700 dark:text-gray-200">
        <li>
          <span class="font-medium">Security</span>
          <span class="text-sm text-gray-500 dark:text-gray-400">(15/03/17)</span>
        </li>
        <li>
          <span class="font-medium">Development tools</span>
          <span class="text-sm text-gray-500 dark:text-gray-400">(22/03/2017)</span>
        </li>
        <li>
          <span class="font-medium">Mobile Development</span>
          <span class="text-sm text-gray-500 dark:text-gray-400">(29/03/2017)</span>
        </li>
      </ul>
      <h3 class="text-xl font-semibold mt-6 mb-2 text-blue-600 dark:text-blue-300">
        What do we want?
      </h3>
      <p class="mb-4 text-gray-700 dark:text-gray-200">
        We want people to come and talk to us! We'd love to hear about any relevant topic you're
        passionate about, or want to spread the word about. We're open to any ideas—if you have a
        talk that doesn't fit these themes but you want to give it anyway, let us know and we will
        organise something with you. Because the format of Techweek is a bit different this year, we
        are looking for speakers to come in on
        <span class="font-medium">Wednesday the 15th, 22nd, and 29th</span> at
        <span class="font-medium">3, 4, or 5pm</span>. If you think you have an idea for a talk,
        workshop, story, or demo, just email us at
        <a href="mailto:committee@redbrick.dcu.ie" class="text-blue-600 underline font-medium"
          >committee@redbrick.dcu.ie</a
        >
        with a short description and we'll see what we can organise.
      </p>
      <h3 class="text-xl font-semibold mt-6 mb-2 text-blue-600 dark:text-blue-300">Who are we?</h3>
      <p class="text-gray-700 dark:text-gray-200">
        <span class="font-semibold">Redbrick</span> is the Computer Networking society in DCU. We
        started in 1996, and since then we've been building a community of members with a common
        interest: all things tech. We aim to make a great environment to learn new skills and
        technologies and to meet other people with a common interest.
      </p>
      <img :src="redbrickLogo" alt="Redbrick Logo" class="w-37.5 m-auto mb-4 mt-4" />
    </div>
  </div>
</template>
