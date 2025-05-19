// src/router/index.js

import { createRouter, createWebHistory } from 'vue-router';
import Admin from '../views/Admin.vue';
import Contact from '../views/contact.vue';
import donations from '../views/donations.vue';
import HomeVue from '../views/home.vue';
import Login from '../views/login.vue';
import lostFound from '../views/lost&found.vue';
import News from '../views/News.vue';
import PetProfile from '../views/pet-profile.vue';
import PetProfiles from '../views/pet-profiles.vue';
import Signup from '../views/signup.vue';
import stories from '../views/stories.vue';
import training from '../views/training.vue';
const routes = [

  {
    path: '/home',
    name: 'home',
    component: HomeVue,
  },
  {
    path: '/pet-profile',
    name: 'petProfile',
    component: PetProfile,
  },
  {
    path: '/contact',
    name: 'contact',
    component: Contact,
  },
  {
    path: '/lost&found',
    name: 'lost&found',
    component: lostFound,
  },

  {
    path: '/news',
    name: 'news',
    component: News,
  },

  {
    path: '/donations',
    name: 'donations',
    component: donations,
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
  },
  {
    path: '/signup',
    name: 'signup',
    component: Signup,
  },


  {
    path: '/admin',
    name: 'admin',
    component: Admin,
  },
  {
    path: '/pet-profiles',
    name: 'petProfiles',
    component: PetProfiles,
  },

  {
    path: '/',
    redirect: '/home',
  },
  {
    path: '/training',
    name: 'training',
    component: training,
  },
  {
    path: '/stories',
    name: 'stories',
    component: stories,
  }


]

const router = createRouter({
history: createWebHistory(import.meta.env.BASE_URL),
routes,
})

export default router
