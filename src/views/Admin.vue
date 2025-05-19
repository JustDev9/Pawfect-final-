<template>
  <div class="admin-layout">
    <!-- Side Navigation -->
    <div class="side-nav">
      <div class="admin-profile">
        <div class="profile-image">
          <img src="@/assets/admin-avatar.svg" alt="Admin Profile" />
        </div>
        <h3>{{ adminName }}</h3>
        <button @click="logout" class="logout-btn">Logout</button>
      </div>
      <nav>
        <ul>
          <li :class="{ active: currentSection === 'pets' }" @click="currentSection = 'pets'">
            <i class="fas fa-paw"></i> Add Pets
          </li>
          <li :class="{ active: currentSection === 'requests' }" @click="currentSection = 'requests'">
            <i class="fas fa-handshake"></i> Adoption Requests
          </li>
          <li :class="{ active: currentSection === 'history' }" @click="currentSection = 'history'">
            <i class="fas fa-history"></i> Adoption History
          </li>
        </ul>
      </nav>
    </div>

    <!-- Main Content -->
    <div class="admin-dashboard">
      <div class="summary-cards">
        <div class="summary-card">
          <h3>Total Pets</h3>
          <p>{{ pets.length }}</p>
        </div>
        <div class="summary-card">
          <h3>Pending Approvals</h3>
          <p>{{ pendingApprovals }}</p>
        </div>
        <div class="summary-card">
          <h3>Pending Adoptions</h3>
          <p>{{ pendingAdoptions }}</p>
        </div>
      </div>
      <component
        :is="currentComponent"
        @pet-added="handlePetAdded"
        @request-updated="handleRequestUpdate"
      ></component>
    </div>
  </div>
</template>

<script>
import AddPets from '@/components/AddPets.vue';
import AdoptionHistory from '@/components/AdoptionHistory.vue';
import AdoptionRequests from '@/components/AdoptionRequests.vue';

export default {
  name: 'AdminDashboard',
  components: {
    AddPets,
    AdoptionRequests,
    AdoptionHistory
  },
  data() {
    return {
      adminName: 'Admin User',
      currentSection: 'pets',
      pets: [
        { id: 1, name: 'Nala', breed: 'Siamese', age: '2 years', approved: true, adoptionStatus: 'Available' },
        { id: 2, name: 'Toby', breed: 'Labrador', age: '1 year', approved: false, adoptionStatus: 'Available' },
        { id: 3, name: 'Baby', breed: 'Persian', age: '3 years', approved: true, adoptionStatus: 'Pending' },
        { id: 4, name: 'Dexter', breed: 'Scottish Fold', age: '2 years', approved: true, adoptionStatus: 'Available' },
        { id: 5, name: 'Justin', breed: 'Exotic Shorthair', age: '1.5 years', approved: false, adoptionStatus: 'Available' },
        { id: 6, name: 'Gabie', breed: 'Golden Retriever', age: '6 months', approved: true, adoptionStatus: 'Adopted' },
        { id: 7, name: 'John', breed: 'Beagle', age: '2 years', approved: true, adoptionStatus: 'Available' },
        { id: 8, name: 'Chu', breed: 'Ragdoll', age: '1 year', approved: true, adoptionStatus: 'Available' },
        { id: 9, name: 'Riddley', breed: 'Maine Coon', age: '4 years', approved: true, adoptionStatus: 'Pending' },
        { id: 10, name: 'Babi', breed: 'Labrador', age: '8 months', approved: true, adoptionStatus: 'Available' },
      ],
    };
  },
  computed: {
    currentComponent() {
      switch (this.currentSection) {
        case 'pets':
          return 'AddPets';
        case 'requests':
          return 'AdoptionRequests';
        case 'history':
          return 'AdoptionHistory';
        default:
          return 'AddPets';
      }
    },
    pendingApprovals() {
      return this.pets.filter(p => !p.approved).length;
    },
    pendingAdoptions() {
      return this.pets.filter(p => p.adoptionStatus === 'Pending').length;
    },
  },
  methods: {
    handlePetAdded(newPet) {
      // Here you would typically make an API call to save the pet
      this.pets.push({
        id: this.pets.length + 1,
        ...newPet,
        approved: false,
        adoptionStatus: 'Available'
      });
    },
    handleRequestUpdate({ request, action }) {
      // Update the pet's adoption status based on the request action
      const pet = this.pets.find(p => p.name === request.petName);
      if (pet) {
        pet.adoptionStatus = action === 'approved' ? 'Adopted' : 'Available';
      }
    },
    logout() {
      // Implement logout logic here
      this.$router.push('/login');
    },
  },
};
</script>

<style scoped>
.admin-layout {
  display: flex;
  min-height: 100vh;
}

.side-nav {
  width: 250px;
  background: #2c3e50;
  color: white;
  padding: 2rem 0;
}

.admin-profile {
  text-align: center;
  padding: 1rem;
  border-bottom: 1px solid rgba(255,255,255,0.1);
  margin-bottom: 2rem;
}

.profile-image img {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  margin-bottom: 1rem;
}

.logout-btn {
  background: #e74c3c;
  color: white;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 1rem;
}

.side-nav ul {
  list-style: none;
  padding: 0;
}

.side-nav li {
  padding: 1rem 2rem;
  cursor: pointer;
  transition: background 0.3s;
}

.side-nav li:hover {
  background: rgba(255,255,255,0.1);
}

.side-nav li.active {
  background: #f7871f;
}

.side-nav i {
  margin-right: 0.5rem;
}

.admin-dashboard {
  flex: 1;
  padding: 2rem;
  background: #f5f6fa;
  overflow-y: auto;
}

.summary-cards {
  display: flex;
  gap: 2rem;
  margin-bottom: 2rem;
}

.summary-card {
  flex: 1;
  background: #f7f7f7;
  border-radius: 10px;
  padding: 1.2rem 1rem;
  text-align: center;
  box-shadow: 0 2px 8px rgba(0,0,0,0.04);
}

.summary-card h3 {
  color: #f7871f;
  margin-bottom: 0.5rem;
}

.summary-card p {
  font-size: 2rem;
  font-weight: bold;
  color: #222;
}
</style>