<script lang="ts">
  import { onMount, createEventDispatcher } from 'svelte';
  import { Modal } from 'flowbite-svelte';
  import { Bar } from 'svelte5-chartjs';
  import { Chart as ChartJS, registerables } from 'chart.js';

  ChartJS.register(...registerables);

  export let showModal: boolean;
  export let studentId: number;
  export let studentName: string;

  const dispatch = createEventDispatcher();

  interface AbsenceData {
    materia: string;
    total_absences: number;
    total_hours_absent: number;
  }

  let absences: AbsenceData[] = [];
  let loading = true;
  let error: string | null = null;

  $: totalHoursSum = absences.reduce((sum, absence) => sum + absence.total_hours_absent, 0);

  let chartData: { labels: string[]; datasets: { label: string; data: number[]; backgroundColor: string[] }[] } = {
    labels: [],
    datasets: [
      {
        label: 'Total de Inasistencias',
        data: [],
        backgroundColor: ['rgba(54, 162, 235, 0.6)'],
      },
    ],
  };

  async function fetchAbsenceData() {
    loading = true;
    error = null;
    try {
      const response = await fetch(`https://app.iedeoccidente.com/get_student_absences.php`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ student_id: studentId }),
      });
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      if (data.error) {
        throw new Error(data.error);
      }
      absences = data;

      chartData = {
        labels: absences.map(a => a.materia),
        datasets: [
          {
            label: 'Total de Inasistencias',
            data: absences.map(a => a.total_absences),
            backgroundColor: absences.map(() => `rgba(${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, 0.6)`),
          },
        ],
      };
    } catch (e: any) {
      error = e.message;
      console.error("Error fetching absence data:", e);
    } finally {
      loading = false;
    }
  }

  onMount(() => {
    if (studentId) {
      fetchAbsenceData();
    }
  });

  function closeModal() {
    showModal = false;
    dispatch('close');
  }
</script>

<Modal bind:open={showModal} size="lg" autoclose={false} permanent={true} class="w-full max-w-4xl">
  <div class="p-6">
    <h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-4">
      Consolidado de Inasistencias para {studentName} (Total Horas Ausente: {totalHoursSum})
    </h3>

    {#if loading}
      <p class="text-center text-gray-700 dark:text-gray-300">Cargando datos de inasistencias...</p>
    {:else if error}
      <p class="text-center text-red-600 dark:text-red-400">Error al cargar los datos: {error}</p>
    {:else if absences.length === 0}
      <p class="text-center text-gray-700 dark:text-gray-300">No hay inasistencias registradas para {studentName}.</p>
    {:else}
      <div class="mb-6">
        <h4 class="text-lg font-medium text-gray-800 dark:text-gray-200 mb-3">Inasistencias por Asignatura</h4>
        <div class="bg-white dark:bg-gray-700 p-4 rounded-lg shadow">
          <Bar data={chartData} options={{ responsive: true, maintainAspectRatio: false }} />
        </div>
      </div>

      <div>
        <h4 class="text-lg font-medium text-gray-800 dark:text-gray-200 mb-3">Detalle de Inasistencias</h4>
        <div class="overflow-x-auto shadow-md sm:rounded-lg">
          <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
              <tr>
                <th scope="col" class="px-6 py-3">Asignatura</th>
                <th scope="col" class="px-6 py-3 text-center">Total Inasistencias</th>
                <th scope="col" class="px-6 py-3 text-center">Horas Ausente</th>
              </tr>
            </thead>
            <tbody>
              {#each absences as absence (absence.materia)}
                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                  <td class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">{absence.materia}</td>
                  <td class="px-6 py-4 text-center">{absence.total_absences}</td>
                  <td class="px-6 py-4 text-center">{absence.total_hours_absent}</td>
                </tr>
              {/each}
            </tbody>
          </table>
        </div>
      </div>
    {/if}    <div class="flex justify-end mt-6">
      <button
        type="button"
        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
        on:click={closeModal}
      >
        Cerrar
      </button>
    </div>


  </div>
</Modal>
