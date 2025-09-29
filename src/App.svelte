<script lang="ts">
  import NavbarLayout from './components/NavbarLayout.svelte';
  import ExcuseTable from './components/ExcuseTable.svelte';
  import { onMount } from 'svelte';
  import { fetchData, studentDetailsModalOpen, selectedStudentId, selectedStudentName, chartsModalOpen } from './lib/store';

  // Dynamic imports for modal components
  let ExcuseCharts: any;
  let StudentAbsenceDetails: any;

  $: if ($chartsModalOpen && !ExcuseCharts) {
    import('./components/ExcuseCharts.svelte').then(module => {
      ExcuseCharts = module.default;
    });
  }

  $: if ($studentDetailsModalOpen && !StudentAbsenceDetails) {
    import('./components/StudentAbsenceDetails.svelte').then(module => {
      StudentAbsenceDetails = module.default;
    });
  }

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

{#if $chartsModalOpen && ExcuseCharts}
  <ExcuseCharts />
{/if}

{#if $studentDetailsModalOpen && StudentAbsenceDetails}
  <StudentAbsenceDetails
    showModal={$studentDetailsModalOpen}
    studentId={$selectedStudentId || 0}
    studentName={$selectedStudentName || ''}
    on:close={closeStudentDetailsModal}
  />
{/if}