<script setup>
import CalendarMain from './components/CalendarMain.vue'
import TitleBlock from './components/TitleBlock.vue'
import YoutubeEmbed from './components/YoutubeEmbed.vue'
</script>

<template>
  <header class="flex flex-col justify-center gap-5">
    <TitleBlock />
    <YoutubeEmbed urlID="tipxfFOPdDo?si=fAco-y9XacPtvruK" />
  </header>

  <main>
    <CalendarMain />
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
