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
            <a href="home"  class="nav-link" @click="closeMenuIfMobile">Home</a>
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
            <a href="stories" class="nav-link" @click="closeMenuIfMobile">About</a>
          </div>
        </transition>
      </div>

      <div class="right-section">
        <div class="user-icon" role="button" aria-label="User   profile" tabindex="0">
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
    <!-- Hero Section -->
    <section class="hero">
      <div class="hero-content">
        <h1>Find Your Perfect Furry Friend</h1>
        <p>Adopt, don't shop. Give a loving home to pets in need.</p>
        <a href="Pet-profiles" class="btn">Browse Pets</a>
      </div>
    </section>

    <!-- Featured Pets -->
    <section class="featured-pets">
      <div class="container">
        <h2 class="section-title">Featured Pets</h2>
        <div class="pets-grid">
          <div class="pet-card" v-for="pet in pets" :key="pet.id">
            <img :src="pet.image" :alt="pet.name">
            <div class="pet-info">
              <h3>{{ pet.name }}</h3>
              <p><strong>Breed:</strong> {{ pet.breed }}</p>
              <p><strong>Age:</strong> {{ pet.age }}</p>
              <p><strong>Gender:</strong> {{ pet.gender }}</p>
              <router-link to="/pet-profile" class="btn">Meet {{ pet.name }}</router-link>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Adoption Process -->
    <section class="adoption-process">
      <div class="container">
        <h2 class="section-title">Our Adoption Process</h2>
        <div class="process-steps">
          <div class="step" v-for="(step, index) in steps" :key="index">
            <div class="step-number">{{ index + 1 }}</div>
            <h3>{{ step.title }}</h3>
            <p>{{ step.description }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Location Map Section -->
    <section class="location-section">
      <div class="container">
        <h2 class="section-title">Find Us</h2>
        <div class="map-container">
          <div class="map-info">
            <h3>Angeles Pet Care</h3>
            <p>Visit our shelter to meet our lovely pets in person!</p>
            <div class="location-details">
              <p><strong>Address:</strong> Angeles City, Pampanga, Philippines</p>
              <p><strong>Hours:</strong> Monday - Sunday, 9:00 AM - 6:00 PM</p>
              <p><strong>Contact:</strong> (123) 456-7890</p>
            </div>
          </div>
          <div class="map-wrapper">
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3856.9007861381824!2d120.27661631367312!3d14.830825354692275!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3396711bd51280cb%3A0x9807796767f2153d!2sAngeles%20Pet%20Care!5e0!3m2!1sen!2sph!4v1747207650130!5m2!1sen!2sph"
              width="100%"
              height="450"
              style="border:0;"
              allowfullscreen=""
              loading="lazy"
              referrerpolicy="no-referrer-when-downgrade">
            </iframe>
          </div>
        </div>
      </div>
    </section>


    <!-- Footer -->
    <footer class="footer">
      <div class="container">
        <div class="footer-content">
          <div class="footer-section about">
            <h3>Paws & Hearts</h3>
            <p>Dedicated to finding loving homes for pets in need since 2010.</p>
          </div>
          <div class="footer-section links">
            <h3>Quick Links</h3>
            <ul>
              <li><a href="#">Home</a></li>
              <li><a href="#">Available Pets</a></li>
              <li><a href="#">Adoption Process</a></li>
              <li><a href="#">Contact Us</a></li>
            </ul>
          </div>
          <div class="footer-section contact">
            <h3>Contact Us</h3>
            <p>123 Pet Lane, Animal City</p>
            <p>(123) 456-7890</p>
            <p>info@pawsandhearts.org</p>
          </div>
        </div>
      </div>
      <div class="footer-bottom">
        <p>&copy; 2023 Paws & Hearts. All rights reserved.</p>
      </div>
    </footer>
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      mobileMenuOpen: false,
      dropdownOpen: false,
      isMobile: false,
      hasScrolled: false,
      pets: [
        {
          id: 1,
          name: 'Babi',
          breed: 'Chiwawa',
          age: '2 years',
          gender: 'Male',
          image: '/Img/dog4.jpg'
        },
        {
          id: 2,
          name: 'Luna',
          breed: 'Siamese Cat',
          age: '1.5 years',
          gender: 'Female',
          image: '/Img/cat3.jpg'
        },
        {
          id: 3,
          name: 'Rocky',
          breed: 'Beagle',
          age: '3 years',
          gender: 'Male',
          image: '/Img/dog5.jpg'
        },
        {
          id: 4,
          name: 'Tilapya',
          breed: 'Persian Cat',
          age: '4 months',
          gender: 'Female',
          image: '/Img/cat4.jpg'
        }
      ],
      steps: [
        {
          title: 'Browse Available Pets',
          description: 'View our gallery of pets looking for their forever homes.'
        },
        {
          title: 'Submit Application',
          description: 'Fill out our adoption application form online.'
        },
        {
          title: 'Meet & Greet',
          description: 'Schedule a visit to meet your potential new pet.'
        },
        {
          title: 'Home Check',
          description: 'We ensure your home is a safe environment for the pet.'
        },
        {
          title: 'Finalize Adoption',
          description: 'Complete paperwork and welcome your new family member!'
        }
      ],
      selectedAmount: null,
      customAmount: null,
      showCustomAmount: false,
    }
  },
  mounted() {
    this.checkScreenSize();
    window.addEventListener('resize', this.checkScreenSize);
    window.addEventListener('scroll', this.handleScroll);
    this.addGlobalStyles();
    this.loadExternalScripts();
  },
  beforeUnmount() {
    window.removeEventListener('resize', this.checkScreenSize);
    window.removeEventListener('scroll', this.handleScroll);
  },
  methods: {
    addGlobalStyles() {
      const style = document.createElement('style');
      style.innerHTML = `
        body {
          margin: 0;
          padding: 0;
          overflow-x: hidden;
        }
        html {
          box-sizing: border-box;
        }
        *, *:before, *:after {
          box-sizing: inherit;
        }
      `;
      document.head.appendChild(style);
    },
    loadExternalScripts() {
      const script1 = document.createElement('script');
      script1.src = 'https://cdn.botpress.cloud/webchat/v2.4/inject.js';
      document.head.appendChild(script1);

      const script2 = document.createElement('script');
      script2.src = 'https://files.bpcontent.cloud/2025/05/07/09/20250507090119-E9YC9Q2J.js';
      document.head.appendChild(script2);
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
  }
}
</script>

