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

    <div class="pet-profile-container">
      <div class="pet-card">
        <div class="pet-image-container">
          <img src="/public/ridley.png" alt="Ian" class="pet-image">
        </div>
        <div class="pet-info">
          <h2 class="pet-name">Hi! I'm Ian</h2>
          <div class="pet-details">
            <div class="detail-item">
              <span class="detail-label">Age:</span>
              <span class="detail-value">20</span>
            </div>
            <div class="detail-item">
              <span class="detail-label">Breed:</span>
              <span class="detail-value">American White Hair</span>
            </div>
            <div class="detail-item">
              <span class="detail-label">Sex:</span>
              <span class="detail-value">M</span>
            </div>
          </div>
          <p class="pet-description">
            Ian was found on a corner street in Olongapo and is trying to find his loved ones.
            He has a gullible and joyful personality and likes to play with other people.
            He enjoys petting and playtime. He also likes coding.
          </p>
          <button class="adoption-button" @click="openApplicationForm">Apply for Adoption</button>
        </div>
      </div>
    </div>

    <div class="container adoption-process">
      <h2 class="title">Process of Adoption</h2>
      <div class="steps">
        <div class="step">
          <div class="circle">1</div>
          <p>Apply</p>
        </div>
        <div class="line"></div>
        <div class="step">
          <div class="circle">2</div>
          <p>Screening</p>
        </div>
        <div class="line"></div>
        <div class="step">
          <div class="circle">3</div>
          <p>Finalize Adoption</p>
        </div>
        <div class="line"></div>
        <div class="step">
          <div class="circle">4</div>
          <p>Bring Home</p>
        </div>
      </div>
    </div>

    <div class="application-form-section">
      <div class="form-container" :class="{ 'show-form': showApplicationForm }">
        <div class="form-overlay" @click="closeApplicationForm"></div>
        <div class="form-content">
          <button class="close-form-btn" @click="closeApplicationForm">&times;</button>

          <h2 class="form-title">🐾 Pet Adoption Application Form</h2>
          <p class="form-description">
            Please fill out the form below to apply for adoption. All fields marked with * are required.
          </p>

          <form @submit.prevent="currentApplicationStep === 1 ? proceedToUploadsAndFinalize() : submitFullApplication()" class="adoption-form">

            <div v-if="currentApplicationStep === 1">
              <h3>1. Applicant Information</h3>
              <div class="form-group">
                <label for="fullName">Full Name *</label>
                <input type="text" id="fullName" v="application.fullName" v-model="application.fullName" required>
              </div>
              <div class="form-group">
                 <label for="ageOver18" class="checkbox-label">
                    <input type="checkbox" id="ageOver18" v-model="application.ageOver18" required>
                    I confirm I am 18 years or older *
                </label>
              </div>
              <div class="form-group">
                <label>Address *</label>
                <input type="text" v-model="application.addressStreet" placeholder="Street Address" required>
                <div class="input-row">
                    <input type="text" v-model="application.addressCity" placeholder="City" required class="mt-small">
                    <input type="text" v-model="application.addressState" placeholder="Province" required class="mt-small">
                    <input type="text" v-model="application.addressZIP" placeholder="ZIP Code" required class="mt-small">
                </div>
              </div>
              <div class="input-row">
                <div class="form-group">
                  <label for="phoneNumber">Phone Number *</label>
                  <input type="tel" id="phoneNumber" v-model="application.phoneNumber" required>
                </div>
                <div class="form-group">
                  <label for="emailAddress">Email Address *</label>
                  <input type="email" id="emailAddress" v-model="application.emailAddress" required>
                </div>
              </div>
               <div class="form-group">
                <label for="preferredContactMethod">Preferred Contact Method *</label>
                <select id="preferredContactMethod" v-model="application.preferredContactMethod" required>
                    <option value="Email">Email</option>
                    <option value="Phone">Phone</option>
                    <option value="Text">Text</option>
                </select>
              </div>

              <h3>2. Household Information</h3>
               <div class="form-group">
                <label>Do you own or rent your home? *</label>
                <div>
                    <label><input type="radio" v-model="application.homeOwnership" value="Own" required> Own</label>
                    <label><input type="radio" v-model="application.homeOwnership" value="Rent"> Rent</label>
                </div>
              </div>
              <div v-if="application.homeOwnership === 'Rent'" class="form-group">
                <label>If renting, do you have landlord’s permission to have pets? *</label>
                 <div>
                    <label><input type="radio" v-model="application.landlordPermission" value="Yes" required> Yes</label>
                    <label><input type="radio" v-model="application.landlordPermission" value="No"> No</label>
                </div>
                <label for="landlordContact" class="mt-small">Landlord Name & Contact (if applicable):</label>
                <input type="text" id="landlordContact" v-model="application.landlordContact">
              </div>
              <div class="form-group">
                <label for="homeType">Type of home: *</label>
                <select id="homeType" v-model="application.homeType" required>
                    <option value="House">House</option>
                    <option value="Apartment">Apartment</option>
                    <option value="Condo">Condo</option>
                    <option value="Other">Other</option>
                </select>
                 <input v-if="application.homeType === 'Other'" type="text" v-model="application.homeTypeOther" placeholder="Please specify" class="mt-small">
              </div>
              <div class="form-group">
                <label for="timeAtAddress">How long have you lived at this address? *</label>
                <input type="text" id="timeAtAddress" v-model="application.timeAtAddress" required>
              </div>
              <div class="form-group">
                <label>Is your yard securely fenced? *</label>
                <div>
                    <label><input type="radio" v-model="application.yardFenced" value="Yes" required> Yes</label>
                    <label><input type="radio" v-model="application.yardFenced" value="No"> No</label>
                    <label><input type="radio" v-model="application.yardFenced" value="N/A"> N/A (e.g., apartment)</label>
                </div>
              </div>
              <div class="form-group">
                <label for="householdMembersInfo">List all members of the household (name, age, relationship): *</label>
                <textarea id="householdMembersInfo" v-model="application.householdMembersInfo" rows="3" required></textarea>
              </div>
               <div class="form-group">
                <label>Are all household members in agreement about adopting a pet? *</label>
                 <div>
                    <label><input type="radio" v-model="application.allHouseholdMembersAgree" :value="true" required> Yes</label>
                    <label><input type="radio" v-model="application.allHouseholdMembersAgree" :value="false"> No</label>
                </div>
              </div>

              <h3>3. Current & Past Pets</h3>
                <div class="form-group">
                    <label>Do you currently have pets? *</label>
                    <div>
                        <label><input type="radio" v-model="application.hasCurrentPets" :value="true" required> Yes</label>
                        <label><input type="radio" v-model="application.hasCurrentPets" :value="false"> No</label>
                    </div>
                </div>
                <div v-if="application.hasCurrentPets" class="form-group">
                    <label for="currentPetsDetails">If yes, please list species, breed, age, gender, spayed/neutered status, and if they are up-to-date on vaccinations:</label>
                    <textarea id="currentPetsDetails" v-model="application.currentPetsDetails" rows="3"></textarea>
                </div>
                <div class="form-group">
                    <label>Have you owned pets in the past 5 years? *</label>
                     <div>
                        <label><input type="radio" v-model="application.ownedPetsLast5Years" :value="true" required> Yes</label>
                        <label><input type="radio" v-model="application.ownedPetsLast5Years" :value="false"> No</label>
                    </div>
                </div>
                <div v-if="application.ownedPetsLast5Years" class="form-group">
                    <label for="pastPetsDetails">If yes, what happened to them?</label>
                    <textarea id="pastPetsDetails" v-model="application.pastPetsDetails" rows="3"></textarea>
                </div>

              <h3>4. Veterinarian Information (Optional but preferred)</h3>
              <div class="input-row">
                <div class="form-group">
                    <label for="vetName">Veterinarian’s Name:</label>
                    <input type="text" id="vetName" v-model="application.vetName">
                </div>
                <div class="form-group">
                    <label for="vetClinicName">Clinic Name:</label>
                    <input type="text" id="vetClinicName" v-model="application.vetClinicName">
                </div>
              </div>
              <div class="form-group">
                <label for="vetPhone">Vet Phone Number:</label>
                <input type="tel" id="vetPhone" v-model="application.vetPhone">
              </div>
              <div class="form-group">
                <label class="checkbox-label">
                    <input type="checkbox" v-model="application.vetContactPermission">
                    May we contact your vet for reference?
                </label>
              </div>

              <h3>5. Employment & Lifestyle</h3>
              <div class="form-group">
                <label for="occupation">Occupation *</label>
                <input type="text" id="occupation" v-model="application.occupation" required>
              </div>
              <div class="form-group">
                <label for="workSchedule">Work schedule (e.g., 9am-5pm, M-F, hours away from home): *</label>
                <input type="text" id="workSchedule" v-model="application.workSchedule" required>
              </div>
              <div class="form-group">
                <label for="hoursPetAlone">How many hours per day will the pet typically be alone? *</label>
                <input type="text" id="hoursPetAlone" v-model="application.hoursPetAlone" required>
              </div>
              <div class="form-group">
                <label for="petCaregiverWhenNotHome">Who will care for the pet when you’re not home or on vacation? *</label>
                <input type="text" id="petCaregiverWhenNotHome" v-model="application.petCaregiverWhenNotHome" required>
              </div>

              <h3>6. Pet Preferences</h3>
              <div class="form-group">
                <label for="petTypePreference">Type of pet you’re looking to adopt: *</label>
                <select id="petTypePreference" v-model="application.petTypePreference" required>
                    <option value="Dog">Dog</option>
                    <option value="Cat">Cat</option>
                    <option value="Other">Other</option>
                </select>
              </div>
               <div class="form-group">
                <label for="breedPreference">Breed preference (if any):</label>
                <input type="text" id="breedPreference" v-model="application.breedPreference">
              </div>
              <div class="form-group">
                <label for="agePreference">Age preference: *</label>
                <select id="agePreference" v-model="application.agePreference" required>
                    <option value="Puppy/Kitten">Puppy/Kitten</option>
                    <option value="Adult">Adult</option>
                    <option value="Senior">Senior</option>
                    <option value="Any">Any</option>
                </select>
              </div>
              <div class="form-group">
                <label for="genderPreference">Gender preference: *</label>
                <select id="genderPreference" v-model="application.genderPreference" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Any">Any</option>
                </select>
              </div>
              <div class="form-group">
                <label for="activityLevelPreference">Activity level preferred: *</label>
                <select id="activityLevelPreference" v-model="application.activityLevelPreference" required>
                    <option value="Low">Low</option>
                    <option value="Medium">Medium</option>
                    <option value="High">High</option>
                </select>
              </div>

              <h3>7. Care & Commitment</h3>
                <div class="form-group">
                    <label for="petSleepLocation">Where will the pet sleep? *</label>
                    <input type="text" id="petSleepLocation" v-model="application.petSleepLocation" required>
                </div>
                <div class="form-group">
                    <label for="petFood">What will you feed the pet? (e.g., brand, type of food) *</label>
                    <input type="text" id="petFood" v-model="application.petFood" required>
                </div>
                <div class="form-group">
                    <label>Are you prepared for the financial responsibility of pet ownership (food, vet care, emergencies, etc.)? *</label>
                    <div>
                        <label><input type="radio" v-model="application.preparedForFinancialResponsibility" :value="true" required> Yes</label>
                        <label><input type="radio" v-model="application.preparedForFinancialResponsibility" :value="false"> No</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="responseToBehaviorIssues">What will you do if the pet develops behavior issues? *</label>
                    <textarea id="responseToBehaviorIssues" v-model="application.responseToBehaviorIssues" rows="3" required></textarea>
                </div>
                <div class="form-group">
                    <label>Are you willing to take the pet to training classes (if needed)? *</label>
                    <div>
                        <label><input type="radio" v-model="application.willingToTrain" :value="true" required> Yes</label>
                        <label><input type="radio" v-model="application.willingToTrain" :value="false"> No</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="reasonsToReturnPet">What circumstances would cause you to return a pet? *</label>
                    <textarea id="reasonsToReturnPet" v-model="application.reasonsToReturnPet" rows="3" required></textarea>
                </div>


              <h3>8. Emergency & Long-Term Planning</h3>
                <div class="form-group">
                    <label for="emergencyPetCaregiver">Who will care for the pet if something happens to you (emergency contact)? *</label>
                    <input type="text" id="emergencyPetCaregiver" v-model="application.emergencyPetCaregiver" required>
                </div>
                <div class="form-group">
                    <label>Have you ever surrendered a pet before? *</label>
                    <div>
                        <label><input type="radio" v-model="application.surrenderedPetBefore" :value="true" required> Yes</label>
                        <label><input type="radio" v-model="application.surrenderedPetBefore" :value="false"> No</label>
                    </div>
                </div>
                <div v-if="application.surrenderedPetBefore" class="form-group">
                    <label for="surrenderedPetExplanation">If yes, please explain the circumstances:</label>
                    <textarea id="surrenderedPetExplanation" v-model="application.surrenderedPetExplanation" rows="3"></textarea>
                </div>

              <h3>9. References (Optional)</h3>
                <p>Please provide 1-2 personal references (not family members).</p>
                <h4>Reference 1</h4>
                <div class="input-row">
                    <div class="form-group">
                        <label for="reference1Name">Name:</label>
                        <input type="text" id="reference1Name" v-model="application.reference1Name">
                    </div>
                    <div class="form-group">
                        <label for="reference1Relationship">Relationship:</label>
                        <input type="text" id="reference1Relationship" v-model="application.reference1Relationship">
                    </div>
                </div>
                <div class="form-group">
                    <label for="reference1Contact">Contact Info (Phone/Email):</label>
                    <input type="text" id="reference1Contact" v-model="application.reference1Contact">
                </div>

                <h4>Reference 2</h4>
                 <div class="input-row">
                    <div class="form-group">
                        <label for="reference2Name">Name:</label>
                        <input type="text" id="reference2Name" v-model="application.reference2Name">
                    </div>
                    <div class="form-group">
                        <label for="reference2Relationship">Relationship:</label>
                        <input type="text" id="reference2Relationship" v-model="application.reference2Relationship">
                    </div>
                </div>
                <div class="form-group">
                    <label for="reference2Contact">Contact Info (Phone/Email):</label>
                    <input type="text" id="reference2Contact" v-model="application.reference2Contact">
                </div>

              <div class="form-actions">
                <button type="submit" class="submit-btn">Next: Upload Documents & Finalize</button>
              </div>
            </div>

            <div v-if="currentApplicationStep === 2">
              <h3>10. Upload Documents (Optional)</h3>
              <div class="form-group">
                <label for="homePhoto">Upload a photo of your home or pet area:</label>
                <input type="file" id="homePhoto" @change="handleFileUpload($event, 'homePhotoFile')" accept="image/*">
              </div>
              <div class="form-group">
                <label for="idPhoto">Upload a copy of your ID:</label>
                <input type="file" id="idPhoto" @change="handleFileUpload($event, 'idPhotoFile')" accept="image/*,application/pdf">
              </div>

              <h3>11. Acknowledgements & Consent</h3>
              <div class="form-group">
                <label class="checkbox-label">
                    <input type="checkbox" v-model="application.certifyTrueInfo" required>
                    I certify that all information provided in this application is true and complete to the best of my knowledge. *
                </label>
              </div>
              <div class="form-group">
                 <label class="checkbox-label">
                    <input type="checkbox" v-model="application.authorizeVerification" required>
                    I authorize the rescue/shelter to verify this information, including contacting references and veterinarians. *
                </label>
              </div>
              <div class="form-group">
                <label for="signature">Signature (Type Full Name) *</label>
                <input type="text" id="signature" v-model="application.signature" required>
              </div>
              <div class="form-group">
                <label for="applicationDate">Date *</label>
                <input type="date" id="applicationDate" v-model="application.applicationDate" required readonly>
              </div>

              <div class="form-actions">
                 <button type="button" class="submit-btn secondary-btn" @click="currentApplicationStep = 1">Back to Details</button>
                <button type="submit" class="submit-btn">Submit Application</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <div class="questionnaire-section" v-if="showQuestionnaire">
      <h2 class="form-title">Adoption Questionnaire</h2>
      <div class="question" v-for="(question, index) in questions" :key="index">
        <p>{{ question.text }}</p>
        <div class="options">
          <button
            v-for="(option, i) in question.options"
            :key="i"
            class="option-button"
            :class="{ 'selected': answers[index] === i }"
            @click="selectAnswer(index, i)"
          >
            {{ option }}
          </button>
        </div>
        <p v-if="answers[index] !== undefined" class="selected-answer">
          Selected: {{ question.options[answers[index]] }}
        </p>
      </div>
      <button class="submit-btn questionnaire-submit-btn" @click="submitQuestionnaire">Submit Questionnaire</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PawfectAdoption',
  data() {
    return {
      mobileMenuOpen: false,
      dropdownOpen: false,
      isMobile: false,
      hasScrolled: false,
      showApplicationForm: false,
      currentApplicationStep: 1, // 1: details, 2: uploads & consent
      showQuestionnaire: false,
      application: {
        // 1. Applicant Information
        fullName: '',
        ageOver18: false,
        addressStreet: '',
        addressCity: '',
        addressState: '',
        addressZIP: '',
        phoneNumber: '',
        emailAddress: '',
        preferredContactMethod: 'Email',

        // 2. Household Information
        homeOwnership: 'Own',
        landlordPermission: 'N/A',
        landlordContact: '',
        homeType: 'House',
        homeTypeOther: '',
        timeAtAddress: '',
        yardFenced: 'N/A',
        householdMembersInfo: '',
        allHouseholdMembersAgree: false,

        // 3. Current & Past Pets
        hasCurrentPets: false,
        currentPetsDetails: '',
        ownedPetsLast5Years: false,
        pastPetsDetails: '',

        // 4. Veterinarian Information
        vetName: '',
        vetClinicName: '',
        vetPhone: '',
        vetContactPermission: false,

        // 5. Employment & Lifestyle
        occupation: '',
        workSchedule: '',
        hoursPetAlone: '',
        petCaregiverWhenNotHome: '',

        // 6. Pet Preferences
        petTypePreference: 'Dog',
        breedPreference: '',
        agePreference: 'Adult',
        genderPreference: 'Any',
        activityLevelPreference: 'Medium',

        // 7. Care & Commitment
        petSleepLocation: '',
        petFood: '',
        preparedForFinancialResponsibility: false,
        responseToBehaviorIssues: '',
        willingToTrain: false,
        reasonsToReturnPet: '',

        // 8. Emergency & Long-Term Planning
        emergencyPetCaregiver: '',
        surrenderedPetBefore: false,
        surrenderedPetExplanation: '',

        // 9. References
        reference1Name: '',
        reference1Relationship: '',
        reference1Contact: '',
        reference2Name: '',
        reference2Relationship: '',
        reference2Contact: '',

        // 11. Acknowledgements & Consent (Step 2)
        certifyTrueInfo: false,
        authorizeVerification: false,
        signature: '',
        applicationDate: new Date().toISOString().slice(0, 10),
      },
      homePhotoFile: null,
      idPhotoFile: null,
      questions: [
        {
          text: "What is your primary motivation for wanting to adopt a pet at this time?",
          options: [
            "Companionship",
            "For my children",
            "To save a life",
            "Security / Guarding",
            "Other"
          ]
        },
        {
          text: "How do you plan to introduce the new pet to your home and existing pets (if any)?",
          options: [
            "Gradual introduction over several days/weeks",
            "Immediate full access",
            "Keep them separate initially in different rooms",
            "Not sure / Haven't thought about it"
          ]
        },
        {
          text: "Are you prepared for an adjustment period that could last weeks or months?",
          options: [
            "Yes, I understand it takes time.",
            "I expect the pet to adjust quickly.",
            "I'm not sure what to expect."
          ]
        },
        {
          text: "If you have to move in the future, what are your plans for your pet?",
          options: [
            "The pet comes with me, no matter what.",
            "I would try to find pet-friendly housing.",
            "I might have to rehome the pet.",
            "Depends on the circumstances."
          ]
        },
        {
           text: "How do you feel about shedding, potential damage to furniture, or house-training accidents?",
           options: [
            "Acceptable and manageable parts of pet ownership.",
            "Concerned, I prefer minimal mess.",
            "These would be major issues for me."
           ]
        },
        {
            text: "What kind of training methods do you believe in or plan to use?",
            options: [
                "Positive reinforcement (rewards, praise)",
                "Correction-based methods",
                "A mix of both",
                "I will hire a professional trainer",
                "Unsure"
            ]
        }
      ],
      answers: []
    }
  },
  mounted() {
    this.checkScreenSize();
    window.addEventListener('resize', this.checkScreenSize);
    window.addEventListener('scroll', this.handleScroll);
    this.addGlobalStyles();
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
    openApplicationForm() {
        this.showApplicationForm = true;
        this.currentApplicationStep = 1;
        this.application.applicationDate = new Date().toISOString().slice(0,10); // Reset date
    },
    closeApplicationForm() {
        this.showApplicationForm = false;
        this.currentApplicationStep = 1;

    },
    proceedToUploadsAndFinalize() {
      // Basic validation example: check if required fields for step 1 are filled
      // You would typically have more robust validation
      const step1Form = this.$el.querySelector('.adoption-form');
      if (step1Form && step1Form.checkValidity()) {
        this.currentApplicationStep = 2;
        // Scroll to top of form content when changing step
        const formContent = this.$el.querySelector('.form-content');
        if (formContent) formContent.scrollTop = 0;
      } else {
        // Trigger browser's default validation UI or show custom messages
        step1Form.reportValidity();
        alert('Please fill out all required fields in Step 1 before proceeding.');
      }
    },
    handleFileUpload(event, fileDataProperty) {
        const file = event.target.files[0];
        if (file) {
            this[fileDataProperty] = file;
            console.log(`${fileDataProperty} selected:`, file.name);
        } else {
            this[fileDataProperty] = null;
        }
    },
    submitFullApplication() {
      const step2Form = this.$el.querySelector('.adoption-form');
       if (step2Form && step2Form.checkValidity()) {
        console.log('Full Application Submitted:', this.application);
        if (this.homePhotoFile) {
            console.log('Home Photo File:', this.homePhotoFile.name, this.homePhotoFile.type);
        }
        if (this.idPhotoFile) {
            console.log('ID Photo File:', this.idPhotoFile.name, this.idPhotoFile.type);
        }

        alert('Application submitted successfully! Please complete the questionnaire below.');
        this.closeApplicationForm();
        this.showQuestionnaire = true;
      } else {
         step2Form.reportValidity();
         alert('Please fill out all required fields in Step 2 and complete acknowledgements.');
      }
    },
    selectAnswer(questionIndex, optionIndex) {
      this.answers[questionIndex] = optionIndex;
    },
    submitQuestionnaire() {
      console.log('Questionnaire submitted:', this.answers);
      const allAnswered = this.answers.length === this.questions.length && this.answers.every(ans => ans !== undefined && ans !== null);
      if (!allAnswered) {
        alert('Please answer all questionnaire questions.');
        return;
      }
      alert('Thank you for completing the questionnaire!');
      this.answers = Array(this.questions.length).fill(null); // Reset answers
      this.showQuestionnaire = false;
    }
  }
}
</script>

