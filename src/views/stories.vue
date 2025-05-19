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
          <transition name = "fade">
            <div v-if="mobileMenuOpen || !isMobile" class="nav-links" :class="{ 'mobile-active': mobileMenuOpen }">
              <a href="#" class="nav-link" @click="closeMenuIfMobile">Home</a>
              <a href="#" class="nav-link" @click="closeMenuIfMobile">Pet Profiles</a>
              <div class="dropdown">
                <a href="#" class="nav-link dropdown-toggle" @click="toggleDropdown">
                  Resources <span class="dropdown-arrow" :class="{ 'arrow-rotated': dropdownOpen }">▼</span>
                </a>
                <transition name="slide-fade">
                  <div v-if="isMobile && dropdownOpen" class="dropdown-content mobile">
                    <a href="#" @click="closeMenuIfMobile">Training Tips</a>
                    <a href="#" @click="closeMenuIfMobile">Health Guides</a>
                    <a href="#" @click="closeMenuIfMobile">Pet Care</a>
                  </div>
                </transition>
                <div v-if="!isMobile" class="dropdown-content desktop">
                  <a href="#">Training Tips</a>
                  <a href="#">Health Guides</a>
                  <a href="#">Pet Care</a>
                </div>
              </div>
              <a href="#" class="nav-link" @click="closeMenuIfMobile">Donation</a>
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


      <section class="success-stories">
        <h2>Success Stories</h2>
        <div class="story-main-container">
          <div class="story-text-content">
            <h3>Lorem Ipsum</h3>
            <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters</p>
          </div>
          <div class="story-cards-container">
            <div class="story-card">
              <img src="/Designer.png" alt="images" class="story-card-img">
            </div>
            <div class="story-card">
              <img src="/Designer.png" alt="images" class="story-card-img">
            </div>
            <div class="story-card">
              <img src="/Designer.png" alt="images" class="story-card-img">
            </div>
          </div>
        </div>
      </section>


      <section class="detailed-stories">
        <div class="detailed-story-item">
          <div class="detailed-story-text">
            <div class="story-meta">
              <span><strong>Adopter:</strong> John Ian Ormides</span>
              <span><strong>Pet adopted:</strong> Garfield (Cat)</span>
            </div>
            <p>Garfield was found alone near a busy market—cold, hungry, and seeking shelter beside a cardboard box. Despite his rough start, he remained gentle and affectionate, quickly becoming a favorite at the shelter. After months of waiting, Garfield’s life changed when John Ian walked in. Their connection was instant. Garfield rubbed up against him, and John Ian knew he had found the one. Now, Garfield enjoys cozy naps, playful evenings, and endless love in his new home. “He’s more than a pet—he’s family,” says John Ian. Thank you, John Ian, for giving Garfield a second chance at happiness! ❤️.</p>
          </div>
          <div class="detailed-story-image-wrapper">
            <img src="/Designer.png" alt="Detailed story image" class="detailed-story-img">
          </div>
        </div>


        <div class="detailed-story-item">
          <div class="detailed-story-text">
            <div class="story-meta">
              <span><strong>Adopter:</strong> Justin Del Rosario</span>
              <span><strong>Pet adopted:</strong> Ridley (Dog)</span>
            </div>
            <p>Ridley was rescued from an abandoned lot, scared and underweight but still full of spirit. With time, love, and care at the shelter, he slowly opened up—revealing a playful and loyal heart just waiting for the right person. That person turned out to be Justin. The moment Ridley met Justin, his tail wouldn’t stop wagging. Their bond was instant, and Ridley finally found the home he had been hoping for. Now, Ridley spends his days happily exploring, cuddling on the couch, and living the life every pet deserves. “Ridley brings energy and love into my life every single day,” says Justin. Thank you, Justin, for giving Ridley a fresh start and a forever home! 🐶❤️</p>
          </div>
          <div class="detailed-story-image-wrapper">
            <img src="/Designer.png" alt="Detailed story image" class="detailed-story-img">
          </div>
        </div>


        <div class="detailed-story-item">
          <div class="detailed-story-text">
            <h4>Lora Is Looking For Adopter</h4>
            <p>Lora is a gentle and affectionate dog who was found wandering near a park, searching for food and shelter.<br>Despite her tough start, she remains full of love and trust. Lora loves belly rubs, quiet walks, and being around kind-hearted people. She’s healthy, friendly, and ready to bring warmth and joy into someone's life. All she needs now is a forever family to call her own.<br>Could you be the one to give Lora the loving home she deserves? 🐶❤️</p>
            <button class="do-something-button">Do something</button>
          </div>
          <div class="detailed-story-image-wrapper">
            <img src="/Designer.png" alt="Detailed story image" class="detailed-story-img">
          </div>
        </div>


        <div class="detailed-story-item">
          <div class="detailed-story-text">
            <h4>Chiklet Is Looking For Adopter</h4>
            <p>Chiklet got his name after we found him with bubble gum stuck in his tail—poor guy! But even then, he was calm, gentle, and curious, with the softest little meow that won our hearts.<br>Now clean, healthy, and full of personality, Chiklet loves cozy naps, head scratches, and watching the world from sunny windowsills. He’s a sweet and easygoing companion just waiting for the right person to take him home. <br>Give Chiklet the loving forever home he’s been dreaming of—you’ll gain a loyal friend with a sticky-sweet story. 🐱💛.</p>
            <button class="do-something-button">Do something</button>
          </div>
          <div class="detailed-story-image-wrapper">
            <img src="/Designer.png" alt="Detailed story image" class="detailed-story-img">
          </div>
        </div>
      </section>
    </div>


        <!-- Footer Section -->
  <footer class="footer">
    <div class="footer-container">
      <div class="footer-column logo-column">
        <img src="/Designer.png" alt="Pawfect" width="40" height="40">
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
    name: 'PawfectHomepage',
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
      document.addEventListener('click', this.handleClickOutsideDropdown);
    },
    beforeUnmount() {
      window.removeEventListener('resize', this.checkScreenSize);
      window.removeEventListener('scroll', this.handleScroll);
      document.removeEventListener('click', this.handleClickOutsideDropdown);
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


  <style  >
  * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
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
    box-sizing: border-box;
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
  .logo-image img {
    display: block;
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
    transition: opacity 0.3s ease, transform 0.3s ease;
  }


  .dropdown:hover .dropdown-content.desktop {
    display: block;
    opacity: 1;
    pointer-events: auto;
    transform: translateX(-50%) translateY(0);
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
    width: 100%;
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


  .fade-enter-active,
  .fade-leave-active {
    transition: opacity 0.3s ease;
  }
  .fade-enter-from,
  .fade-leave-to {
    opacity: 0;
  }


  .slide-fade-enter-active,
  .slide-fade-leave-active {
    transition: all 0.3s ease;
  }
  .slide-fade-enter-from,
  .slide-fade-leave-to {
    transform: translateY(-10px);
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
      left: -100%;
      right: auto;
      bottom: 0;
      width: 80%;
      max-width: 300px;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      background-color: #F9A826;
      padding: 2rem;
      gap: 1.5rem;
      z-index: 5;
      transition: left 0.3s ease-in-out;
      overflow-y: auto;
      padding-top: 5rem;
    }
    .nav-links.mobile-active {
      left: 0;
    }
    .nav-link {
      font-size: 1.3rem;
      width: 100%;
      text-align: center;
    }
    .nav-link:after {
      height: 3px;
      left: 50%;
      transform: translateX(-50%);
    }
     .nav-link:hover:after {
      width: 50%;
    }
    .dropdown .nav-link {
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .dropdown-content.desktop {
      display: none !important;
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


  /* ========== Success Stories ========== */
  .success-stories {
    padding: 4rem 2rem;
    padding-bottom: 1rem;
    background-color: #ffffff;
    text-align: center;
  }


  .success-stories h2 {
    font-size: 2.25rem;
    font-weight: 700;
    color: #1f1f1f;
    margin-bottom: 2.5rem;
    letter-spacing: 0.5px;
    text-align: center;
    font-family: 'Poppins', sans-serif;
    position: relative;
    transition: all 0.4s ease;
    cursor: default;
  }


  .success-stories h2::after {
    content: '';
    display: block;
    width: 0;
    height: 3px;
    margin: 0.5rem auto 0;
    background: linear-gradient(90deg, #70741b, #70741b);
    transition: width 0.4s ease;
    border-radius: 10px;
  }


  .success-stories h2:hover {
    color: #FF6E00;
    transform: scale(1.04);
    text-shadow: 1px 1px 6px rgba(75, 108, 183, 0.2);
  }


  .success-stories h2:hover::after {
    width: 60px;
  }






  /* ========== Story Container ========== */
  .story-main-container {
    display: flex;
    flex-wrap: wrap;
    gap: 2rem;
    max-width: 1200px;
    margin: 0 auto;
    text-align: left;
    align-items: flex-start;
  }


  .story-text-content {
    flex: 1 1 300px;
    color: #495057;
  }


  .story-text-content h3 {
    font-size: 2rem;
    color: #343a40;
    margin-bottom: 1rem;
    font-weight: 600;
  }


  .story-text-content p {
    font-size: 1rem;
    line-height: 1.7;
  }


  /* ========== Story Cards ========== */
  .story-cards-container {
    flex: 2 1 600px;
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
    gap: 1.5rem;
    justify-content: center;
  }


  .story-card {
    background-color: #ffffff;
    border-radius: 16px;
    padding: 1rem;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.06);
    display: flex;
    align-items: center;
    justify-content: center;
    aspect-ratio: 2.5/3;
    transition: transform 0.2s ease, box-shadow 0.3s ease;
    overflow: hidden;
  }


  .story-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
  }


  .story-card-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 12px;
    background-color: #ced4da;
    transition: transform 0.5s ease;
  }


  .story-card:hover .story-card-img {
    transform: scale(1.05);
  }


  /* ========== Detailed Stories ========== */
  .detailed-stories {
    padding: 4rem 2rem;
    padding-top: 0rem;
    background-color: #ffffff;
    max-width: 1100px;
    margin: 3rem auto;
  }


  .detailed-story-item {
    display: flex;
    flex-wrap: wrap;
    gap: 2rem;
    padding: 2rem;
    margin-bottom: 3rem;
    background-color: #fdfdfd;
    border-radius: 16px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.07);
  }


  .detailed-story-item:nth-child(even) {
    flex-direction: row-reverse;
  }


  .detailed-story-item:last-child {
    margin-bottom: 0;
  }


  .detailed-story-text {
    flex: 1 1 55%;
    color: #343a40;
  }


  .detailed-story-text h4 {
    font-size: 1.75rem;
    font-weight: 600;
    margin-bottom: 0.75rem;
  }


  .detailed-story-text p {
    font-size: 1rem;
    line-height: 1.7;
    margin-bottom: 1rem;
  }


  .story-meta {
    font-size: 0.9rem;
    color: #6c757d;
    margin-bottom: 1rem;
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
  }


  .detailed-story-image-wrapper {
    flex: 1 1 40%;
    background-color: #e9ecef;
    border-radius: 12px;
    overflow: hidden;
    position: relative;
    aspect-ratio: 16/9;
    min-height: 250px;
  }


  .detailed-story-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;
  }


  .detailed-story-image-wrapper:hover .detailed-story-img {
    transform: scale(1.05);
  }


  .do-something-button {
    background-color: #F9A826;
    color: white;
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s ease-in-out;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    display: inline-block;
    margin-top: 1rem;
  }


  .do-something-button:hover {
    background-color: #e0941f;
    transform: translateY(-2px);
  }


  .do-something-button:active {
    transform: translateY(0px);
  }


  /* Footer Styles */
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
    max-width: 150px;
    height: auto;
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


  @media (max-width: 1200px) {
    .story-cards-container {
      grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    }
  }


  @media (max-width: 992px) {
    .detailed-story-item {
      flex-direction: column !important;
    }

    .story-cards-container {
      grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
    }

    .story-main-container {
      gap: 3rem;
    }

    .detailed-story-text,
    .detailed-story-image-wrapper {
      flex: 1 1 100%;
    }

    .detailed-story-image-wrapper {
      order: -1;
    }
  }


  @media (max-width: 600px) {
      .footer-container {
          flex-direction: column;
          align-items: center;
      }
      .footer-column {
          flex-basis: 100%;
          text-align: center;
          margin-bottom: 25px;
      }
      .footer-column:last-child {
          margin-bottom: 0;
      }
      .logo-column {
          align-items: center;
      }
  }


  @media (max-width: 768px) {
    .success-stories h2 {
      font-size: 2.2rem;
    }


    .story-text-content h3,
    .detailed-story-text h4 {
      font-size: 1.6rem;
    }

    .story-text-content {
      text-align: center;
    }

    .story-cards-container {
      grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
    }

    .detailed-story-item {
      padding: 1.5rem;
      text-align: center;
    }

    .story-meta {
      justify-content: center;
    }
  }


  @media (max-width: 576px) {
    .success-stories,
    .detailed-stories {
      padding: 2rem 1rem;
    }


    .success-stories h2 {
      font-size: 1.8rem;
      margin-bottom: 1.5rem;
    }


    .story-text-content p,
    .detailed-story-text p {
      font-size: 0.95rem;
    }

    .story-cards-container {
      grid-template-columns: repeat(2, 1fr);
      gap: 1rem;
    }

    .detailed-story-image-wrapper {
      min-height: 180px;
    }


    .do-something-button {
      padding: 0.7rem 1.3rem;
      font-size: 0.95rem;
      width: 100%;
      max-width: 300px;
    }
  }


  @media (max-width: 375px) {
    .story-cards-container {
      grid-template-columns: 1fr;
      max-width: 280px;
      margin: 0 auto;
    }

    .story-card {
      max-height: 380px;
    }
  }


  </style>



