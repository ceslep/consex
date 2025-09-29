<script lang="ts">
  import { filteredDataStore } from '../lib/store';

  let motives: string[] = [];
  let grades: string[] = [];
  let heatmapData: { motive: string; grade: string; count: number }[] = [];
  let maxCount = 0;

  $: if ($filteredDataStore) {
    const motiveGradeCounts: { [motive: string]: { [grade: string]: number } } = {};

    $filteredDataStore.forEach(excuse => {
      if (!motiveGradeCounts[excuse.excuse_motive]) {
        motiveGradeCounts[excuse.excuse_motive] = {};
      }
      motiveGradeCounts[excuse.excuse_motive][excuse.grado] = (motiveGradeCounts[excuse.excuse_motive][excuse.grado] || 0) + 1;
    });

    motives = Object.keys(motiveGradeCounts).sort();
    // Collect all unique grades and sort them
    const allGrades = new Set<string>();
    motives.forEach(m => {
      Object.keys(motiveGradeCounts[m]).forEach(g => allGrades.add(g));
    });
    grades = Array.from(allGrades).sort();

    heatmapData = [];
    maxCount = 0;

    motives.forEach(motive => {
      grades.forEach(grade => {
        const count = motiveGradeCounts[motive][grade] || 0;
        heatmapData.push({ motive, grade, count });
        if (count > maxCount) {
          maxCount = count;
        }
      });
    });
  }

  function getColor(count: number): string {
    if (maxCount === 0) return 'bg-gray-200 dark:bg-gray-700';
    const intensity = count / maxCount;
    // Using a simple gradient from light blue to dark blue
    const r = Math.floor(255 - (150 * intensity));
    const g = Math.floor(255 - (100 * intensity));
    const b = Math.floor(255 - (50 * intensity));
    return `rgb(${r}, ${g}, ${b})`;
  }
</script>

<div class="p-4 bg-white dark:bg-gray-800 rounded-lg shadow-md mt-6">
  <h4 class="text-lg font-medium text-gray-800 dark:text-gray-200 mb-3">Mapa de Calor: Motivos vs. Grado</h4>

  {#if motives.length > 0 && grades.length > 0}
    <div class="overflow-x-auto">
      <div class="grid gap-1" style="grid-template-columns: auto repeat({grades.length}, minmax(50px, 1fr));">
        <!-- Corner and Grade Headers -->
        <div class="p-2 font-bold text-center text-gray-700 dark:text-gray-300"></div>
        {#each grades as grade}
          <div class="p-2 font-bold text-center text-gray-700 dark:text-gray-300 text-xs rotate-45 origin-bottom-left whitespace-nowrap">{grade}</div>
        {/each}

        <!-- Motive Rows -->
        {#each motives as motive}
          <div class="p-2 font-bold text-right text-gray-700 dark:text-gray-300 text-sm">{motive}</div>
          {#each grades as grade}
            {@const cellData = heatmapData.find(d => d.motive === motive && d.grade === grade)}
            <div
              class="p-2 text-center text-xs text-gray-900 dark:text-gray-100 flex items-center justify-center"
              style="background-color: {getColor(cellData?.count || 0)}; height: 40px;"
              title="{motive} en {grade}: {cellData?.count || 0}"
            >
              {cellData?.count || ''}
            </div>
          {/each}
        {/each}
      </div>
    </div>
  {:else}
    <p class="text-center text-gray-700 dark:text-gray-300">No hay datos para mostrar el mapa de calor.</p>
  {/if}
</div>