<style scoped>
/* NAV STYLES (mostly unchanged) */
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
    padding-top: 5rem; /* Ensure content below nav bar */
    width: 100vw; /* Full width */
    margin: 0; /* Reset margin */
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


/* Pet Profile Card Styles */
.pet-profile-container {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 2rem;
  background-color: #f8f9fa; /* Light gray background */
}

.pet-card {
  display: flex; /* For side-by-side image and info */
  max-width: 900px; /* Max card width */
  width: 100%;
  background-color: white;
  border-radius: 12px;
  overflow: hidden; /* To respect border radius for image */
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
  transition: transform 0.3s ease;
}

.pet-card:hover {
  transform: translateY(-5px); /* Slight lift on hover */
}

.pet-image-container {
  flex: 1; /* Takes up proportional space */
  min-width: 300px; /* Minimum width for image area */
  max-width: 400px; /* Maximum width for image area */
  position: relative;
  overflow: hidden;
}

.pet-image {
  width: 100%;
  height: 100%;
  object-fit: cover; /* Cover the area, might crop */
  display: block;
  transition: transform 0.3s ease;
}

.pet-card:hover .pet-image {
  transform: scale(1.05); /* Zoom image slightly on card hover */
}

.pet-info {
  flex: 1.5; /* Takes more space than image */
  padding: 2rem;
  display: flex;
  flex-direction: column;
}

