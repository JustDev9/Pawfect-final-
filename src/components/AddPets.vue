  <template>
  <div class="add-pets">
    <h2>Add New Pet</h2>
    <form @submit.prevent="submitPet" class="pet-form">
      <div class="form-group">
        <label for="name">Pet Name</label>
        <input type="text" id="name" v-model="newPet.name" required>
      </div>

      <div class="form-group">
        <label for="breed">Breed</label>
        <input type="text" id="breed" v-model="newPet.breed" required>
      </div>

      <div class="form-group">
        <label for="age">Age</label>
        <input type="text" id="age" v-model="newPet.age" required placeholder="e.g., 2 years">
      </div>

      <div class="form-group">
        <label for="description">Description</label>
        <textarea id="description" v-model="newPet.description" rows="4"></textarea>
      </div>

      <div class="form-group">
        <label for="image">Pet Image</label>
        <input type="file" id="image" @change="handleImageUpload" accept="image/*">
      </div>

      <button type="submit" class="submit-btn">Add Pet</button>
    </form>
    <div v-if="loading" class="loading">Loading...</div>
    <div v-if="error" class="error-message">{{ error }}</div>
    <div v-if="success" class="success-message">Pet added successfully!</div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'AddPets',
  data() {
    return {
      newPet: {
        name: '',
        breed: '',
        age: '',
        description: '',
        image: null
      },
      loading: false,
      error: null,
      success: false
    }
  },
  methods: {
    async handleImageUpload(event) {
      const file = event.target.files[0];
      if (file) {
        this.newPet.image = file;
      }
    },
    async submitPet() {
      this.loading = true;
      this.error = null;
      this.success = false;

      try {
        const formData = new FormData();
        formData.append('name', this.newPet.name);
        formData.append('breed', this.newPet.breed);
        formData.append('age', this.newPet.age);
        formData.append('description', this.newPet.description);
        if (this.newPet.image) {
          formData.append('image', this.newPet.image);
        }

        const response = await axios.post('http://localhost:5000/api/pets', formData, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        });

        this.$emit('pet-added', response.data);
        this.success = true;

        // Reset form
        this.newPet = {
          name: '',
          breed: '',
          age: '',
          description: '',
          image: null
        };
      } catch (err) {
        this.error = err.response?.data?.message || 'Failed to add pet. Please try again.';
      } finally {
        this.loading = false;
      }
    }
  }
}
</script>

<style scoped>
.add-pets {
  max-width: 600px;
  margin: 0 auto;
  padding: 2rem;
}

.pet-form {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.form-group {
  margin-bottom: 1.5rem;
}

label {
  display: block;
  margin-bottom: 0.5rem;
  color: #333;
  font-weight: 500;
}

input, textarea {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
}

textarea {
  resize: vertical;
}

.submit-btn {
  background: #f7871f;
  color: white;
  border: none;
  padding: 0.75rem 1.5rem;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
  font-weight: 500;
  transition: background 0.3s;
}

.submit-btn:hover {
  background: #e67e22;
}

.error-message {
  color: #ff5252;
  margin-top: 1rem;
  text-align: center;
}

.success-message {
  color: #4caf50;
  margin-top: 1rem;
  text-align: center;
}

.loading {
  opacity: 0.7;
  pointer-events: none;
}
</style>