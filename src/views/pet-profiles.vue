<template>
  <div>
    <nav class="nav-container" :class="{ 'nav-scrolled': hasScrolled }">
      <div class="logo-container">
        <div class="logo-image">
          <img src="/Designer.png" alt="Pawfect" width="40" height="40">
        </div>
        <span class="logo-text">PAWFECT</span>
      </div>
      <div class="nav-links-container">
        <transition name="fade">
          <div v-if="mobileMenuOpen || !isMobile" class="nav-links" :class="{ 'mobile-active': mobileMenuOpen }">
            <a href="home" class="nav-link" @click="closeMenuIfMobile">Home</a>
            <a href="pet-profiles" class="nav-link" @click="closeMenuIfMobile">Pet Profiles</a>
            <div class="dropdown">
              <a href="#" class="nav-link dropdown-toggle" @click="toggleDropdown">
                Resources <span class="dropdown-arrow" :class="{ 'arrow-rotated': dropdownOpen }">▼</span>
              </a>
              <transition name="slide-fade">
                <div v-if="isMobile && dropdownOpen" class="dropdown-content mobile">
                  <a href="training" @click="closeMenuIfMobile">Training Tips</a>
                  <a href="#" @click="closeMenuIfMobile">Health Guides</a>
                  <a href="#" @click="closeMenuIfMobile">Pet Care</a>
                </div>
              </transition>
              <div v-if="!isMobile" class="dropdown-content desktop">
                <a href="training">Training Tips</a>
                <a href="#">Health Guides</a>
                <a href="#">Pet Care</a>
              </div>
            </div>
            <a href="donations" class="nav-link" @click="closeMenuIfMobile">Donation</a>
            <a href="#" class="nav-link" @click="closeMenuIfMobile">Contact</a>
          </div>
        </transition>
      </div>
      <div class="right-section">
        <div class="user-icon" role="button" aria-label="User profile" tabindex="0">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
            <circle cx="12" cy="7" r="4"></circle>
          </svg>
        </div>
        <button class="mobile-menu-toggle" aria-label="Toggle menu" @click="toggleMobileMenu">
          <div class="bar" :class="{ 'bar-1-active': mobileMenuOpen }"></div>
          <div class="bar" :class="{ 'bar-2-active': mobileMenuOpen }"></div>
          <div class="bar" :class="{ 'bar-3-active': mobileMenuOpen }"></div>
        </button>
      </div>
    </nav>
    <div class="pet-profiles-container">
      <h1>Pet Profiles</h1>
      <div class="pet-grid">
        <div v-for="pet in pets" :key="pet.id" class="pet-card">
          <img :src="pet.image" :alt="pet.name" class="pet-img" />
          <h2>{{ pet.name }}</h2>
          <p class="pet-breed">{{ pet.breed }} &bull; {{ pet.age }}</p>
          <p class="pet-desc">{{ pet.background }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'PetProfiles',
  data() {
    return {
      mobileMenuOpen: false,
      dropdownOpen: false,
      isMobile: false,
      hasScrolled: false,
      pets: [],
      loading: false,
      error: null
    };
  },
  async created() {
    await this.fetchPets();
  },
  mounted() {
    this.checkScreenSize();
    window.addEventListener('resize', this.checkScreenSize);
    window.addEventListener('scroll', this.handleScroll);
  },
  beforeUnmount() {
    window.removeEventListener('resize', this.checkScreenSize);
    window.removeEventListener('scroll', this.handleScroll);
  },
  methods: {
    async fetchPets() {
      this.loading = true;
      this.error = null;
      try {
        const response = await axios.get('http://localhost:5000/api/pets');
        this.pets = response.data;
      } catch (err) {
        this.error = 'Failed to load pets. Please try again later.';
        console.error('Error fetching pets:', err);
      } finally {
        this.loading = false;
      }
    },
    toggleMobileMenu() {
      this.mobileMenuOpen = !this.mobileMenuOpen;
      if (!this.mobileMenuOpen) {
        this.dropdownOpen = false;
      }
      document.body.style.overflow = this.mobileMenuOpen ? 'hidden' : '';
    },
    toggleDropdown(event) {
      if (this.isMobile) {
        event.preventDefault();
        this.dropdownOpen = !this.dropdownOpen;
      }
    },
    closeMenuIfMobile() {
      if (this.isMobile) {
        this.mobileMenuOpen = false;
        this.dropdownOpen = false;
        document.body.style.overflow = '';
      }
    },
    checkScreenSize() {
      this.isMobile = window.innerWidth <= 768;
      if (!this.isMobile) {
        this.mobileMenuOpen = false;
        this.dropdownOpen = false;
        document.body.style.overflow = '';
      }
    },
    handleScroll() {
      this.hasScrolled = window.scrollY > 20;
    },
  },
};
</script>