.pet-name {
  color: #546e7a; /* Darker text for name */
  font-size: 2.2rem; /* Large name */
  margin-top: 0;
  margin-bottom: 1.5rem;
  font-weight: 700;
}

.pet-details {
  display: flex;
  flex-wrap: wrap; /* Allow details to wrap */
  gap: 1rem; /* Space between detail items */
  margin-bottom: 1.5rem;
}

.detail-item {
  background-color: #f1f8fe; /* Light blue background for tags */
  padding: 0.5rem 1rem;
  border-radius: 20px; /* Pill shape */
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.detail-label {
  color: #607d8b; /* Muted label color */
  font-weight: 600;
}

.detail-value {
  color: #455a64; /* Darker value color */
}

.pet-description {
  color: #607d8b;
  line-height: 1.6;
  font-size: 1.1rem;
  margin-bottom: 2rem;
  flex-grow: 1; /* Allows description to take available space */
}

.adoption-button {
  align-self: flex-start; /* Align button to the left */
  background-color: #F9A826; /* Theme color */
  color: white;
  border: none;
  padding: 0.8rem 1.5rem;
  border-radius: 30px; /* Rounded button */
  font-weight: 600;
  font-size: 1rem;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 4px 8px rgba(249, 168, 38, 0.3);
}

.adoption-button:hover {
  background-color: #e89921; /* Darken on hover */
  transform: translateY(-2px);
}

/* Process adoption */
.adoption-process {
  background-color: #f8f9fa;
  padding: 3rem 1rem;
  margin-bottom: 2rem;
}

.container {
  text-align: center;
  margin: 0 auto;
  max-width: 1200px;
}

.title {
  font-size: 2rem;
  font-weight: bold;
  margin-bottom: 2rem;
  color: #546e7a;
}

.steps {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  gap: 10px; /* Gap between step and line */
}

.step {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  padding: 1rem; /* Spacing around each step content */
  width: 120px; /* Fixed width for each step container */
}

.circle {
  background-color: #F9A826;
  color: white;
  font-weight: bold;
  font-size: 1.25rem;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 0.75rem; /* Space between circle and text */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.step:hover .circle {
  transform: scale(1.1);
  box-shadow: 0 6px 12px rgba(0,0,0,0.15);
}

.line {
  width: 50px; /* Length of the line */
  height: 3px;
  background-color: #F9A826;
  position: relative; /* For potential future animations or pseudo-elements */
}

.step p {
  color: #607d8b;
  font-weight: 600;
  margin-top: 0.5rem; /* Ensure consistency if margin-bottom on circle changes */
}


/* Make steps stack vertically on smaller screens */
@media (max-width: 600px) {
  .steps {
    flex-direction: column; /* Stack steps vertically */
  }
  .line {
    width: 3px; /* Line becomes vertical */
    height: 30px; /* Height of the vertical line */
  }
}


/* Application Form Styles */
.application-form-section {
  width: 100%;
}

.form-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.6); /* Darker overlay */
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 2000;
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.3s ease, visibility 0.3s ease;
}

