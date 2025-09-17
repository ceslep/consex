<script lang="ts">
  import NavbarLayout from './components/NavbarLayout.svelte';
  import ExcuseTable from './components/ExcuseTable.svelte';
  import { onMount } from 'svelte';
  import { fetchData } from './lib/store';

  onMount(() => {
    fetchData();
  });
</script>

<NavbarLayout>
   <ExcuseTable />
</NavbarLayout>