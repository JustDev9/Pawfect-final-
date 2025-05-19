<template>
  <div class="adoption-history">
    <h2>Adoption History</h2>
    <div class="filters">
      <input
        type="text"
        v-model="searchQuery"
        placeholder="Search by pet name or adopter..."
        class="search-input"
      >
      <select v-model="statusFilter" class="status-filter">
        <option value="all">All Status</option>
        <option value="approved">Approved</option>
        <option value="rejected">Rejected</option>
      </select>
    </div>

    <table class="history-table">
      <thead>
        <tr>
          <th>Date</th>
          <th>Pet Name</th>
          <th>Adopter</th>
          <th>Status</th>
          <th>Notes</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="record in filteredHistory" :key="record.id">
          <td>{{ record.date }}</td>
          <td>{{ record.petName }}</td>
          <td>{{ record.adopterName }}</td>
          <td>
            <span :class="['status-badge', record.status.toLowerCase()]">
              {{ record.status }}
            </span>
          </td>
          <td>{{ record.notes }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: 'AdoptionHistory',
  data() {
    return {
      searchQuery: '',
      statusFilter: 'all',
      history: [
        {
          id: 1,
          date: '2024-03-15',
          petName: 'Nala',
          adopterName: 'John Doe',
          status: 'Approved',
          notes: 'Successfully adopted'
        },
        {
          id: 2,
          date: '2024-03-14',
          petName: 'Toby',
          adopterName: 'Jane Smith',
          status: 'Rejected',
          notes: 'Insufficient living space'
        },
        {
          id: 3,
          date: '2024-03-13',
          petName: 'Baby',
          adopterName: 'Mike Johnson',
          status: 'Approved',
          notes: 'Perfect match for family'
        }
      ]
    }
  },
  computed: {
    filteredHistory() {
      return this.history.filter(record => {
        const matchesSearch =
          record.petName.toLowerCase().includes(this.searchQuery.toLowerCase()) ||
          record.adopterName.toLowerCase().includes(this.searchQuery.toLowerCase());

        const matchesStatus =
          this.statusFilter === 'all' ||
          record.status.toLowerCase() === this.statusFilter;

        return matchesSearch && matchesStatus;
      });
    }
  }
}
</script>

<style scoped>
.adoption-history {
  padding: 2rem;
}

.filters {
  display: flex;
  gap: 1rem;
  margin-bottom: 2rem;
}

.search-input, .status-filter {
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
}

.search-input {
  flex: 1;
}

.history-table {
  width: 100%;
  border-collapse: collapse;
  background: white;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.history-table th,
.history-table td {
  padding: 1rem;
  text-align: left;
  border-bottom: 1px solid #eee;
}

.history-table th {
  background: #f9a826;
  color: white;
  font-weight: 500;
}

.status-badge {
  padding: 0.25rem 0.75rem;
  border-radius: 20px;
  font-size: 0.875rem;
  font-weight: 500;
}

.status-badge.approved {
  background: #d4edda;
  color: #155724;
}

.status-badge.rejected {
  background: #f8d7da;
  color: #721c24;
}
</style>