.show-form {
  opacity: 1;
  visibility: visible;
}

.form-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
}

.form-content {
  background: white;
  border-radius: 10px;
  width: 90%;
  max-width: 800px; /* Max width for larger screens */
  max-height: 90vh; /* Max height to prevent overflow */
  overflow-y: auto; /* Scroll if content exceeds max height */
  padding: 25px 35px; /* More padding */
  position: relative;
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
  transform: translateY(20px);
  transition: transform 0.3s ease;
}

.show-form .form-content {
  transform: translateY(0);
}

.close-form-btn {
  position: absolute;
  top: 15px;
  right: 15px;
  background: none;
  border: none;
  font-size: 28px; /* Larger close button */
  cursor: pointer;
  color: #aaa; /* Lighter color */
  transition: color 0.3s ease;
}

.close-form-btn:hover {
  color: #F9A826; /* Theme color on hover */
}

.form-title {
  font-size: 26px; /* Adjusted title size */
  color: #F9A826; /* Theme color for title */
  margin-bottom: 8px;
  text-align: center;
}

.form-description {
  color: #777; /* Softer description color */
  text-align: center;
  margin-bottom: 25px;
  line-height: 1.5;
}

.adoption-form h3 {
    font-size: 1.5rem;
    color: #546e7a;
    margin-top: 25px;
    margin-bottom: 15px;
    padding-bottom: 5px;
    border-bottom: 1px solid #eee;
}
.adoption-form h3:first-of-type {
    margin-top: 0;
}


