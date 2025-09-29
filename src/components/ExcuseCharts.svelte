<script lang="ts">
  import { filteredDataStore, chartsModalOpen, headerMap, getHeaders } from '../lib/store';
  import { Bar, Line } from 'svelte5-chartjs';
  import ExcuseDistributionCharts from './ExcuseDistributionCharts.svelte';
  import ExcuseHeatmap from './ExcuseHeatmap.svelte';
  import { Chart, registerables } from 'chart.js';

  Chart.register(...registerables);

  let chartData: { labels: string[]; datasets: { label: string; data: number[]; backgroundColor: string[] }[] } = {
    labels: [],
    datasets: [
      {
        label: 'Cantidad de Excusas',
        data: [],
        backgroundColor: [
          'rgba(255, 99, 132, 0.6)',
          'rgba(54, 162, 235, 0.6)',
          'rgba(255, 206, 86, 0.6)',
          'rgba(75, 192, 192, 0.6)',
          'rgba(153, 102, 255, 0.6)',
          'rgba(255, 159, 64, 0.6)',
          'rgba(199, 199, 199, 0.6)',
          'rgba(83, 102, 255, 0.6)',
          'rgba(255, 99, 71, 0.6)',
          'rgba(60, 179, 113, 0.6)',
        ],
      },
    ],
  };

  let timeSeriesChartData: { labels: string[]; datasets: { label: string; data: number[]; borderColor: string; fill: boolean }[] } = {
    labels: [],
    datasets: [
      {
        label: 'Excusas por Mes',
        data: [],
        borderColor: 'rgb(75, 192, 192)',
        fill: false,
      },
    ],
  };

  $: if ($filteredDataStore) {
    const motiveCounts: { [key: string]: number } = {};
    const monthlyCounts: { [key: string]: number } = {};

    $filteredDataStore.forEach(excuse => {
      motiveCounts[excuse.excuse_motive] = (motiveCounts[excuse.excuse_motive] || 0) + 1;

      const date = new Date(excuse.excuse_date);
      const monthYear = `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}`;
      monthlyCounts[monthYear] = (monthlyCounts[monthYear] || 0) + 1;
    });

    chartData.labels = Object.keys(motiveCounts);
    chartData.datasets[0].data = Object.values(motiveCounts);

    // Sort monthly data by date
    const sortedMonths = Object.keys(monthlyCounts).sort();
    timeSeriesChartData.labels = sortedMonths.map(monthYear => {
      const [year, month] = monthYear.split('-');
      const date = new Date(parseInt(year), parseInt(month) - 1);
      return date.toLocaleString('es-ES', { month: 'short', year: 'numeric' });
    });
    timeSeriesChartData.datasets[0].data = sortedMonths.map(monthYear => monthlyCounts[monthYear]);
  }

  function closeModal() {
    chartsModalOpen.set(false);
  }

  $: headers = getHeaders($filteredDataStore);
</script>

{#if $chartsModalOpen}
  <div
    class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50"
    on:click={closeModal}
    on:keydown={(e) => { if (e.key === 'Escape') closeModal(); }}
    role="button"
    tabindex="0"
  >
    <div
      class="relative top-20 mx-auto p-5 border w-11/12 md:w-3/4 lg:w-2/3 shadow-lg rounded-md bg-white dark:bg-gray-800"
      on:click|stopPropagation
      role="dialog"
      aria-modal="true"
      tabindex="-1"
      on:keydown={(e) => { if (e.key === 'Escape') closeModal(); }}
    >
      <div class="mt-3 text-center">
        <h3 class="mb-5 text-lg font-normal text-gray-800 dark:text-gray-200">Gráfico de Motivos de Excusa</h3>
        {#if chartData.labels.length > 0}
          <div class="bg-white dark:bg-gray-800 p-4 rounded-lg shadow-md mb-6">
            <Bar data={chartData} options={{ responsive: true, maintainAspectRatio: false }} />
          </div>
        {:else}
          <p class="text-center text-gray-700 dark:text-gray-300">No hay datos para mostrar el gráfico.</p>
        {/if}

        <h3 class="mb-5 text-lg font-normal text-gray-800 dark:text-gray-200">Excusas por Mes</h3>
        {#if timeSeriesChartData.labels.length > 0}
          <div class="bg-white dark:bg-gray-800 p-4 rounded-lg shadow-md mb-6">
            <Line data={timeSeriesChartData} options={{ responsive: true, maintainAspectRatio: false }} />
          </div>
        {:else}
          <p class="text-center text-gray-700 dark:text-gray-300">No hay datos para mostrar el gráfico de tiempo.</p>
        {/if}

        <h3 class="mb-5 text-lg font-normal text-gray-800 dark:text-gray-200">Detalle Consolidado de Motivos</h3>
        {#if chartData.labels.length > 0}
          <div class="overflow-x-auto shadow-md sm:rounded-lg mb-6">
            <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
              <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                  <th scope="col" class="py-3 px-6">Motivo de Excusa</th>
                  <th scope="col" class="py-3 px-6 text-center">Cantidad</th>
                </tr>
              </thead>
              <tbody>
                {#each chartData.labels as motive, index (motive)}
                  <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                    <td class="py-4 px-6">{motive}</td>
                    <td class="py-4 px-6 text-center">{chartData.datasets[0].data[index]}</td>
                  </tr>
                {/each}
              </tbody>
            </table>
          </div>
        {:else}
          <p class="text-center text-gray-700 dark:text-gray-300">No hay datos para mostrar en la tabla.</p>
        {/if}

        <ExcuseDistributionCharts />

        <ExcuseHeatmap />

        <div class="items-center px-4 py-3">
          <button
            on:click={closeModal}
            class="px-4 py-2 bg-blue-500 text-white text-base font-medium rounded-md w-full shadow-sm hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-300 mt-2"
          >
            Cerrar
          </button>
        </div>
      </div>
    </div>
  </div>
{/if}