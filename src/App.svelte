<script lang="ts">
  import NavbarLayout from './components/NavbarLayout.svelte';
  import ExcuseTable from './components/ExcuseTable.svelte';
  import ExcuseCharts from './components/ExcuseCharts.svelte';
  import StudentAbsenceDetails from './components/StudentAbsenceDetails.svelte';
  import { onMount } from 'svelte';
  import { fetchData, studentDetailsModalOpen, selectedStudentId, selectedStudentName } from './lib/store';

  onMount(() => {
    fetchData();
  });

  function closeStudentDetailsModal() {
    studentDetailsModalOpen.set(false);
    selectedStudentId.set(null);
    selectedStudentName.set(null);
  }
</script>

<NavbarLayout>
   <ExcuseTable />
</NavbarLayout>
<ExcuseCharts />

{#if $studentDetailsModalOpen}
  <StudentAbsenceDetails
    showModal={$studentDetailsModalOpen}
    studentId={$selectedStudentId || 0}
    studentName={$selectedStudentName || ''}
    on:close={closeStudentDetailsModal}
  />
{/if}