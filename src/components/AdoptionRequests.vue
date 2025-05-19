<template>
  <div class="adoption-requests">
    <h2>Adoption Requests</h2>
    <div class="requests-list">
      <div v-for="request in requests" :key="request.id" class="request-card">
        <div class="request-header">
          <h3>{{ request.petName }}</h3>
          <span :class="['status', request.status.toLowerCase()]">{{ request.status }}</span>
        </div>
        <div class="request-details">
          <p><strong>Applicant:</strong> {{ request.applicantName }}</p>
          <p><strong>Email:</strong> {{ request.applicantEmail }}</p>
          <p><strong>Phone:</strong> {{ request.applicantPhone }}</p>
          <p><strong>Reason:</strong> {{ request.reason }}</p>
          <p><strong>Submitted:</strong> {{ request.submittedDate }}</p>
        </div>
        <div class="request-actions" v-if="request.status === 'Pending'">
          <button @click="approveRequest(request)" class="approve-btn">Approve</button>
          <button @click="rejectRequest(request)" class="reject-btn">Reject</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AdoptionRequests',
  data() {
    return {
      requests: [
        {
          id: 1,
          petName: 'Nala',
          applicantName: 'John Doe',
          applicantEmail: 'john@example.com',
          applicantPhone: '123-456-7890',
          reason: 'Looking for a companion for my family',
          status: 'Pending',
          submittedDate: '2024-03-15'
        },
        {
          id: 2,
          petName: 'Toby',
          applicantName: 'Jane Smith',
          applicantEmail: 'jane@example.com',
          applicantPhone: '098-765-4321',
          reason: 'Want to give a loving home to a pet',
          status: 'Approved',
          submittedDate: '2024-03-14'
        }
      ]
    }
  },
  methods: {
    approveRequest(request) {
      request.status = 'Approved';
      this.$emit('request-updated', { request, action: 'approved' });
    },
    rejectRequest(request) {
      request.status = 'Rejected';
      this.$emit('request-updated', { request, action: 'rejected' });
    }
  }
}
</script>

<style scoped>
.adoption-requests {
  padding: 2rem;
}

.requests-list {
  display: grid;
  gap: 1.5rem;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
}

.request-card {
  background: white;
  border-radius: 8px;
  padding: 1.5rem;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.request-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1rem;
}

.status {
  padding: 0.25rem 0.75rem;
  border-radius: 20px;
  font-size: 0.875rem;
  font-weight: 500;
}

.status.pending {
  background: #fff3cd;
  color: #856404;
}

.status.approved {
  background: #d4edda;
  color: #155724;
}

.status.rejected {
  background: #f8d7da;
  color: #721c24;
}

.request-details {
  margin-bottom: 1rem;
}

.request-details p {
  margin: 0.5rem 0;
  color: #666;
}

.request-actions {
  display: flex;
  gap: 1rem;
  margin-top: 1rem;
}

.approve-btn, .reject-btn {
  flex: 1;
  padding: 0.5rem;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-weight: 500;
  transition: background 0.3s;
}

.approve-btn {
  background: #f7871f;
  color: white;
}

.approve-btn:hover {
  background: #e67e22;
}

.reject-btn {
  background: #e74c3c;
  color: white;
}

.reject-btn:hover {
  background: #c0392b;
}
</style>