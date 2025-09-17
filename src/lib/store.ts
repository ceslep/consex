import { writable } from 'svelte/store';
import { API_EXCUSES_URL } from './constants';
import * as XLSX from 'xlsx';

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

// Store for data, loading, and error
export const excuseStore = writable({
  data: [] as ExcuseData[],
  loading: false,
  error: null as string | null,
});

// Store for active filters
export const activeFilters = writable<Record<string, string[]>>({
  estudiante: [],
  student_name: [],
  grado: [],
  campus_name: [],
  excuse_date: [],
  excuse_motive: [],
});

// Store for filtered data to be exported
export const filteredDataStore = writable<ExcuseData[]>([]);

export function clearFilters() {
  activeFilters.set({
    estudiante: [],
    student_name: [],
    grado: [],
    campus_name: [],
    excuse_date: [],
    excuse_motive: [],
  });
}

// Map for Spanish headers (can be moved to store or kept in component)
export const headerMap: Record<keyof ExcuseData, string> = {
  estudiante: 'Estudiante ID',
  student_name: 'Nombre del Estudiante',
  grado: 'Grado',
  student_assignment: 'Asignación Estudiante',
  campus_name: 'Sede',
  excuse_date: 'Fecha Excusa',
  excuse_cause: 'Causa Excusa',
  excuse_motive: 'Motivo Excusa',
  excuse_period: 'Período Excusa',
  excuse_hours: 'Horas Excusa',
  excuse_guardian: 'Acudiente',
  excuse_guardian_phone: 'Teléfono Acudiente',
};

// Function to get table headers dynamically, filtering out specified columns
export const getHeaders = (data: ExcuseData[]) => {
  if (data.length === 0) return [];
  const excludedKeys = [
    'student_assignment',
    'excuse_cause',
    'excuse_period',
    'excuse_hours',
    'excuse_guardian',
    'excuse_guardian_phone'
  ];
  return Object.keys(data[0]).filter(key => !excludedKeys.includes(key));
};

export async function fetchData() {
  excuseStore.update(state => ({ ...state, loading: true, error: null }));
  try {
    const response = await fetch(API_EXCUSES_URL);
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    let fetchedData: ExcuseData[] = await response.json();

    // Sort data by excuse_date in descending order
    fetchedData.sort((a, b) => {
      const dateA = new Date(a.excuse_date);
      const dateB = new Date(b.excuse_date);
      return dateB.getTime() - dateA.getTime(); // Descending order
    });

    excuseStore.update(state => ({ ...state, data: fetchedData }));
  } catch (e: any) {
    excuseStore.update(state => ({ ...state, error: e.message }));
  } finally {
    excuseStore.update(state => ({ ...state, loading: false }));
  }
}

export function exportToXlsx(dataToExport: ExcuseData[]) {

  if (dataToExport.length === 0) {
    alert('No hay datos para exportar.');
    return;
  }

  const displayedHeaders = getHeaders(dataToExport);
  const ws_data: any[][] = [];

  // Add header row
  ws_data.push(displayedHeaders.map(key => headerMap[key as keyof ExcuseData] || key));

  // Add data rows
  dataToExport.forEach(row => {
    const rowData: any[] = [];
    displayedHeaders.forEach(key => {
      let value = row[key as keyof ExcuseData];
      if (key === 'grado') {
        // Ensure 'grado' is treated as a string
        rowData.push(String(value));
      } else if (value === null || value === undefined) {
        rowData.push('');
      } else {
        rowData.push(value);
      }
    });
    ws_data.push(rowData);
  });

  const ws = XLSX.utils.aoa_to_sheet(ws_data);

  // Find the index of the 'grado' column
  const gradoColIndex = displayedHeaders.indexOf('grado');

  if (gradoColIndex !== -1) {
    // Apply center alignment to the 'grado' column
    for (let R = 1; R < ws_data.length; ++R) { // Start from 1 to skip header row
      const cell_address = XLSX.utils.encode_cell({ c: gradoColIndex, r: R });
      if (!ws[cell_address]) ws[cell_address] = {};
      ws[cell_address].s = { alignment: { horizontal: "center" } };
    }
  }

  // Set column widths (optional, adjust as needed)
  const wscols = displayedHeaders.map(key => ({ wch: 20 })); // Default width
  ws['!cols'] = wscols;

  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, ws, 'Excusas');
  XLSX.writeFile(wb, 'excuses_data.xlsx');
}