<template>
  <div class="min-h-screen bg-gray-900 text-white">
    <div class="max-w-4xl mx-auto p-6">
      <h1 class="text-2xl font-bold mb-4">Event JSON Editor</h1>
      <div class="mb-4 flex flex-wrap gap-2 items-center">
        <span class="font-semibold">Select year:</span>
        <select
          v-model="selectedFile"
          @change="loadJson"
          class="border rounded px-2 py-1 bg-gray-900"
        >
          <option v-for="file in jsonFiles" :key="file" :value="file">{{ file }}</option>
        </select>
        <button
          @click="createNewJson"
          class="ml-4 px-3 py-1 bg-green-600 text-white rounded cursor-pointer"
        >
          New JSON
        </button>
        <label class="ml-2 px-3 py-1 bg-gray-700 text-white rounded cursor-pointer">
          <span id="jsonFile">Upload JSON</span>
          <input type="file" accept=".json" @change="uploadJson" class="hidden" />
        </label>
        <button
          @click="downloadJson"
          class="ml-2 px-3 py-1 bg-blue-600 text-white rounded cursor-pointer"
          :disabled="!jsonData"
        >
          Download
        </button>
      </div>

      <div v-if="jsonData">
        <form @submit.prevent>
          <div class="mb-2">
            <label class="block font-semibold">Title</label>
            <input v-model="jsonData.title" class="border rounded px-2 py-1 w-full" />
          </div>
          <div class="mb-2">
            <label class="block font-semibold">Location</label>
            <input v-model="jsonData.location" class="border rounded px-2 py-1 w-full" />
          </div>
          <div class="mb-2 flex gap-2">
            <div>
              <label class="block font-semibold">Start</label>
              <input
                v-model.number="jsonData.start"
                type="number"
                class="border rounded px-2 py-1 w-20"
              />
            </div>
            <div>
              <label class="block font-semibold">End</label>
              <input
                v-model.number="jsonData.end"
                type="number"
                class="border rounded px-2 py-1 w-20"
              />
            </div>
            <div>
              <label class="block font-semibold">Month</label>
              <input v-model="jsonData.month" class="border rounded px-2 py-1 w-24" />
            </div>
            <div>
              <label class="block font-semibold">Year</label>
              <input
                v-model.number="jsonData.year"
                type="number"
                class="border rounded px-2 py-1 w-24"
              />
            </div>
          </div>
          <div class="mb-2">
            <label class="block font-semibold">Live</label>
            <input v-model="jsonData.live" class="border rounded px-2 py-1 w-full" />
          </div>
          <div class="mb-2">
            <label class="block font-semibold">Video</label>
            <input v-model="jsonData.video" class="border rounded px-2 py-1 w-full" />
          </div>
          <div class="mb-4">
            <label class="block font-semibold">Days & Events</label>
            <div v-for="(day, dIdx) in jsonData.days" :key="dIdx" class="border rounded p-2 mb-2">
              <div class="flex flex-col md:flex-row gap-2 mb-1">
                <input
                  v-model="day.day"
                  class="border rounded px-2 py-1 w-full md:w-40"
                  placeholder="Day"
                />
                <input
                  v-model="day.description"
                  class="border rounded px-2 py-1 w-full md:w-60"
                  placeholder="Description"
                />
                <button
                  @click.prevent="removeDay(dIdx)"
                  class="text-red-600 cursor-pointer md:ml-2"
                >
                  Remove Day
                </button>
              </div>
              <div class="ml-0 md:ml-4">
                <div
                  v-for="(event, eIdx) in day.events"
                  :key="eIdx"
                  class="mb-4 p-4 rounded bg-gray-700 flex flex-col md:grid md:grid-cols-2 gap-4"
                >
                  <div class="flex flex-col gap-2">
                    <input
                      v-model="event.name"
                      class="border rounded px-2 py-1 w-full"
                      placeholder="Event Name"
                    />
                    <input
                      v-model="event.by"
                      class="border rounded px-2 py-1 w-full"
                      placeholder="By"
                    />
                    <input
                      v-model="event.time"
                      class="border rounded px-2 py-1 w-full"
                      placeholder="Time"
                    />
                    <input
                      v-model="event.place.id"
                      class="border rounded px-2 py-1 w-full"
                      placeholder="Place ID"
                    />
                    <input
                      v-model="event.place.map"
                      class="border rounded px-2 py-1 w-full"
                      placeholder="Map"
                    />
                  </div>
                  <div class="flex flex-col gap-2 h-full">
                    <label class="font-semibold">Description</label>
                    <textarea
                      v-model="event.description"
                      class="border rounded px-2 py-1 w-full min-h-20 resize-y"
                      placeholder="Description"
                    ></textarea>
                    <button
                      @click.prevent="removeEvent(dIdx, eIdx)"
                      class="text-red-600 cursor-pointer mt-2 self-end"
                    >
                      Remove
                    </button>
                  </div>
                </div>
                <button @click.prevent="addEvent(dIdx)" class="text-green-600 cursor-pointer mt-2">
                  + Add Event
                </button>
              </div>
            </div>
            <button @click.prevent="addDay" class="text-green-600 cursor-pointer mt-2">
              + Add Day
            </button>
          </div>
        </form>
      </div>
      <div v-else class="text-gray-500">Select a file or create a new one to begin.</div>
    </div>
  </div>
</template>

<script setup>
import { ref } from "vue"

const jsonFiles = ["2014.json", "2015.json", "2016.json", "2017.json"]
const selectedFile = ref("2014.json")
const jsonData = ref(null)

async function loadJson() {
  // Use dynamic import for local JSON files
  const year = selectedFile.value.replace(".json", "")
  try {
    const module = await import(`@/data/${year}.json`)
    jsonData.value = module.default
  } catch (e) {
    jsonData.value = null
    console.error("Failed to load JSON:", e)
  }
}

function createNewJson() {
  jsonData.value = {
    title: "",
    location: "",
    start: 1,
    end: 1,
    month: "",
    year: new Date().getFullYear(),
    live: "",
    archive: false,
    video: "",
    days: [],
  }
  selectedFile.value = ""
}

function addDay() {
  jsonData.value.days.push({ day: "", description: "", events: [] })
}
function removeDay(idx) {
  jsonData.value.days.splice(idx, 1)
}
function addEvent(dayIdx) {
  jsonData.value.days[dayIdx].events.push({
    name: "",
    by: "",
    time: "",
    place: { id: "", map: "" },
    description: "",
  })
}
function removeEvent(dayIdx, eventIdx) {
  jsonData.value.days[dayIdx].events.splice(eventIdx, 1)
}

function downloadJson() {
  const blob = new Blob([JSON.stringify(jsonData.value, null, 2)], { type: "application/json" })
  const url = URL.createObjectURL(blob)
  const a = document.createElement("a")
  a.href = url
  a.download = selectedFile.value || "new-event.json"
  a.click()
  URL.revokeObjectURL(url)
}

function uploadJson(event) {
  const file = event.target.files[0]
  if (file) {
    const reader = new FileReader()
    reader.onload = (e) => {
      try {
        jsonData.value = JSON.parse(e.target.result)
        selectedFile.value = file.name
        document.getElementById("jsonFile").textContent = file.name
        // Reset file input
        event.target.value = ""
      } catch {
        alert("Invalid JSON file")
      }
    }
    reader.readAsText(file)
  }
}

// Auto-load first file
if (!jsonData.value) loadJson()
</script>

<style scoped>
/* Add your styles here */
</style>
