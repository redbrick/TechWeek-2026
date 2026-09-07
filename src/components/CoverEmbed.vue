<template>
  <div>
    <iframe
      v-if="isYouTube"
      class="aspect-video w-full rounded-lg"
      :src="embedSrc"
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

    <img v-else-if="urlID" :src="urlID" class="w-full rounded-lg" alt="Cover image" />

    <p v-else>Please provide a video or image URL in the URL query parameters.</p>
  </div>
</template>

<script>
export default {
  props: ["urlID"],
  computed: {
    isYouTube() {
      const url = this.urlID || ""
      return /youtube\.com|youtu\.be/.test(url)
    },
    embedSrc() {
      if (!this.urlID) return ""
      // Use the full URL as provided when it's a YouTube link.
      if (this.isYouTube) return this.urlID
      return ""
    },
  },
}
</script>