.form-group {
  margin-bottom: 18px; /* Slightly reduced margin */
}

.input-row {
  display: flex;
  gap: 18px; /* Consistent gap */
  margin-bottom: 18px;
}

.input-row .form-group {
  flex: 1;
  margin-bottom: 0; /* Remove bottom margin for items in a row */
}

.form-group label {
  display: block;
  margin-bottom: 8px; /* Spacing between label and input */
  font-weight: 600; /* Bolder labels */
  color: #555;
  font-size: 0.95rem;
}
.form-group label.checkbox-label {
    font-weight: normal;
    display: flex;
    align-items: center;
    gap: 8px;
    color: #666;
}
.form-group label.checkbox-label input[type="checkbox"] {
    width: auto;
    margin-right: 5px; /* Accent color for checkboxes */
    accent-color: #F9A826;

}
.form-group input[type="text"],
.form-group input[type="email"],
.form-group input[type="tel"],
.form-group input[type="date"],
.form-group textarea,
.form-group select {
  width: 100%;
  padding: 12px 15px; /* Comfortable padding */
  border: 1px solid #ccc; /* Softer border */
  border-radius: 6px; /* Slightly more rounded */
  font-size: 1rem;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
  background-color: #fdfdfd;
}
.form-group input[type="radio"] {
    margin-right: 5px;
    accent-color: #F9A826;
}
.form-group div > label { /* For radio button group labels */
    margin-right: 15px;
    font-weight: normal;
    color: #666;
}


