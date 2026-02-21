import { createRouter, createWebHistory } from "vue-router"
import LiveSite from "../pages/LiveSite.vue"
import ComingSoonPage from "../pages/ComingSoonPage.vue"
import CallForTalks from "../pages/CallForTalks.vue"
import eventMaker from "../pages/tools/EventMaker.vue"

const isDevEnabled = import.meta.env.VITE_DEV === "true"

const routes = [
  { path: "/", component: LiveSite },
  { path: "/cft", component: CallForTalks },
  { path: "/soon", component: ComingSoonPage },
  { path: "/:pathMatch(.*)*", component: LiveSite },
  { path: "/tools/eventmake", component: eventMaker },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

router.beforeEach((to, from, next) => {
  if (isDevEnabled && to.path !== "/soon") {
    next("/soon")
  } else {
    next()
  }
})

export default router
