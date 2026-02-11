<!-- Get argument from url -->

<template>
  <div>
    <iframe
      v-if="urlID"
      class="w-100 h-80"
      :src="`https://www.youtube.com/embed/${urlID}`"
      title="YouTube video player"
      frameborder="0"
      allow="
        accelerometer;
        autoplay;
        clipboard-write;
        encrypted-media;
        gyroscope;
        picture-in-picture;
        web-share;
      "
      referrerpolicy="strict-origin-when-cross-origin"
      allowfullscreen
    ></iframe>
    <p v-else>Please provide a videoId in the URL query parameters.</p>
  </div>
</template>

<script>
export default {
  props: ['urlID'],
}
</script>
