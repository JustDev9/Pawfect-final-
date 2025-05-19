<template>
    <div>
      <!-- Navigation Bar -->
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
              <a href="donations" class="nav-link active" @click="closeMenuIfMobile">Donation</a>
              <a href="contact" class="nav-link" @click="closeMenuIfMobile">Contact</a>
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

      <div class="donation-container">
        <!-- Donation Header Section -->
        <div class="donation-header">
          <div class="label">Make a Difference</div>
          <h1 class="title">Donate to Pawfect</h1>
          <p class="description">
            Your donation helps us provide care, shelter, and find loving homes for pets in need.
            Every contribution makes a difference in an animal's life. Together, we can create a better
            world for our furry friends.
          </p>
          <button class="donate-btn">Donate now</button>
        </div>

        <!-- Donation Information Section -->
        <div class="donations-card">
          <div class="donations-info">
            <h2 class="donations-title">Donations List</h2>
            <div class="account-info">
              <p><strong>Account Name:</strong></p>
              <p>PawfectMatch, Inc.</p>
            </div>
            <div class="account-info">
              <p><strong>BPI Account Number:</strong></p>
              <p>1234-5678-9012</p>
            </div>
            <div class="account-info">
              <p><strong>BDO Account Number:</strong></p>
              <p>9876-5432-1098</p>
            </div>
          </div>
          <div class="qr-section">
            <div class="qr-container">
              <div class="gcash-header">
                <div class="gcash-logo-text">G</div>
                <p>SCAN TO DONATE</p>
              </div>
              <div class="qr-code-placeholder">
                <img src="/Img/qr.jpg" alt="Pawfect" width="100%" height="100%">
              </div>
            </div>
          </div>
        </div>

        <!-- Volunteer Section -->
        <div class="volunteer-card">
          <div class="volunteer-header">Become a volunteer</div>
          <p class="volunteer-text">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt porta orci, non porttitor lobortis.
            Nullam efficace congue lorem sit finibus enim tristiquam hendrerit vel risps, eu feugiat. Maecenas
            cursus lorem eget tempus convallis.
          </p>
          <p class="volunteer-text">
            Aenean ornare nulla ac mollis euismod. Interdum et malesuada fames ac ante ipsum primis in faucibus.
            Proin rutrum libero consequat, suscipit sem non, vestibulum ipsum. Mauris venenatis vestibulum nunc a
            tempus.
          </p>
        </div>

        <!-- Updated Pet Beneficiaries Section -->
        <div class="pet-beneficiaries-section">
          <h2 class="beneficiaries-title">Pet Beneficiaries</h2>
          <div class="beneficiaries-container">
            <div class="image-gallery">
              <!-- Left Column (tall featured image + smaller image below) -->
              <div class="gallery-left">
                <div class="feature-image">
                  <img src="/Img/dog2.png" alt="Featured pet" class="placeholder-img">
                  <div class="image-overlay">
                    <p class="overlay-text">Featured Pet</p>
                  </div>
                </div>
                <div class="small-image">
                  <img src="/Img/dog1.png" alt="Pet image" class="placeholder-img">
                  <div class="image-overlay">
                    <p class="overlay-text">Rescued</p>
                  </div>
                </div>
              </div>

              <!-- Right Side (2 rows) -->
              <div class="gallery-right">
                <!-- Top Row (image + text box) -->
                <div class="gallery-top">
                  <div class="medium-image">
                    <img src="/Img/dog3.png" alt="Pet image" class="placeholder-img">
                    <div class="image-overlay">
                      <p class="overlay-text">Medical Care</p>
                    </div>
                  </div>
                  <div class="content-box">
                    <p class="beneficiary-text">
                      Your donations help us provide essential medical care, food, and shelter to pets in need.
                      Every contribution goes directly towards improving the lives of our furry friends and helping
                      them find their forever homes.
                    </p>
                    <button class="btn-label">Help Our Pets</button>
                  </div>
                </div>

                <!-- Bottom Row (two images side by side) -->
                <div class="bottom-row">
                  <div class="medium-image">
                    <img src="/Img/dog4.jpg" alt="Pet image" class="placeholder-img">
                    <div class="image-overlay">
                      <p class="overlay-text">Adoption Ready</p>
                    </div>
                  </div>
                  <div class="medium-image">
                    <img src="/Img/dog5.jpg" alt="Pet image" class="placeholder-img">
                    <div class="image-overlay">
                      <p class="overlay-text">Special Needs</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="browse-container">
      <div class="browse-left">
        <h2>Browse More Pet<span>!</span></h2>
        <p>
          Lorem ipsum dolor sit amet consectetur. Tortor nec enim lorem adipiscing cursus massa nisl.
          Purus consectetur risus pellentesque integer a sed suspendisse. Uma aliquam pellentesque nam ornare.
          Dui cursus sit ornare dolor turpis in.
        </p>
        <div class="button-group">
          <button class="btn primary">Browse Pets</button>
        </div>
      </div>
      <div class="browse-right">
        <div class="image-box">
          <img src="https://via.placeholder.com/60" alt="Pet Icon" />
        </div>
        <div class="counter-box">
          <div class="count">17</div>
          <div class="label">Number of Pets</div>
        </div>
      </div>
    </div>
        </div>
      </div>
    </div>
    <!-- Footer Section -->
  <footer class="footer">
    <div class="footer-container">
      <div class="footer-column logo-column">
        <img src="/public/Designer.png" alt="Pawfect" width="40" height="40">
        <span class="Footer-logo-text">PAWFECT</span>
        <p class="footer-description">Helping paws find their forever home.</p>
      </div>
      <div class="footer-column">
        <h4>Quick Links</h4>
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="#">Pet Profiles</a></li>
          <li><a href="#">Resources</a></li>
          <li><a href="#">Donate</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
      </div>
      <div class="footer-column">
        <h4>Contact</h4>
        <p>Email: support@pawfect.com</p>
        <p>Phone: +123 456 7890</p>
        <p>Location: Gordon College, Olongapo</p>
      </div>
    </div>
    <div class="footer-bottom">
      <p>&copy; 2025 PawfectMatch, Inc. All rights reserved.</p>
    </div>
  </footer>

  </template>

  <script>
  export default {
    name: 'DonationPage',
    data() {
      return {
        mobileMenuOpen: false,
        dropdownOpen: false,
        isMobile: false,
        hasScrolled: false
      }
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
      }
    }
  }
  </script>

  <style>
  * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  /* Navigation Bar Styles */
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

  .nav-link.active {
    color: #fff;
    font-weight: 700;
  }

  .nav-link.active:after {
    content: '';
    position: absolute;
    width: 100%;
    height: 2px;
    bottom: 0;
    left: 0;
    background-color: white;
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

  /* Donation page styles */
  .donation-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 2rem 1.5rem;
    display: flex;
    flex-direction: column;
    gap: 2rem;
  }

  /* Donation Header Section */
  .donation-header {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
    max-width: 700px;
    margin: 0 auto;
    text-align: center;
    padding: 2rem 1rem;
    background: linear-gradient(to right, #f9f9fb, #f1f2f6);
    border-radius: 16px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.05);
    position: relative;
    overflow: hidden;
  }

  .donation-header::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 5px;
    background: linear-gradient(to right, #F9A826, #FFD166);
  }

  .label {
    color: #4B6584;
    font-size: 1rem;
    text-transform: uppercase;
    letter-spacing: 3px;
    font-weight: 600;
    background: linear-gradient(to right, #4B6584, #778ca3);
    background-clip: text;
    -webkit-background-clip: text;
    color: transparent;
  }

  .title {
    font-size: 2.5rem;
    color: #4B6584;
    margin: 0;
    font-weight: 700;
    position: relative;
    display: inline-block;
  }

  .title::after {
    content: '';
    position: absolute;
    width: 60px;
    height: 3px;
    background-color: #F9A826;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    border-radius: 2px;
  }

  .description {
    color: #666;
    line-height: 1.8;
    margin: 1rem 0;
    font-size: 1.1rem;
  }

  .donate-btn {
    align-self: center;
    background: linear-gradient(135deg, #F9A826, #FFD166);
    border: none;
    color: white;
    padding: 0.8rem 2.5rem;
    border-radius: 30px;
    font-weight: 600;
    font-size: 1.1rem;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 8px 15px rgba(249, 168, 38, 0.3);
    position: relative;
    overflow: hidden;
    z-index: 1;
  }

  .donate-btn::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, #FFD166, #F9A826);
    transition: all 0.4s ease;
    z-index: -1;
  }

  .donate-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 20px rgba(249, 168, 38, 0.4);
  }

  .donate-btn:hover::before {
    left: 0;
  }

  .donate-btn:active {
    transform: translateY(1px);
  }

  /* Payment Information Section */
  .donations-card {
    background: white;
    border-radius: 20px;
    padding: 3rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 2.5rem;
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.08);
    position: relative;
    overflow: hidden;
  }

  .donations-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23f0f0f0' fill-opacity='0.4'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
    opacity: 0.07;
    z-index: 0;
  }

  .donations-info {
    flex: 1;
    position: relative;
    z-index: 1;
    padding-left: 6rem;

  }

  .donations-title {
    font-size: 1.8rem;
    margin-top: 0;
    margin-bottom: 1.5rem;
    color: #4B6584;
    font-weight: 700;
    position: relative;
    display: inline-block;
  }

  .donations-title::after {
    content: '';
    position: absolute;
    width: 40px;
    height: 3px;
    background-color: #F9A826;
    bottom: -8px;
    left: 0;
    border-radius: 2px;
  }

  .account-info {
    margin-top: 2rem;
    margin-bottom: 1.5rem;
    background: #f9fafb;
    padding: 1rem;
    border-radius: 10px;
    border: 1px solid #F9A826 ;
    border-left: 4px solid #F9A826;
    transition: all 0.3s ease;
  }

  .account-info:hover {
    transform: translateX(5px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
  }

  .account-info p {
    margin: 0.25rem 0;
    color: #4B6584;
  }

  .account-info p strong {
    color: #2d3748;
    font-weight: 600;
  }

  .qr-section {
    flex: 1;
    display: flex;
    justify-content: center;
    position: relative;
    z-index: 1;
    padding-right: 2rem;
  }

  .qr-container {
    background: white;
    border-radius: 16px;
    padding: 1.25rem;
    width: 240px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    border: 1px solid #eaeaea;
  }

  .qr-container:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
  }

  .gcash-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 1rem;
    background: #0075FF;
    color: white;
    padding: 0.75rem 1rem;
    border-radius: 8px;
    font-weight: 500;
  }

  .gcash-logo-text {
    font-weight: bold;
    font-size: 1.25rem;
    background: white;
    color: #0075FF;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 3px 8px rgba(0, 117, 255, 0.2);
  }

  .qr-code-placeholder {
    width: 100%;
    height: 200px;
    border-radius: 8px;
    position: relative;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
  }

  .qr-code-placeholder img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
  }

  .qr-code-placeholder:hover img {
    transform: scale(1.03);
  }

  /* Volunteer Section */
  .volunteer-card {
    background: linear-gradient(135deg, #F9A826, #FFD166);
    border-radius: 20px;
    padding: 3rem;
    color: white;
    position: relative;
    overflow: hidden;
    box-shadow: 0 15px 30px rgba(249, 168, 38, 0.2);
  }

  .volunteer-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%23ffffff' fill-opacity='0.1' fill-rule='evenodd'/%3E%3C/svg%3E");
    z-index: 0;
  }

  .volunteer-header {
    font-size: 1.8rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
    position: relative;
    z-index: 1;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
  }

  .volunteer-text {
    margin-bottom: 1.5rem;
    line-height: 1.8;
    font-size: 1.1rem;
    position: relative;
    z-index: 1;
    text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.05);
  }

  /* Pet Beneficiaries Section*/
  .pet-beneficiaries-section {
    margin-top: 2rem;
  }

  .beneficiaries-title {
    font-size: 2.2rem;
    color: #4B6584;
    margin-bottom: 2rem;
    position: relative;
    display: inline-block;
    font-weight: 700;
  }

  .beneficiaries-title::after {
    content: '';
    position: absolute;
    width: 50px;
    height: 3px;
    background-color: #F9A826;
    bottom: -10px;
    left: 0;
    border-radius: 2px;
  }

  .beneficiaries-container {
    width: 100%;
  }

  /* Image Gallery */
  .image-gallery {
    display: flex;
    gap: 1.5rem;
  }

  .gallery-left {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
  }

  .gallery-right {
    flex: 2;
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
  }

  .feature-image {
    height: 0;
    padding-bottom: 100%; /* Square aspect ratio */
    position: relative;
    overflow: hidden;
    border-radius: 16px;
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
    transition: all 0.3s ease;
  }

  .small-image {
    height: 0;
    padding-bottom: 50%; /* 2:1 aspect ratio */
    position: relative;
    overflow: hidden;
    border-radius: 16px;
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
    transition: all 0.3s ease;
  }

  .gallery-top {
    display: flex;
    gap: 1.5rem;
    height: 50%;
  }

  .medium-image {
    flex: 1;
    position: relative;
    overflow: hidden;
    border-radius: 16px;
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
    transition: all 0.3s ease;
  }

  .feature-image:hover,
  .small-image:hover,
  .medium-image:hover {
    transform: translateY(-5px);
    box-shadow: 0 18px 30px rgba(0, 0, 0, 0.2);
  }

  .content-box {
    flex: 1;
    background: white;
    border-radius: 16px;
    padding: 1.5rem;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    border-left: 4px solid #4B6584;
  }

  .content-box:hover {
    transform: translateY(-5px);
    box-shadow: 0 18px 30px rgba(0, 0, 0, 0.12);
  }

  .bottom-row {
    display: flex;
    gap: 1.5rem;
    height: 50%;
  }

  .beneficiary-text {
    color: #4B6584;
    line-height: 1.8;
    margin-bottom: 1.5rem;
    font-size: 1rem;
  }

  .image-overlay {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background: linear-gradient(to top, rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.3) 60%, transparent);
    padding: 2rem 1.5rem 1.5rem;
    color: white;
    transition: all 0.4s ease;
  }

  .feature-image:hover .image-overlay,
  .small-image:hover .image-overlay,
  .medium-image:hover .image-overlay {
    padding-bottom: 2rem;
  }

  .overlay-text {
    font-weight: 700;
    font-size: 1.2rem;
    margin: 0;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
    transform: translateY(0);
    transition: all 0.3s ease;
  }

  .feature-image:hover .overlay-text,
  .small-image:hover .overlay-text,
  .medium-image:hover .overlay-text {
    transform: translateY(-5px);
  }

  .placeholder-img {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    object-fit: cover;
    transition: transform 0.5s ease;
  }

  .feature-image:hover .placeholder-img,
  .small-image:hover .placeholder-img,
  .medium-image:hover .placeholder-img {
    transform: scale(1.1);
  }

  .btn-label {
    background: linear-gradient(135deg, #4B6584, #3a506b);
    color: white;
    border: none;
    padding: 0.8rem 1.8rem;
    border-radius: 30px;
    font-weight: 600;
    cursor: pointer;
    align-self: flex-start;
    transition: all 0.3s ease;
    box-shadow: 0 8px 15px rgba(75, 101, 132, 0.2);
    position: relative;
    overflow: hidden;
    z-index: 1;
  }

  .btn-label::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, #3a506b, #4B6584);
    transition: all 0.4s ease;
    z-index: -1;
  }

  .btn-label:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 20px rgba(75, 101, 132, 0.3);
  }

  .btn-label:hover::before {
    left: 0;
  }

  .btn-label:active {
    transform: translateY(1px);
  }

  .browse-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 2rem;
    padding: 2rem;
    font-family: 'Segoe UI', sans-serif;
  }

  .browse-left {
    flex: 1;
  }

  .browse-left h2 {
    font-size: 2rem;
    color: #1d1d1d;
  }

  .browse-left span {
    color: #4a6fa5;
  }

  .browse-left p {
    font-size: 0.9rem;
    color: #6b7280;
    margin: 1rem 0;
    max-width: 500px;
  }

  .button-group {
    display: flex;
    gap: 1rem;
  }

  .btn {
    padding: 0.5rem 1rem;
    border-radius: 20px;
    border: none;
    cursor: pointer;
    font-weight: 500;
  }

  .primary {
    background-color: #4B6584;
    color: white;
    font-weight: bold;
    padding: 0.8rem;
  }

  .browse-right {
    display: flex;
    align-items: center;
    gap: 1rem;
  }

  .image-box {
    background-color: #a5b4fc;
    border-radius: 12px;
    padding: 2rem;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .counter-box {
    background-color: #F9A826;
    color: white;
    padding: 1.5rem 1rem;
    border-radius: 12px;
    text-align: center;
    min-width: 80px;
  }

  .count {
    font-size: 1.8rem;
    font-weight: bold;
  }

  .label {
    font-size: 0.9rem;
    color: white;
  }
    /* Footer  */
  .footer {
    background-color: #f6f6f6;
    color: #333;
    padding: 40px 20px 20px;
    font-family: Arial, sans-serif;
    margin-top: 60px;
    border-top: 1px solid #ddd;
  }

  .footer-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 40px;
    max-width: 1200px;
    margin: 0 auto;
  }

  .footer-column {
    flex: 1 1 250px;
  }

  .logo-column {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
  }

  .logo-column img {
    margin-bottom: 10px;
  }

  .Footer-logo-text {
    font-size: 24px;
    font-weight: bold;
    color: #2b7a78;
    margin-bottom: 8px;
  }

  .footer-description {
    font-size: 14px;
    color: #666;
  }

  .footer-column h4 {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 12px;
    color: #17252a;
  }

  .footer-column ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }

  .footer-column ul li {
    margin-bottom: 8px;
  }

  .footer-column ul li a {
    text-decoration: none;
    color: #333;
    transition: color 0.3s;
  }

  .footer-column ul li a:hover {
    color: #2b7a78;
  }

  .footer-bottom {
    text-align: center;
    margin-top: 30px;
    font-size: 14px;
    color: #888;
    border-top: 1px solid #ddd;
    padding-top: 20px;
  }

  /* Responsive adjustments */
  @media (max-width: 1100px) {
    .donation-container {
      padding: 2rem 1rem;
      gap: 2.5rem;
    }

    .donations-info {
      padding-left: 0rem;
    }

    .donations-card {
      padding: 1rem;
    }

    .volunteer-card {
      padding: 2rem;
    }

    /* Footer */
    .footer-container {
      flex-wrap: wrap;
      gap: 2rem;
      justify-content: center;
    }

    .footer-column {
      flex: 1 1 200px;
      text-align: center;
    }

    .logo-column {
      align-items: center;
    }
  }

  @media (max-width: 992px) {
    .image-gallery {
      flex-direction: column;
    }

    .gallery-top, .bottom-row {
      height: auto;
    }

    .gallery-left {
      flex-direction: row;
    }

    .feature-image {
      flex: 2;
      padding-bottom: 60%;
    }

    .small-image {
      flex: 1;
      padding-bottom: 60%;
    }

    /* Footer tweaks */
    .footer-container {
      padding: 1.5rem 1rem;
    }

    .footer-column {
      flex-basis: 100%;
    }
  }

  @media (max-width: 900px) {
    .nav-links {
      gap: 1.5rem;
    }

    .qr-section {
      padding-left: 2rem;
    }

    .donations-card {
      flex-direction: column;
      text-align: center;
      gap: 2rem;
    }

    .donations-title::after {
      left: 50%;
      transform: translateX(-50%);
    }

    .account-info {
      max-width: 500px;
      margin-left: auto;
      margin-right: auto;
    }

    .account-info:hover {
      transform: translateY(-5px);
    }

    .volunteer-header {
      font-size: 1.6rem;
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

    .gallery-left {
      flex-direction: column;
    }

    .feature-image, .small-image {
      padding-bottom: 50%;
    }

    .gallery-top {
      flex-direction: column;
    }

    .bottom-row {
      flex-direction: column;
    }

    .donations-card {
      flex-direction: column;
      text-align: center;
    }

    .qr-section {
      width: 100%;
    }

    .qr-container {
      margin: 0 auto;
    }

    .donation-header {
      text-align: center;
    }

    .donate-btn {
      align-self: center;
    }

    /* Footer stacks fully on mobile */
    .footer-container {
      flex-direction: column;
      align-items: center;
      text-align: center;
    }

    .footer-column {
      margin-bottom: 1.5rem;
    }
  }

  @media (max-width: 576px) {
    .feature-image, .small-image, .medium-image {
      padding-bottom: 66.67%;
    }

    .image-overlay {
      padding: 10px;
    }

    .overlay-text {
      font-size: 0.9rem;
    }

    .content-box {
      padding: 12px;
    }

    .beneficiary-text {
      font-size: 0.9rem;
      margin-bottom: 10px;
    }

    .btn-label {
      padding: 0.5rem 1.2rem;
      font-size: 0.9rem;
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

    .donation-container {
      padding: 1.5rem 1rem;
    }

    .title {
      font-size: 1.75rem;
    }

    .donations-card, .volunteer-card {
      padding: 1.5rem;
    }
  }
  /* Animation for mobile menu */
  @keyframes slideIn {
    from {
      transform: translateX(100%);
      opacity: 0;
    }
    to {
      transform: translateX(0);
      opacity: 1;
    }
  }
  </style>