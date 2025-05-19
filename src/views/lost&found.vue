<template>
    <h1>Lost & Found</h1>
    <p>Lost & Found page content goes here.</p>

</template>



<style scoped>

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  background-color: #f9fafb;
  color: #333;
}

/* Navigation */
.navbar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  background-color: white;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  z-index: 100;
}

.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 1rem;
}

.nav-content {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.75rem 0;
}

.logo {
  display: flex;
  align-items: center;
  text-decoration: none;
}

.logo-icon {
  color: #ea580c;
  font-size: 2.25rem;
  margin-right: 0.5rem;
}

.logo-text {
  font-size: 1.875rem;
  font-weight: 700;
  color: #ea580c;
}

.nav-links {
  display: none;
}

.nav-link {
  color: #374151;
  font-weight: 500;
  text-decoration: none;
  transition: color 0.2s;
}

.nav-link:hover {
  color: #ea580c;
}

.dropdown {
  position: relative;
}

.dropdown-menu {
  position: absolute;
  left: 0;
  top: 100%;
  margin-top: 0.5rem;
  width: 12rem;
  background-color: white;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
  border-radius: 0.375rem;
  padding: 0.5rem 0;
  display: none;
  z-index: 10;
}

.dropdown:hover .dropdown-menu {
  display: block;
}

.dropdown-item {
  display: block;
  padding: 0.5rem 1rem;
  color: #374151;
  text-decoration: none;
  font-size: 0.875rem;
}

.dropdown-item:hover {
  background-color: #f3f4f6;
}

.btn-primary {
  background-color: #ea580c;
  color: white;
  padding: 0.5rem 1.5rem;
  border-radius: 9999px;
  font-weight: 500;
  border: none;
  cursor: pointer;
  transition: background-color 0.2s;
}

.btn-primary:hover {
  background-color: #c2410c;
}

/* Mobile Menu */
.mobile-menu {
  display: none;
  background-color: white;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

.mobile-menu-link {
  display: block;
  padding: 0.5rem 0;
  color: #374151;
  text-decoration: none;
}

.mobile-menu-link:hover {
  color: #9333ea;
}

/* Hero Section */
.hero {
  position: relative;
  padding-top: 5rem;
  overflow: hidden;
}

.hero-image-container {
  position: relative;
  height: 600px;
  overflow: hidden;
}

.hero-overlay {
  position: absolute;
  inset: 0;
  background: linear-gradient(90deg, rgba(234, 88, 12, 0.8) 0%, rgba(234, 88, 12, 0) 100%);
  z-index: 10;
}

.hero-image {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: top;
}

.hero-content {
  position: relative;
  z-index: 20;
  max-width: 42rem;
  color: white;
}

.hero-title {
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 1rem;
}

.hero-description {
  font-size: 1.25rem;
  margin-bottom: 2rem;
}

.btn-white {
  background-color: white;
  color: #ea580c;
  padding: 0.75rem 2rem;
  border-radius: 9999px;
  font-weight: 700;
  font-size: 1.125rem;
  border: none;
  cursor: pointer;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
  transition: background-color 0.2s;
}

.btn-white:hover {
  background-color: #f3f4f6;
}

/* Adoption Process */
.section {
  padding: 5rem 0;
}

.section-title {
  font-size: 2.25rem;
  font-weight: 700;
  color: #1f2937;
  margin-bottom: 1rem;
  text-align: center;
}

.section-description {
  font-size: 1.25rem;
  color: #4b5563;
  max-width: 48rem;
  margin: 0 auto 4rem;
  text-align: center;
}

.grid {
  display: grid;
  gap: 2rem;
}

.grid-cols-1 {
  grid-template-columns: repeat(1, 1fr);
}

.grid-cols-2 {
  grid-template-columns: repeat(2, 1fr);
}

.grid-cols-3 {
  grid-template-columns: repeat(3, 1fr);
}

.grid-cols-4 {
  grid-template-columns: repeat(4, 1fr);
}

.process-card {
  background-color: #fff7ed;
  border-radius: 0.75rem;
  padding: 2rem;
  position: relative;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

.step-number {
  position: absolute;
  top: -1.25rem;
  left: -1.25rem;
  width: 3rem;
  height: 3rem;
  background-color: #ea580c;
  border-radius: 9999px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-weight: 700;
  font-size: 1.25rem;
}

.step-icon {
  font-size: 3rem;
  color: #ea580c;
  text-align: center;
  margin-bottom: 1rem;
}

.step-title {
  font-size: 1.5rem;
  font-weight: 700;
  color: #1f2937;
  margin-bottom: 0.75rem;
  text-align: center;
}

.step-description {
  color: #4b5563;
}

.btn-purple {
  background-color: #9333ea;
  color: white;
  padding: 0.75rem 2rem;
  border-radius: 9999px;
  font-weight: 700;
  font-size: 1.125rem;
  border: none;
  cursor: pointer;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
  transition: background-color 0.2s;
}

.btn-purple:hover {
  background-color: #7e22ce;
}

/* Featured Pets */
.pet-card {
  background-color: white;
  border-radius: 0.75rem;
  overflow: hidden;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
  transition: box-shadow 0.2s;
}

.pet-card:hover {
  box-shadow: 0 10px 15px rgba(0,0,0,0.1);
}

.pet-image-container {
  height: 16rem;
  overflow: hidden;
}

.pet-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: top;
}

.pet-info {
  padding: 1.5rem;
}

.pet-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 0.75rem;
}