.form-group textarea {
    min-height: 80px;
    resize: vertical;
}
.form-group input:focus,
.form-group textarea:focus,
.form-group select:focus {
  border-color: #F9A826;
  box-shadow: 0 0 0 3px rgba(249, 168, 38, 0.25); /* Softer focus ring */
  outline: none;
}
.mt-small {
    margin-top: 10px;
}

.form-actions {
  margin-top: 30px; /* More space before actions */
  text-align: right; /* Align buttons to the right */
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}

.submit-btn {
  background-color: #F9A826;
  color: white;
  border: none;
  padding: 12px 25px;
  border-radius: 6px;
  font-size: 1rem; /* Consistent font size */
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.2s ease;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.submit-btn:hover {
  background-color: #e89921; /* Darken on hover */
  transform: translateY(-1px);
}
.submit-btn.secondary-btn {
    background-color: #777;
}
.submit-btn.secondary-btn:hover {
    background-color: #666;
}


/* Questionnaire Styles */
.questionnaire-section {
  padding: 2rem 1.5rem; /* Responsive padding */
  background-color: #f0f4f8; /* Lighter, distinct background */
  margin-top: 2rem;
  border-radius: 8px;
  box-shadow: 0 4px 15px rgba(0,0,0,0.05);
}

.questionnaire-section .form-title {
    color: #F9A826;
    margin-bottom: 1.5rem;
}

.question {
  margin-bottom: 2rem; /* More space between questions */
  padding: 1.5rem;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.07);
}
.question p:first-child {
    font-weight: 600;
    color: #334e68; /* Dark blue-gray for question text */
    font-size: 1.1rem;
    margin-bottom: 1rem;
}

