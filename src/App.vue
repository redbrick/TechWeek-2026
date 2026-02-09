<script setup>
import TheWelcome from './components/TheWelcome.vue'
</script>

<template>
  <header>
    <div
      class="wrapper flex flex-col items-center text-center bg-red-600 text-white p-8 rounded-lg shadow-lg mt-8"
    >
      <h1 class="text-4xl font-bold mb-2">Tech Week</h1>
      <p class="text-lg mb-0">Dublin City University 15 - 29 March 2017</p>
    </div>
  </header>

  <main>
    <TheWelcome />
  </main>
</template>

<style scoped>
header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }
}
</style>
