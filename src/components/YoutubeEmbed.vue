<template>
  <div>
    <iframe
      v-if="urlID"
      class="aspect-video w-full rounded-lg"
      :src="`${urlID}`"
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
  props: ["urlID"],
}
</script>