.pet-name {
  font-size: 1.5rem;
  font-weight: 700;
  color: #1f2937;
}

.pet-type {
  background-color: #ffedd5;
  color: #ea580c;
  padding: 0.25rem 0.75rem;
  border-radius: 9999px;
  font-size: 0.875rem;
  font-weight: 500;
}

.pet-description {
  color: #4b5563;
  margin-bottom: 1rem;
}

.pet-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.pet-location {
  color: #6b7280;
  display: flex;
  align-items: center;
}

/* Testimonials */
.testimonial-card {
  background-color: #fff7ed;
  border-radius: 0.75rem;
  padding: 2rem;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

.testimonial-header {
  display: flex;
  align-items: center;
  margin-bottom: 1.5rem;
}

.testimonial-avatar {
  width: 4rem;
  height: 4rem;
  border-radius: 9999px;
  overflow: hidden;
  margin-right: 1rem;
}

.testimonial-avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.testimonial-author {
  font-size: 1.25rem;
  font-weight: 700;
  color: #1f2937;
}

.testimonial-rating {
  display: flex;
  color: #f59e0b;
}

.testimonial-text {
  color: #4b5563;
  font-style: italic;
}

/* Location */
.location-container {
  display: grid;
  gap: 2rem;
}

.location-map {
  background-color: #e5e7eb;
  height: 400px;
  border-radius: 0.75rem;
  overflow: hidden;
}

.location-map img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.location-info {
  background-color: white;
  border-radius: 0.75rem;
  padding: 2rem;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

.location-title {
  font-size: 1.5rem;
  font-weight: 700;
  color: #1f2937;
  margin-bottom: 1.5rem;
}

.location-details {
  display: grid;
  gap: 1rem;
}

.location-item {
  display: flex;
  align-items: flex-start;
}

.location-icon {
  margin-top: 0.25rem;
  margin-right: 1rem;
  font-size: 1.25rem;
}

.location-text {
  color: #4b5563;
}

/* Newsletter */
.newsletter {
  background-color: #ea580c;
  padding: 4rem 0;
}

.newsletter-container {
  max-width: 48rem;
  margin: 0 auto;
  text-align: center;
}

.newsletter-title {
  font-size: 1.875rem;
  font-weight: 700;
  color: white;
  margin-bottom: 1rem;
}

.newsletter-description {
  color: #fed7aa;
  margin-bottom: 2rem;
}

.newsletter-form {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.newsletter-input {
  flex-grow: 1;
  padding: 0.75rem 1rem;
  border-radius: 9999px;
  border: none;
  outline: none;
  color: #1f2937;
}

.newsletter-input:focus {
  box-shadow: 0 0 0 2px #fdba74;
}

.newsletter-btn {
  background-color: white;
  color: #ea580c;
  padding: 0.75rem 1.5rem;
  border-radius: 9999px;
  font-weight: 700;
  border: none;
  cursor: pointer;
  transition: background-color 0.2s;
}

.newsletter-btn:hover {
  background-color: #f3f4f6;
}

/* Footer */
.footer {
  background-color: #1f2937;
  color: white;
  padding: 3rem 0;
}

.footer-grid {
  display: grid;
  gap: 2rem;
}

.footer-title {
  font-size: 1.5rem;
  font-weight: 700;
  margin-bottom: 1rem;
}

.footer-description {
  color: #d1d5db;
  margin-bottom: 1rem;
}

.footer-social {
  display: flex;
  gap: 1rem;
}

.footer-social a {
  color: #d1d5db;
  font-size: 1.25rem;
  transition: color 0.2s;
}

.footer-social a:hover {
  color: white;
}

.footer-links {
  list-style: none;
  padding: 0;
  margin: 0;
  display: grid;
  gap: 0.5rem;
}

.footer-links a {
  color: #d1d5db;
  text-decoration: none;
  transition: color 0.2s;
}

.footer-links a:hover {
  color: white;
}

.footer-contact-item {
  display: flex;
  align-items: flex-start;
  margin-bottom: 0.5rem;
}

.footer-contact-icon {
  margin-right: 0.5rem;
  margin-top: 0.25rem;
}

.footer-payment {
  display: flex;
  flex-wrap: wrap;
  gap: 0.75rem;
}

.footer-payment-icon {
  font-size: 1.5rem;
  color: #d1d5db;
}

.footer-divider {
  border-top: 1px solid #374151;
  margin-top: 3rem;
  padding-top: 2rem;
  text-align: center;
}

.footer-copyright {
  color: #9ca3af;
}

.footer-legal {
  color: #6b7280;
  font-size: 0.875rem;
  margin-top: 0.5rem;
}

.footer-legal a {
  color: #9ca3af;
  text-decoration: none;
  transition: color 0.2s;
}

.footer-legal a:hover {
  color: white;
}

/* Chat Widget */
.chat-widget {
  position: fixed;
  bottom: 1.5rem;
  right: 1.5rem;
  z-index: 100;
}

.chat-btn {
  background-color: #ea580c;
  color: white;
  width: 3.5rem;
  height: 3.5rem;
  border-radius: 9999px;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
  display: flex;
  align-items: center;
  justify-content: center;
  border: none;
  cursor: pointer;
  transition: background-color 0.2s;
}

.chat-btn:hover {
  background-color: #c2410c;
}

.chat-btn i {
  font-size: 1.5rem;
}

.chat-window {
  position: absolute;
  bottom: 5rem;
  right: 0;
  width: 24rem;
  background-color: white;
  border-radius: 0.75rem;
  box-shadow: 0 25px 50px rgba(0,0,0,0.25);
  overflow: hidden;
}

.chat-header {
  background-color: #ea580c;
  padding: 1rem;
  color: white;
}

.chat-title {
  font-size: 1.125rem;
  font-weight: 700;
}

.chat-subtitle {
  font-size: 0.875rem;
  color: #fed7aa;
}

.chat-messages {
  height: 24rem;
  overflow-y: auto;
  padding: 1rem;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.chat-message {
  max-width: 80%;
  padding: 0.75rem;
  border-radius: 1rem;
}

.chat-message.assistant {
  background-color: #f3f4f6;
  color: #1f2937;
  border-top-right-radius: 0;
  margin-right: auto;
}

.chat-message.user {
  background-color: #ea580c;
  color: white;
  border-top-left-radius: 0;
  margin-left: auto;
}

.chat-input-container {
  padding: 1rem;
  border-top: 1px solid #e5e7eb;
}

.chat-form {
  display: flex;
  gap: 0.5rem;
}

.chat-input {
  flex: 1;
  padding: 0.5rem 1rem;
  border-radius: 9999px;
  border: 2px solid #e5e7eb;
  outline: none;
}

.chat-input:focus {
  border-color: #ea580c;
}

.chat-send {
  background-color: #ea580c;
  color: white;
  padding: 0.5rem 1rem;
  border-radius: 9999px;
  border: none;
  cursor: pointer;
  transition: background-color 0.2s;
}

.chat-send:hover {
  background-color: #c2410c;
}

/* Responsive Styles */
@media (min-width: 768px) {
  .nav-links {
    display: flex;
    align-items: center;
    gap: 2rem;
  }

  .mobile-menu-btn {
    display: none;
  }

  .grid-cols-md-2 {
    grid-template-columns: repeat(2, 1fr);
  }

  .grid-cols-md-4 {
    grid-template-columns: repeat(4, 1fr);
  }

  .newsletter-form {
    flex-direction: row;
  }
}

@media (min-width: 1024px) {
  .grid-cols-lg-2 {
    grid-template-columns: repeat(2, 1fr);
  }

  .grid-cols-lg-3 {
    grid-template-columns: repeat(3, 1fr);
  }

  .grid-cols-lg-4 {
    grid-template-columns: repeat(4, 1fr);
  }

  .footer-grid {
    grid-template-columns: repeat(4, 1fr);
  }
}

/* Custom Scrollbar */
::-webkit-scrollbar {
  width: 0.375rem;
}

::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 0.1875rem;
}

::-webkit-scrollbar-thumb {
  background: #ea580c;
  border-radius: 0.1875rem;
}

::-webkit-scrollbar-thumb:hover {
  background: #c2410c;
}

/* Hide number input arrows */
input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

</style>