<style>
/* Global Styles */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}

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

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.btn {
  display: inline-block;
  padding: 10px 20px;
  background-color: #f7871f;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  text-decoration: none;
  transition: background-color 0.3s;
}

.btn:hover {
  background-color: #f27508;
}

.section-title {
  text-align: center;
  margin-bottom: 40px;
  font-size: 2rem;
  color: #333;
}

/* Header Styles */
.header {
  background-color: white;
  padding: 20px 0;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  position: sticky;
  top: 0;
  z-index: 100;
}

.header .container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo h1 {
  color: #ff6b6b;
  font-size: 1.8rem;
}

.nav ul {
  display: flex;
  list-style: none;
}

.nav ul li {
  margin-left: 30px;
}

.nav ul li a {
  text-decoration: none;
  color: #333;
  font-weight: 500;
  transition: color 0.3s;
}

.nav ul li a:hover {
  color: #ff6b6b;
}

/* Hero Section Styles */
.hero {
  background-image: url('/Img/cat2.jpg');
  background-size: cover;
  background-position: center;
  height: 500px;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  color: white;
  margin-bottom: 50px;
}

.hero-content {
  max-width: 800px;
  padding: 0 20px;
}

.hero h1 {
  font-size: 3rem;
  margin-bottom: 20px;
}

.hero p {
  font-size: 1.2rem;
  margin-bottom: 30px;
}

/* Featured Pets Styles */
.featured-pets {
  padding: 60px 0;
}

.pets-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 30px;
}

.pet-card {
  background-color: white;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s;
}

.pet-card:hover {
  transform: translateY(-10px);
}

.pet-card img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.pet-info {
  padding: 20px;
}

.pet-info h3 {
  margin-bottom: 10px;
  color: #333;
}

.pet-info p {
  margin-bottom: 8px;
  font-size: 0.9rem;
}

.pet-info .btn {
  margin-top: 15px;
  width: 100%;
  text-align: center;
}

/* Adoption Process Styles */
.adoption-process {
  background-color: #f0f7f4;
  padding: 80px 0;
  text-align: center;
}

.process-steps {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 30px;
  margin-top: 40px;
}

.step {
  flex: 1;
  min-width: 200px;
  max-width: 250px;
  background-color: white;
  padding: 30px 20px;
  border-radius: 10px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.step-number {
  width: 50px;
  height: 50px;
  background-color: #fe7b01;
  color: white;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  font-weight: bold;
  margin: 0 auto 20px;
}

.step h3 {
  margin-bottom: 15px;
  color: #333;
}

.step p {
  font-size: 0.9rem;
  color: #666;
}

/* Footer Styles */
.footer {
  background-color: #333;
  color: white;
  padding: 60px 0 0;
}

.footer-content {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 40px;
}

.footer-section {
  margin-bottom: 30px;
}

.footer-section h3 {
  margin-bottom: 20px;
  font-size: 1.3rem;
  color: #ed6916;
}

.footer-section p {
  margin-bottom: 15px;
}

.footer-section ul {
  list-style: none;
}

.footer-section ul li {
  margin-bottom: 10px;
}

.footer-section ul li a {
  color: #ddd;
  text-decoration: none;
  transition: color 0.3s;
}

.footer-section ul li a:hover {
  color: #fa6306;
}

.footer-bottom {
  background-color: #222;
  text-align: center;
  padding: 20px 0;
  margin-top: 40px;
}

.footer-bottom p {
  font-size: 0.9rem;
  color: #aaa;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
  .header .container {
    flex-direction: column;
  }

  .nav ul {
    margin-top: 20px;
  }

  .nav ul li {
    margin: 0 10px;
  }

  .hero h1 {
    font-size: 2.2rem;
  }

  .process-steps {
    flex-direction: column;
    align-items: center;
  }

  .step {
    width: 100%;
    max-width: 350px;
  }
}


/* Location Map Section Styles */
.location-section {
  padding: 80px 0;
  background-color: #fff;
}

.map-container {
  display: flex;
  gap: 40px;
  align-items: flex-start;
  margin-top: 40px;
}

.map-info {
  flex: 1;
  padding: 30px;
  background-color: #f8f9fa;
  border-radius: 10px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

.map-info h3 {
  color: #333;
  font-size: 1.8rem;
  margin-bottom: 20px;
}

.map-info p {
  color: #666;
  margin-bottom: 15px;
  line-height: 1.6;
}

.location-details {
  margin-top: 25px;
  padding-top: 25px;
  border-top: 1px solid #eee;
}

.location-details p {
  margin-bottom: 10px;
}

.map-wrapper {
  flex: 2;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

@media (max-width: 768px) {
  .map-container {
    flex-direction: column;
  }

  .map-info {
    order: 2;
  }

  .map-wrapper {
    order: 1;
    width: 100%;
  }

  .map-wrapper iframe {
    height: 350px;
  }
}
</style>