<style scoped>
/* Navigation bar styles (copied from home.vue) */
.nav-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #F9A826;
  padding: 0.75rem 2rem;
  color: white;
  position: sticky;
  top: 0;
  left: 0;
  right: 0;
  width: 100%;
  z-index: 1000;
  transition: all 0.3s ease;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}
.nav-scrolled {
  padding: 0.5rem 2rem;
  background-color: rgba(249, 168, 38, 0.95);
  backdrop-filter: blur(10px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}
.logo-container {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}
.logo-image {
  display: flex;
  align-items: center;
  justify-content: center;
  transition: transform 0.3s ease;
}
.logo-container:hover .logo-image {
  transform: scale(1.1) rotate(5deg);
}
.logo-text {
  font-size: 1.75rem;
  font-weight: 800;
  letter-spacing: 1.5px;
  color: white;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
  transition: transform 0.3s ease;
}
.logo-container:hover .logo-text {
  transform: translateX(3px);
}
.nav-links-container {
  flex: 1;
  display: flex;
  justify-content: center;
}
.nav-links {
  display: flex;
  gap: 2rem;
  align-items: center;
}
.nav-link {
  color: white;
  text-decoration: none;
  font-size: 1.1rem;
  font-weight: 600;
  position: relative;
  padding: 0.5rem 0;
  transition: all 0.2s ease;
}
.nav-link:after {
  content: '';
  position: absolute;
  width: 0;
  height: 2px;
  bottom: 0;
  left: 0;
  background-color: white;
  transition: width 0.3s ease;
}
.nav-link:hover:after {
  width: 100%;
}
.dropdown {
  position: relative;
}
.dropdown-arrow {
  font-size: 0.7rem;
  vertical-align: middle;
  margin-left: 4px;
  transition: transform 0.3s ease;
}
.arrow-rotated {
  transform: rotate(180deg);
}
.dropdown-content {
  min-width: 180px;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
  overflow: hidden;
  z-index: 1;
}
.dropdown-content.desktop {
  display: none;
  position: absolute;
  top: 100%;
  left: 50%;
  transform: translateX(-50%);
  margin-top: 0.75rem;
  background-color: white;
  opacity: 0;
  pointer-events: none;
  transition: all 0.3s ease;
}
.dropdown:hover .dropdown-content.desktop {
  display: block;
  opacity: 1;
  pointer-events: auto;
}
.dropdown-content a {
  padding: 0.75rem 1rem;
  text-decoration: none;
  display: block;
  transition: all 0.2s ease;
}
.dropdown-content.desktop a {
  color: #333;
  font-weight: 500;
}
.dropdown-content.desktop a:hover {
  background-color: #f8f8f8;
  padding-left: 1.25rem;
}
.dropdown-content.mobile {
  background-color: rgba(255, 255, 255, 0.1);
  border-radius: 8px;
  margin-top: 0.5rem;
}
.dropdown-content.mobile a {
  color: white;
  padding: 0.75rem 1.5rem;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}
.dropdown-content.mobile a:last-child {
  border-bottom: none;
}
.right-section {
  display: flex;
  align-items: center;
  gap: 1.5rem;
}
.user-icon {
  color: white;
  cursor: pointer;
  width: 36px;
  height: 36px;
  background-color: rgba(255, 255, 255, 0.2);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s ease;
}
.user-icon:hover {
  transform: scale(1.1);
  background-color: rgba(255, 255, 255, 0.3);
}
.mobile-menu-toggle {
  display: none;
  flex-direction: column;
  justify-content: space-between;
  width: 28px;
  height: 20px;
  background: transparent;
  border: none;
  cursor: pointer;
  padding: 0;
  z-index: 10;
}
.bar {
  height: 3px;
  width: 100%;
  background-color: white;
  border-radius: 10px;
  transition: all 0.3s ease-in-out;
}
.bar-1-active {
  transform: translateY(8px) rotate(45deg);
}
.bar-2-active {
  opacity: 0;
}
.bar-3-active {
  transform: translateY(-8px) rotate(-45deg);
}
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s ease;
}
.fade-enter-from, .fade-leave-to {
  opacity: 0;
}
.slide-fade-enter-active, .slide-fade-leave-active {
  transition: all 0.3s ease;
}
.slide-fade-enter-from, .slide-fade-leave-to {
  transform: translateY(-20px);
  opacity: 0;
}
@media (max-width: 900px) {
  .nav-links {
    gap: 1.5rem;
  }
}
@media (max-width: 768px) {
  .nav-container {
    padding: 0.75rem 1.25rem;
  }
  .logo-text {
    font-size: 1.5rem;
  }
  .mobile-menu-toggle {
    display: flex;
  }
  .nav-links-container {
    position: static;
  }
  .nav-links {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: #F9A826;
    padding: 2rem;
    gap: 1.5rem;
    z-index: 5;
    transition: all 0.3s ease;
    overflow-y: auto;
    padding-top: 5rem;
    width: 100vw;
    margin: 0;
  }
  .mobile-active {
    animation: slideIn 0.3s forwards;
  }
  .nav-link {
    font-size: 1.3rem;
  }
  .nav-link:after {
    height: 3px;
  }
}
@media (max-width: 480px) {
  .nav-container {
    padding: 0.75rem 1rem;
  }
  .logo-text {
    font-size: 1.3rem;
  }
  .user-icon {
    width: 32px;
    height: 32px;
  }
  .nav-links {
    padding: 1.5rem;
    gap: 1.25rem;
  }
}
/* Pet profiles styles (as before) */
.pet-profiles-container {
  max-width: 1100px;
  margin: 2rem auto;
  padding: 2rem;
  background: #fff;
  border-radius: 16px;
  box-shadow: 0 4px 24px rgba(0,0,0,0.08);
}
.pet-profiles-container h1 {
  text-align: center;
  color: #f7871f;
  margin-bottom: 2rem;
}
.pet-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 2rem;
}
.pet-card {
  background: #f7f7f7;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.04);
  padding: 1.5rem 1rem 1rem 1rem;
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.pet-img {
  width: 120px;
  height: 120px;
  object-fit: cover;
  border-radius: 50%;
  margin-bottom: 1rem;
  border: 4px solid #fff6e9;
  box-shadow: 0 2px 8px rgba(0,0,0,0.06);
}
.pet-card h2 {
  margin: 0.5rem 0 0.2rem 0;
  color: #f7871f;
  font-size: 1.3rem;
}
.pet-breed {
  color: #888;
  font-size: 1rem;
  margin-bottom: 0.7rem;
}
.pet-desc {
  color: #444;
  font-size: 0.98rem;
  margin-bottom: 0.5rem;
}
.loading {
  text-align: center;
  padding: 2rem;
  color: #f7871f;
  font-size: 1.2rem;
}

.error {
  text-align: center;
  padding: 2rem;
  color: #ff5252;
  font-size: 1.2rem;
}
</style>