.options {
  display: flex;
  flex-direction: column; /* Stack options vertically */
  gap: 0.75rem; /* Space between option buttons */
}

.option-button {
  background-color: #e1eaf2; /* Lighter, neutral base for options */
  color: #334e68; /* Dark text for readability */
  border: 1px solid #cbd6e0; /* Subtle border */
  padding: 0.75rem 1.25rem; /* Generous padding */
  border-radius: 6px;
  font-weight: 500; /* Slightly less bold */
  cursor: pointer;
  transition: all 0.2s ease;
  text-align: left; /* Align text to left */
  font-size: 0.95rem;
}

.option-button:hover {
  background-color: #F9A826; /* Theme color highlight */
  border-color: #F9A826;
  color: white;
  transform: translateX(3px); /* Slight shift on hover */
}

.option-button.selected {
  background-color: #F9A826; /* Clear selected state */
  color: white;
  border-color: #e89921; /* Darker border for selected */
  font-weight: 600;
}

.selected-answer {
  margin-top: 1rem;
  font-weight: 500;
  color: #546e7a;
  font-size: 0.9rem;
  padding-left: 0.5rem;
  border-left: 3px solid #F9A826;
}
.questionnaire-submit-btn {
    display: block;
    margin: 2rem auto 0;
    padding: 0.8rem 2rem;
}

@media (max-width: 768px) {
    .form-content {
        padding: 20px;
    }
    .adoption-form h3 {
        font-size: 1.3rem;
    }
    .input-row {
        flex-direction: column;
        gap: 0;
    }
    .input-row .form-group {
        margin-bottom: 18px;
    }
    .questionnaire-section {
        padding: 1.5rem 1rem;
    }
    .question {
        padding: 1rem;
    }
}

</style>