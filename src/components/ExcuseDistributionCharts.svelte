<script lang="ts">
  import { filteredDataStore } from '../lib/store';
  import { Pie } from 'svelte5-chartjs';
  import { Chart, registerables } from 'chart.js';

  Chart.register(...registerables);

  let gradeChartData: { labels: string[]; datasets: { label: string; data: number[]; backgroundColor: string[] }[] } = {
    labels: [],
    datasets: [
      {
        label: 'Excusas por Grado',
        data: [],
        backgroundColor: [],
      },
    ],
  };

  let campusChartData: { labels: string[]; datasets: { label: string; data: number[]; backgroundColor: string[] }[] } = {
    labels: [],
    datasets: [
      {
        label: 'Excusas por Sede',
        data: [],
        backgroundColor: [],
      },
    ],
  };

  // Function to generate distinct colors
  function generateColors(count: number): string[] {
    const colors = [];
    for (let i = 0; i < count; i++) {
      const hue = (i * 137.508) % 360; // Use golden angle approximation for distinct hues
      colors.push(`hsl(${hue}, 70%, 60%)`);
    }
    return colors;
  }

  $: if ($filteredDataStore) {
    const gradeCounts: { [key: string]: number } = {};
    const campusCounts: { [key: string]: number } = {};

    $filteredDataStore.forEach(excuse => {
      gradeCounts[excuse.grado] = (gradeCounts[excuse.grado] || 0) + 1;
      campusCounts[excuse.campus_name] = (campusCounts[excuse.campus_name] || 0) + 1;
    });

    gradeChartData.labels = Object.keys(gradeCounts);
    gradeChartData.datasets[0].data = Object.values(gradeCounts);
    gradeChartData.datasets[0].backgroundColor = generateColors(gradeChartData.labels.length);

    campusChartData.labels = Object.keys(campusCounts);
    campusChartData.datasets[0].data = Object.values(campusCounts);
    campusChartData.datasets[0].backgroundColor = generateColors(campusChartData.labels.length);
  }
</script>

<div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
  <div class="bg-white dark:bg-gray-800 p-4 rounded-lg shadow-md">
    <h4 class="text-lg font-medium text-gray-800 dark:text-gray-200 mb-3">Excusas por Grado</h4>
    {#if gradeChartData.labels.length > 0}
      <div class="h-64">
        <Pie data={gradeChartData} options={{ responsive: true, maintainAspectRatio: false }} />
      </div>
    {:else}
      <p class="text-center text-gray-700 dark:text-gray-300">No hay datos para mostrar por grado.</p>
    {/if}
  </div>

  <div class="bg-white dark:bg-gray-800 p-4 rounded-lg shadow-md">
    <h4 class="text-lg font-medium text-gray-800 dark:text-gray-200 mb-3">Excusas por Sede</h4>
    {#if campusChartData.labels.length > 0}
      <div class="h-64">
        <Pie data={campusChartData} options={{ responsive: true, maintainAspectRatio: false }} />
      </div>
    {:else}
      <p class="text-center text-gray-700 dark:text-gray-300">No hay datos para mostrar por sede.</p>
    {/if}
  </div>
</div>
