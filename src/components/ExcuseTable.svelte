<script lang="ts">
  import { onMount } from 'svelte';
  import { excuseStore, fetchData, headerMap, getHeaders, activeFilters, clearFilters, filteredDataStore, studentDetailsModalOpen, selectedStudentId, selectedStudentName } from '../lib/store'; // Import from store

  import { Filter } from 'carbon-icons-svelte';

  interface ExcuseData {
    estudiante: number;
    student_name: string;
    grado: string;
    student_assignment: number;
    campus_name: string;
    excuse_date: string;
    excuse_cause: string;
    excuse_motive: string;
    excuse_period: string;
    excuse_hours: string;
    excuse_guardian: string;
    excuse_guardian_phone: string;
  }

  // Modal state
  let openModal = false;
  let currentFilterHeader: string | null = null;
  let tempActiveFilterValues: string[] = [];

  function openFilterModal(header: string) {
    currentFilterHeader = header;
    tempActiveFilterValues = [...$activeFilters[header]]; // Copy current active filters
    openModal = true;
  }

  function applyFilter() {
    if (currentFilterHeader) {
            activeFilters.update(filters => ({ ...filters, [currentFilterHeader!]: tempActiveFilterValues }));
    }
    openModal = false;
  }

  function cancelFilter() {
    if (currentFilterHeader) {
      activeFilters.update(filters => ({ ...filters, [currentFilterHeader!]: [] })); // Clear filter for this column
    }
    openModal = false;
  }

  // Subscribe to store values
  let loading: boolean;
  let error: string | null;

  $: ({ loading, error } = $excuseStore);

  let data: ExcuseData[] = [];
  $: data = $excuseStore.data;

  // Filtered data
  $: filteredData = data.filter(row => {
    for (const key in $activeFilters) {
      const filterValues = $activeFilters[key as keyof typeof $activeFilters];
      if (filterValues.length > 0) {
        const rowValue = String(row[key as keyof ExcuseData]).trim();
        if (!filterValues.includes(rowValue)) {
          return false;
        }
      }
    }
    return true;
  });

  // Update filteredDataStore whenever filteredData changes
  $: filteredDataStore.set(filteredData);

  // Filter state (now managed by store)
  // let activeFilters: Record<string, string[]> = {
  //   estudiante: [],
  //   student_name: [],
  //   grado: [],
  //   campus_name: [],
  //   excuse_date: [],
  //   excuse_motive: [],
  // };

  // Unique options for filters (derived from store data)
  let filterOptions: Record<string, { value: string; name: string }[]> = {
    estudiante: [],
    student_name: [],
    grado: [],
    campus_name: [],
    excuse_date: [],
    excuse_motive: [],
  };

  // Update filter options when store data changes
  $: if ($excuseStore.data) {
    filterOptions.estudiante = [...new Set($excuseStore.data.map(d => String(d.estudiante).trim()))].map(value => ({ value, name: value }));
    filterOptions.student_name = [...new Set($excuseStore.data.map(d => d.student_name.trim()))].map(value => ({ value, name: value }));
    filterOptions.grado = [...new Set($excuseStore.data.map(d => d.grado.trim()))].map(value => ({ value, name: value }));
    filterOptions.campus_name = [...new Set($excuseStore.data.map(d => d.campus_name.trim()))].map(value => ({ value, name: value }));
    filterOptions.excuse_date = [...new Set($excuseStore.data.map(d => d.excuse_date.trim()))].map(value => ({ value, name: value }));
    filterOptions.excuse_motive = [...new Set($excuseStore.data.map(d => d.excuse_motive.trim()))].map(value => ({ value, name: value }));
  }

  onMount(() => {
    fetchData(); // Initial fetch using store action
  });

  $: headers = getHeaders($excuseStore.data); // Use store data to get all possible headers
</script>

<div class="w-[99%] mx-auto py-4">
  <!-- Buttons moved to NavbarLayout.svelte -->

  {#if loading && filteredData.length === 0} <!-- Show initial loading only if no data is present -->
    <p class="text-center text-gray-700">Cargando datos de excusas...</p>
  {:else if error}
    <p class="text-center text-red-600">Error al cargar los datos: {error}</p>
  {:else if filteredData.length === 0}
    <p class="text-center text-gray-700">No hay datos de excusas disponibles.</p>
  {:else}
    <div class="overflow-x-auto shadow-md sm:rounded-lg">
      <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
          <tr>
            {#each headers as header}
              <th scope="col" class="py-3">
                <div class="flex flex-col items-start space-y-1">
                  <button
                    on:click={() => openFilterModal(header)}
                    class="font-bold text-gray-700 dark:text-gray-300 hover:underline focus:outline-none cursor-pointer flex items-center space-x-1
                    {($activeFilters[header] && $activeFilters[header].length > 0) ? 'text-blue-600 dark:text-blue-400' : ''}"
                  >
                    <span>{headerMap[header as keyof ExcuseData] || header.replace(/_/g, ' ').toUpperCase()}</span>
                    {#if $activeFilters[header] && $activeFilters[header].length > 0}
                      <Filter size={16} />
                    {/if}
                  </button>
                </div>
              </th>
            {/each}
          </tr>
        </thead>
        <tbody>
          {#each filteredData as row, index (index)} <!-- Changed key to index -->
            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
              {#each headers as header}
                <td class="py-4 {header === 'grado' ? 'text-center' : ''} {header === 'student_name' ? 'cursor-pointer text-blue-600 hover:underline' : ''}"
                  on:click={() => {
                    if (header === 'student_name') {
                      selectedStudentId.set(row.estudiante);
                      selectedStudentName.set(row.student_name);
                      studentDetailsModalOpen.set(true);
                    }
                  }}>
                  {row[header as keyof ExcuseData]}
                </td>
              {/each}
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  {/if}

  {#if openModal}
    <div
      class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full"
      on:click={cancelFilter}
      on:keydown={(e) => { if (e.key === 'Escape') cancelFilter(); }}
      role="button"
      tabindex="0"
    >
      <div
        class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white dark:bg-gray-800"
        on:click|stopPropagation
        role="dialog"
        aria-modal="true"
        tabindex="-1"
        on:keydown={(e) => { if (e.key === 'Escape') cancelFilter(); }}
      >
        <div class="mt-3 text-center">
          {#if currentFilterHeader}
            <h3 class="mb-5 text-lg font-normal text-gray-800 dark:text-gray-200">
              Filtrar por {headerMap[currentFilterHeader as keyof ExcuseData]}
            </h3>
            <select
              multiple
              bind:value={tempActiveFilterValues}
              class="block w-full pl-3 pr-10 py-1 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md dark:bg-gray-700 dark:border-gray-600 dark:text-white h-48 mb-4"
            >
              {#each filterOptions[currentFilterHeader] as option}
                <option value={option.value}>{option.name}</option>
              {/each}
            </select>
            <div class="items-center px-4 py-3">
              <button
                on:click={applyFilter}
                class="px-4 py-2 bg-blue-500 text-white text-base font-medium rounded-md w-full shadow-sm hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-300 mr-2"
              >
                Aplicar
              </button>
              <button
                on:click={cancelFilter}
                class="px-4 py-2 bg-gray-300 text-gray-800 text-base font-medium rounded-md w-full shadow-sm hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-200 mt-2"
              >
                Cancelar
              </button>
            </div>
          {/if}
        </div>
      </div>
    </div>
  {/if}
</div>