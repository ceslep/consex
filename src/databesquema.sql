-- Database Schema
-- Generated on 2025-09-16T15:02:08.061Z

-- Total tables: 91

-- Table: accesos_especiales
-- Columns: 3
CREATE TABLE accesos_especiales (
    ind bigint NOT NULL,
    docente bigint NOT NULL,
    asignaturas text NOT NULL
);

-- Table: actualizacion
-- Columns: 4
CREATE TABLE actualizacion (
    ind bigint NOT NULL,
    disponible char NOT NULL,
    fechaInicial date NOT NULL,
    fechaFinal date NOT NULL
);

-- Table: acudientesTTTT
-- Columns: 5
CREATE TABLE acudientesTTTT (
    ind int NOT NULL,
    estudiante varchar,
    acudiente varchar,
    telefono1 varchar,
    telefono2 varchar NOT NULL
);

-- Table: areasCINCO
-- Columns: 5
CREATE TABLE areasCINCO (
    estudiante bigint NOT NULL,
    nombres varchar,
    area varchar,
    asignat varchar NOT NULL,
    valoracion double
);

-- Table: areasFinal
-- Columns: 5
CREATE TABLE areasFinal (
    estudiante varchar NOT NULL,
    nombres varchar,
    area varchar,
    asignat varchar NOT NULL,
    valoracion double
);

-- Table: areastotales
-- Columns: 9
CREATE TABLE areastotales (
    estudiante bigint,
    grado varchar NOT NULL,
    nombres varchar,
    sede varchar NOT NULL,
    area varchar,
    asignatura varchar,
    valoracion double,
    nivel int,
    numero int NOT NULL DEFAULT 0
);

-- Table: asignacion_asignaturas
-- Columns: 14
CREATE TABLE asignacion_asignaturas (
    ind bigint NOT NULL,
    docente bigint,
    sede int NOT NULL,
    asignatura varchar,
    grados varchar,
    nivel int NOT NULL,
    numero int NOT NULL,
    abreviatura varchar NOT NULL,
    materia varchar NOT NULL,
    codigo varchar NOT NULL,
    banda varchar NOT NULL,
    visible varchar NOT NULL DEFAULT S,
    orden double NOT NULL,
    year int NOT NULL
);

-- Table: asignacion_asignaturas_old
-- Columns: 14
CREATE TABLE asignacion_asignaturas_old (
    ind bigint NOT NULL,
    docente bigint,
    sede int NOT NULL,
    asignatura varchar,
    grados varchar,
    nivel int NOT NULL,
    numero int NOT NULL,
    abreviatura varchar NOT NULL,
    materia varchar NOT NULL,
    codigo varchar NOT NULL,
    banda varchar NOT NULL,
    visible varchar NOT NULL DEFAULT S,
    orden double NOT NULL,
    year int NOT NULL
);

-- Table: aspectosIndividuales
-- Columns: 11
CREATE TABLE aspectosIndividuales (
    ind bigint NOT NULL,
    docente bigint NOT NULL,
    grado varchar NOT NULL,
    periodo varchar NOT NULL,
    asignatura varchar NOT NULL,
    aspecto varchar NOT NULL,
    porcentaje decimal,
    fecha date,
    nota int NOT NULL,
    year int NOT NULL,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: cantidades
-- Columns: 6
CREATE TABLE cantidades (
    estudiante bigint NOT NULL,
    nombres varchar,
    grado varchar NOT NULL,
    sede varchar NOT NULL,
    periodo varchar,
    cantidad bigint NOT NULL DEFAULT 0
);

-- Table: cantidadesNulas
-- Columns: 4
CREATE TABLE cantidadesNulas (
    grado varchar NOT NULL,
    sede varchar NOT NULL,
    periodo varchar,
    moda bigint NOT NULL DEFAULT 0
);

-- Table: codigos
-- Columns: 3
CREATE TABLE codigos (
    ind int NOT NULL,
    codigo int,
    estudiante varchar
);

-- Table: consolidado_inasistencias_2023
-- Columns: 6
CREATE TABLE consolidado_inasistencias_2023 (
    estudiante bigint NOT NULL,
    nombres varchar,
    grupo varchar,
    sede varchar NOT NULL,
    materia varchar NOT NULL,
    total double
);

-- Table: Consulta odontologia
-- Columns: 10
CREATE TABLE Consulta odontologia (
    nombres varchar,
    estudiante bigint NOT NULL,
    eps varchar NOT NULL,
    direccion varchar NOT NULL,
    telefono1 varchar NOT NULL,
    telefono2 varchar NOT NULL,
    activo varchar,
    asignacion_descripcion varchar NOT NULL,
    nivel int,
    numero int NOT NULL
);

-- Table: convivencia
-- Columns: 16
CREATE TABLE convivencia (
    ind bigint NOT NULL,
    estudiante bigint NOT NULL,
    docente bigint NOT NULL,
    asignatura varchar NOT NULL,
    tipoFalta varchar NOT NULL,
    faltas longtext NOT NULL,
    hora varchar NOT NULL,
    fecha date NOT NULL,
    descripcionSituacion longtext NOT NULL,
    descargosEstudiante longtext NOT NULL,
    positivos longtext NOT NULL,
    firma longtext NOT NULL,
    firmaAcudiente longtext NOT NULL,
    device varchar NOT NULL,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    year int NOT NULL
);

-- Table: desempenos
-- Columns: 10
CREATE TABLE desempenos (
    ind bigint NOT NULL,
    grado varchar NOT NULL,
    asignatura varchar NOT NULL,
    docente bigint NOT NULL,
    periodo varchar NOT NULL,
    desempeno varchar NOT NULL,
    descripcion varchar NOT NULL,
    descripcionEspecial varchar NOT NULL,
    updatedat timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    year int NOT NULL
);

-- Table: desempenos2
-- Columns: 10
CREATE TABLE desempenos2 (
    ind bigint NOT NULL DEFAULT 0,
    grado varchar NOT NULL,
    asignatura varchar NOT NULL,
    docente bigint NOT NULL,
    periodo varchar NOT NULL,
    desempeno varchar NOT NULL,
    descripcion varchar NOT NULL,
    descripcionEspecial varchar NOT NULL,
    updatedat timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    year int NOT NULL
);

-- Table: desempenos3
-- Columns: 10
CREATE TABLE desempenos3 (
    ind bigint NOT NULL DEFAULT 0,
    grado varchar NOT NULL,
    asignatura varchar NOT NULL,
    docente bigint NOT NULL,
    periodo varchar NOT NULL,
    desempeno varchar NOT NULL,
    descripcion varchar NOT NULL,
    descripcionEspecial varchar NOT NULL,
    updatedat timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    year int NOT NULL
);

-- Table: docentes
-- Columns: 15
CREATE TABLE docentes (
    identificacion bigint,
    nombres varchar,
    correo varchar NOT NULL,
    asignacion varchar,
    activo varchar,
    pass varchar,
    codigoTemporal varchar NOT NULL,
    solocitaCodigo varchar NOT NULL,
    verEstudiantes varchar NOT NULL DEFAULT N,
    maestra varchar NOT NULL,
    banda varchar NOT NULL,
    acceso_total varchar NOT NULL,
    idn longtext NOT NULL,
    soloexcusas varchar NOT NULL DEFAULT N,
    fechaactualizacion datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: escalas_1290
-- Columns: 6
CREATE TABLE escalas_1290 (
    ind int NOT NULL,
    valoracion varchar NOT NULL,
    inicio double NOT NULL,
    fin double NOT NULL,
    abreviatura varchar NOT NULL,
    year int NOT NULL
);

-- Table: estadoNotas
-- Columns: 2
CREATE TABLE estadoNotas (
    ind int NOT NULL,
    estado int NOT NULL
);

-- Table: estudiantesactivos
-- Columns: 5
CREATE TABLE estudiantesactivos (
    estudiante bigint NOT NULL,
    nombres varchar,
    nivel int,
    numero int NOT NULL,
    asignacion varchar NOT NULL
);

-- Table: estugrps
-- Columns: 4
CREATE TABLE estugrps (
    estudiante bigint NOT NULL,
    nombres varchar,
    asignacion int,
    grupo varchar
);

-- Table: estugrupos
-- Columns: 53
CREATE TABLE estugrupos (
    ind bigint NOT NULL,
    codigo bigint NOT NULL,
    estudiante bigint NOT NULL,
    nombres varchar,
    asignacion int,
    institucion_externa varchar NOT NULL,
    genero varchar NOT NULL,
    fecnac date NOT NULL,
    edad int NOT NULL,
    nivel int,
    grado varchar,
    numero int NOT NULL,
    anio int NOT NULL,
    pass varchar NOT NULL,
    activo varchar,
    banda varchar NOT NULL,
    HED varchar NOT NULL,
    idacudiente varchar NOT NULL,
    acudiente varchar NOT NULL,
    telefono1 varchar NOT NULL,
    telefono2 varchar NOT NULL,
    direccion varchar NOT NULL,
    email_estudiante varchar NOT NULL,
    email_acudiente varchar NOT NULL,
    desertor varchar NOT NULL DEFAULT N,
    otraInformacion varchar NOT NULL,
    estado varchar NOT NULL,
    year int NOT NULL,
    lugar varchar NOT NULL,
    sisben varchar NOT NULL,
    estrato varchar NOT NULL,
    lugarNacimiento varchar NOT NULL,
    lugarExpedicion varchar NOT NULL,
    fechaExpedicion varchar NOT NULL,
    tdei varchar NOT NULL,
    victimaConflicto varchar NOT NULL,
    lugarDesplazamiento varchar NOT NULL,
    fechaDesplazamiento varchar NOT NULL,
    etnia varchar NOT NULL,
    tipoSangre varchar NOT NULL,
    eps varchar NOT NULL,
    padre varchar NOT NULL,
    padreid varchar NOT NULL,
    telefonopadre varchar NOT NULL,
    ocupacionpadre varchar NOT NULL,
    madre varchar NOT NULL,
    madreid varchar NOT NULL,
    telefonomadre varchar NOT NULL,
    ocupacionmadre varchar NOT NULL,
    parentesco varchar NOT NULL,
    discapacidad varchar NOT NULL,
    telefono_acudiente varchar NOT NULL,
    eanterior varchar NOT NULL
);

-- Table: estugrupos2
-- Columns: 53
CREATE TABLE estugrupos2 (
    ind bigint NOT NULL,
    codigo bigint NOT NULL,
    estudiante bigint NOT NULL,
    nombres varchar,
    asignacion int,
    institucion_externa varchar NOT NULL,
    genero varchar NOT NULL,
    fecnac date NOT NULL,
    edad int NOT NULL,
    nivel int,
    grado varchar,
    numero int NOT NULL,
    anio int NOT NULL,
    pass varchar NOT NULL,
    activo varchar,
    banda varchar NOT NULL,
    HED varchar NOT NULL,
    idacudiente varchar NOT NULL,
    acudiente varchar NOT NULL,
    telefono1 varchar NOT NULL,
    telefono2 varchar NOT NULL,
    direccion varchar NOT NULL,
    email_estudiante varchar NOT NULL,
    email_acudiente varchar NOT NULL,
    desertor varchar NOT NULL DEFAULT N,
    otraInformacion varchar NOT NULL,
    estado varchar NOT NULL,
    year int NOT NULL,
    lugar varchar NOT NULL,
    sisben varchar NOT NULL,
    estrato varchar NOT NULL,
    lugarNacimiento varchar NOT NULL,
    lugarExpedicion varchar NOT NULL,
    fechaExpedicion varchar NOT NULL,
    tdei varchar NOT NULL,
    victimaConflicto varchar NOT NULL,
    lugarDesplazamiento varchar NOT NULL,
    fechaDesplazamiento varchar NOT NULL,
    etnia varchar NOT NULL,
    tipoSangre varchar NOT NULL,
    eps varchar NOT NULL,
    padre varchar NOT NULL,
    padreid varchar NOT NULL,
    telefonopadre varchar NOT NULL,
    ocupacionpadre varchar NOT NULL,
    madre varchar NOT NULL,
    madreid varchar NOT NULL,
    telefonomadre varchar NOT NULL,
    ocupacionmadre varchar NOT NULL,
    parentesco varchar NOT NULL,
    discapacidad varchar NOT NULL,
    telefono_acudiente varchar NOT NULL,
    eanterior varchar NOT NULL
);

-- Table: estugrupos2023
-- Columns: 23
CREATE TABLE estugrupos2023 (
    ind bigint NOT NULL,
    codigo bigint NOT NULL,
    estudiante bigint NOT NULL,
    nombres varchar,
    asignacion int,
    genero varchar NOT NULL,
    nivel int,
    grado varchar,
    numero int NOT NULL,
    anio int NOT NULL,
    pass varchar NOT NULL,
    activo varchar,
    banda varchar NOT NULL,
    HED varchar NOT NULL,
    acudiente varchar NOT NULL,
    telefono1 varchar NOT NULL,
    telefono2 varchar NOT NULL,
    direccion varchar NOT NULL,
    email_estudiante varchar NOT NULL,
    email_acudiente varchar NOT NULL,
    desertor varchar NOT NULL DEFAULT N,
    otraInformacion varchar NOT NULL,
    year int NOT NULL
);

-- Table: estugrupos3
-- Columns: 53
CREATE TABLE estugrupos3 (
    ind bigint NOT NULL,
    codigo bigint NOT NULL,
    estudiante bigint NOT NULL,
    nombres varchar,
    asignacion int,
    institucion_externa varchar NOT NULL,
    genero varchar NOT NULL,
    fecnac date NOT NULL,
    edad int NOT NULL,
    nivel int,
    grado varchar,
    numero int NOT NULL,
    anio int NOT NULL,
    pass varchar NOT NULL,
    activo varchar,
    banda varchar NOT NULL,
    HED varchar NOT NULL,
    idacudiente varchar NOT NULL,
    acudiente varchar NOT NULL,
    telefono1 varchar NOT NULL,
    telefono2 varchar NOT NULL,
    direccion varchar NOT NULL,
    email_estudiante varchar NOT NULL,
    email_acudiente varchar NOT NULL,
    desertor varchar NOT NULL DEFAULT N,
    otraInformacion varchar NOT NULL,
    estado varchar NOT NULL,
    year int NOT NULL,
    lugar varchar NOT NULL,
    sisben varchar NOT NULL,
    estrato varchar NOT NULL,
    lugarNacimiento varchar NOT NULL,
    lugarExpedicion varchar NOT NULL,
    fechaExpedicion varchar NOT NULL,
    tdei varchar NOT NULL,
    victimaConflicto varchar NOT NULL,
    lugarDesplazamiento varchar NOT NULL,
    fechaDesplazamiento varchar NOT NULL,
    etnia varchar NOT NULL,
    tipoSangre varchar NOT NULL,
    eps varchar NOT NULL,
    padre varchar NOT NULL,
    padreid varchar NOT NULL,
    telefonopadre varchar NOT NULL,
    ocupacionpadre varchar NOT NULL,
    madre varchar NOT NULL,
    madreid varchar NOT NULL,
    telefonomadre varchar NOT NULL,
    ocupacionmadre varchar NOT NULL,
    parentesco varchar NOT NULL,
    discapacidad varchar NOT NULL,
    telefono_acudiente varchar NOT NULL,
    eanterior varchar NOT NULL
);

-- Table: estugruposALL
-- Columns: 11
CREATE TABLE estugruposALL (
    ind bigint NOT NULL,
    estudiante bigint,
    nivel bigint,
    grupo varchar,
    anio bigint,
    asignacion bigint,
    director varchar,
    fecha_matricula date,
    nombregrupo varchar,
    jornada varchar,
    numero varchar
);

-- Table: excusas
-- Columns: 14
CREATE TABLE excusas (
    ind int NOT NULL,
    estudiante bigint NOT NULL,
    fecha date NOT NULL,
    causa text NOT NULL,
    motivo varchar NOT NULL,
    periodo varchar NOT NULL,
    horas time NOT NULL,
    motivo_permiso varchar NOT NULL,
    hora_salida varchar NOT NULL,
    acudiente varchar NOT NULL,
    otros varchar NOT NULL,
    telefono_acudiente varchar NOT NULL,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    year int NOT NULL
);

-- Table: FaltanDesempeños
-- Columns: 4
CREATE TABLE FaltanDesempeños (
    docente bigint,
    nombres varchar,
    asignatura varchar,
    grados varchar
);

-- Table: fecnacs
-- Columns: 8
CREATE TABLE fecnacs (
    codigo int,
    nombres varchar,
    identificacion varchar,
    fecnac varchar,
    acudiente varchar,
    telefono1 varchar,
    telefono2 varchar,
    estado varchar
);

-- Table: firmas_estudiantes
-- Columns: 9
CREATE TABLE firmas_estudiantes (
    ind bigint NOT NULL,
    estudiante bigint NOT NULL,
    docente int NOT NULL,
    asignatura varchar NOT NULL,
    fecha date NOT NULL,
    descargos text NOT NULL,
    observacionDocente text NOT NULL,
    firma longblob NOT NULL,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: Hoja1
-- Columns: 10
CREATE TABLE Hoja1 (
    A int,
    B varchar,
    C varchar,
    D int,
    E varchar,
    F varchar,
    G varchar,
    H varchar,
    I varchar,
    J int
);

-- Table: horarios
-- Columns: 6
CREATE TABLE horarios (
    id bigint NOT NULL,
    docente varchar NOT NULL,
    grado varchar NOT NULL,
    materia varchar NOT NULL,
    dia varchar NOT NULL,
    hora int NOT NULL
);

-- Table: inasistencia
-- Columns: 17
CREATE TABLE inasistencia (
    ind int NOT NULL,
    estudiante bigint NOT NULL,
    nivel int NOT NULL,
    numero int NOT NULL,
    asignacion int NOT NULL,
    materia varchar NOT NULL,
    periodo varchar NOT NULL,
    fecha date NOT NULL,
    horas varchar NOT NULL,
    excusa varchar NOT NULL,
    docente int NOT NULL,
    hora_clase varchar NOT NULL,
    convivencia text NOT NULL,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    detalle varchar NOT NULL,
    device text NOT NULL,
    year int NOT NULL
);

-- Table: inasistencias_2023
-- Columns: 16
CREATE TABLE inasistencias_2023 (
    ind int NOT NULL DEFAULT 0,
    estudiante bigint NOT NULL,
    nivel int NOT NULL,
    numero int NOT NULL,
    asignacion int NOT NULL,
    materia varchar NOT NULL,
    periodo varchar NOT NULL,
    fecha date NOT NULL,
    horas varchar NOT NULL,
    excusa varchar NOT NULL,
    docente int NOT NULL,
    hora_clase varchar NOT NULL,
    convivencia text NOT NULL,
    fechahora timestamp NOT NULL DEFAULT 0000-00-00 00:00:00,
    detalle varchar NOT NULL,
    year int NOT NULL
);

-- Table: inast2
-- Columns: 6
CREATE TABLE inast2 (
    estudiante varchar NOT NULL,
    nivel int,
    numero int NOT NULL,
    asignacion int,
    fecha date NOT NULL,
    materia varchar NOT NULL
);

-- Table: info_establecimiento
-- Columns: 7
CREATE TABLE info_establecimiento (
    ind bigint NOT NULL,
    nombre varchar NOT NULL,
    escudo longtext NOT NULL,
    nota_minima decimal NOT NULL,
    nnotas int NOT NULL,
    nota0 decimal NOT NULL,
    estado varchar NOT NULL
);

-- Table: intensidadHoraria
-- Columns: 4
CREATE TABLE intensidadHoraria (
    ind bigint NOT NULL,
    asignacion varchar NOT NULL,
    nivel varchar NOT NULL,
    valor varchar NOT NULL
);

-- Table: itemsConvivencia
-- Columns: 3
CREATE TABLE itemsConvivencia (
    ind bigint NOT NULL,
    itemConvivencia text NOT NULL,
    tipo varchar NOT NULL
);

-- Table: log
-- Columns: 10
CREATE TABLE log (
    ind bigint NOT NULL,
    estudiante varchar NOT NULL,
    nombres varchar NOT NULL,
    nivel int NOT NULL,
    numero int NOT NULL,
    movil varchar NOT NULL,
    userAgent text NOT NULL,
    ip varchar NOT NULL,
    coords varchar NOT NULL,
    registerat timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: login
-- Columns: 6
CREATE TABLE login (
    ind bigint NOT NULL,
    identificacion varchar NOT NULL,
    nombres varchar NOT NULL,
    info json NOT NULL,
    infoCliente json NOT NULL,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: matricula
-- Columns: 87
CREATE TABLE matricula (
    ind bigint NOT NULL,
    municipio varchar,
    fecha date,
    codigo bigint,
    nombre1 varchar,
    nombre2 varchar,
    apellido1 varchar,
    apellido2 varchar,
    nombres2 varchar,
    sexo varchar,
    hemoclasificacion varchar,
    fecnac date,
    edad varchar,
    lugarnacimiento varchar,
    tdei varchar,
    identificacion varchar,
    zona varchar,
    barrio varchar,
    vereda varchar,
    direccion varchar,
    telefono varchar,
    nivel int,
    aula varchar,
    jornada varchar,
    principal varchar,
    asignacion varchar,
    procedencia text,
    padre varchar,
    identificacion_padre varchar,
    ocupacion_padre varchar,
    madre varchar,
    identificacion_madre varchar,
    ocupacion_madre varchar,
    acudiente varchar,
    identificacion_acudiente varchar,
    ocupacion_acudiente varchar,
    telefono_padre varchar,
    email_padre varchar,
    telefono_madre varchar,
    email_madre varchar,
    telefono_acudiente varchar,
    email_acudiente varchar,
    observaciones text,
    estado varchar,
    distancia varchar,
    estrato varchar,
    rgss varchar,
    estado_padres varchar,
    exonerados char,
    razon_exoneracion varchar,
    otra_razon varchar,
    otros text,
    valor_matricula float,
    recibo varchar,
    impreso char,
    cualsalud varchar,
    nombres varchar,
    convive varchar,
    parentesco varchar,
    expedida varchar,
    sisben int,
    conflicto int,
    munproviene varchar,
    origen_institucion char,
    origen char,
    tipo_discapacidad varchar,
    scapacidades varchar,
    etnia varchar,
    tdoc_acudiente varchar,
    exp_acudiente varchar,
    dir_acudiente varchar,
    nuevo char,
    foto longblob,
    exalumno char,
    grupo varchar,
    banda char,
    horas_servicio varchar,
    descripcion_servicio text,
    refrigerio char,
    desayuno char,
    almuerzo char,
    numero varchar,
    especialidad varchar,
    otra_info varchar,
    municipio_desplazado varchar,
    fecha_desplazado date,
    especial char
);

-- Table: mensajeNotas
-- Columns: 2
CREATE TABLE mensajeNotas (
    ind int NOT NULL,
    mensaje varchar NOT NULL
);

-- Table: mensajes
-- Columns: 4
CREATE TABLE mensajes (
    ind int NOT NULL,
    linea1 varchar NOT NULL,
    linea2 varchar NOT NULL,
    activo varchar
);

-- Table: noconcedidos
-- Columns: 8
CREATE TABLE noconcedidos (
    ind bigint NOT NULL,
    nombres varchar NOT NULL,
    identificacion varchar NOT NULL,
    pass varchar NOT NULL,
    pass2 varchar NOT NULL,
    info json NOT NULL,
    infocliente json NOT NULL,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: noconcedidos2
-- Columns: 8
CREATE TABLE noconcedidos2 (
    ind bigint NOT NULL DEFAULT 0,
    nombres varchar NOT NULL,
    identificacion varchar NOT NULL,
    pass varchar NOT NULL,
    pass2 varchar NOT NULL,
    info json NOT NULL,
    infocliente json NOT NULL,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: nombresNiveles
-- Columns: 3
CREATE TABLE nombresNiveles (
    ind int NOT NULL,
    nivel int NOT NULL,
    nombre varchar NOT NULL
);

-- Table: notas
-- Columns: 81
CREATE TABLE notas (
    ind bigint NOT NULL,
    estudiante bigint,
    grado varchar NOT NULL,
    asignatura varchar,
    docente bigint,
    periodo varchar,
    valoracion decimal,
    nota1 decimal,
    nota2 decimal,
    nota3 decimal,
    nota4 decimal,
    nota5 decimal,
    nota6 decimal,
    nota7 decimal,
    nota8 decimal,
    nota9 decimal,
    nota10 decimal,
    nota11 decimal,
    nota12 decimal,
    porcentaje1 decimal,
    porcentaje2 decimal,
    porcentaje3 decimal,
    porcentaje4 decimal,
    porcentaje5 decimal,
    porcentaje6 decimal,
    porcentaje7 decimal,
    porcentaje8 decimal,
    porcentaje9 decimal,
    porcentaje10 decimal,
    porcentaje11 decimal,
    porcentaje12 decimal,
    aspecto1 varchar,
    aspecto2 varchar,
    aspecto3 varchar,
    aspecto4 varchar,
    aspecto5 varchar,
    aspecto6 varchar,
    aspecto7 varchar,
    aspecto8 varchar,
    aspecto9 varchar,
    aspecto10 varchar,
    aspecto11 varchar,
    aspecto12 varchar,
    fecha1 date,
    fecha2 date,
    fecha3 date,
    fecha4 date,
    fecha5 date,
    fecha6 date,
    fecha7 date,
    fecha8 date,
    fecha9 date,
    fecha10 date,
    fecha11 date,
    fecha12 date,
    anotacion1 text,
    anotacion2 text,
    anotacion3 text,
    anotacion4 text,
    anotacion5 text,
    anotacion6 text,
    anotacion7 text,
    anotacion8 text,
    anotacion9 text,
    anotacion10 text,
    anotacion11 text,
    anotacion12 text,
    fechaa1 date,
    fechaa2 date,
    fechaa3 date,
    fechaa4 date,
    fechaa5 date,
    fechaa6 date,
    fechaa7 date,
    fechaa8 date,
    fechaa9 date,
    fechaa10 date,
    fechaa11 date,
    fechaa12 date,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    year int DEFAULT 2021
);

-- Table: notas2
-- Columns: 81
CREATE TABLE notas2 (
    ind bigint NOT NULL,
    estudiante bigint,
    grado varchar NOT NULL,
    asignatura varchar,
    docente varchar,
    periodo varchar,
    valoracion decimal,
    nota1 decimal,
    nota2 decimal,
    nota3 decimal,
    nota4 decimal,
    nota5 decimal,
    nota6 decimal,
    nota7 decimal,
    nota8 decimal,
    nota9 decimal,
    nota10 decimal,
    nota11 decimal,
    nota12 decimal,
    porcentaje1 decimal,
    porcentaje2 decimal,
    porcentaje3 decimal,
    porcentaje4 decimal,
    porcentaje5 decimal,
    porcentaje6 decimal,
    porcentaje7 decimal,
    porcentaje8 decimal,
    porcentaje9 decimal,
    porcentaje10 decimal,
    porcentaje11 decimal,
    porcentaje12 decimal,
    aspecto1 varchar,
    aspecto2 varchar,
    aspecto3 varchar,
    aspecto4 varchar,
    aspecto5 varchar,
    aspecto6 varchar,
    aspecto7 varchar,
    aspecto8 varchar,
    aspecto9 varchar,
    aspecto10 varchar,
    aspecto11 varchar,
    aspecto12 varchar,
    fecha1 date,
    fecha2 date,
    fecha3 date,
    fecha4 date,
    fecha5 date,
    fecha6 date,
    fecha7 date,
    fecha8 date,
    fecha9 date,
    fecha10 date,
    fecha11 date,
    fecha12 date,
    anotacion1 text,
    anotacion2 text,
    anotacion3 text,
    anotacion4 text,
    anotacion5 text,
    anotacion6 text,
    anotacion7 text,
    anotacion8 text,
    anotacion9 text,
    anotacion10 text,
    anotacion11 text,
    anotacion12 text,
    fechaa1 date,
    fechaa2 date,
    fechaa3 date,
    fechaa4 date,
    fechaa5 date,
    fechaa6 date,
    fechaa7 date,
    fechaa8 date,
    fechaa9 date,
    fechaa10 date,
    fechaa11 date,
    fechaa12 date,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    year int NOT NULL
);

-- Table: notas2022
-- Columns: 18
CREATE TABLE notas2022 (
    docente bigint,
    estudiante bigint,
    grado varchar NOT NULL,
    asignatura varchar,
    valoracion decimal,
    periodo varchar,
    nota1 decimal,
    nota2 decimal,
    nota3 decimal,
    nota4 decimal,
    nota5 decimal,
    nota6 decimal,
    nota7 decimal,
    nota8 decimal,
    nota9 decimal,
    nota10 decimal,
    nota11 decimal,
    nota12 decimal
);

-- Table: notas2022Full
-- Columns: 6
CREATE TABLE notas2022Full (
    estudiante bigint NOT NULL,
    nombres varchar,
    docente varchar,
    asignatura varchar,
    periodo varchar,
    valoracion decimal
);

-- Table: notas3
-- Columns: 80
CREATE TABLE notas3 (
    ind bigint NOT NULL DEFAULT 0,
    estudiante bigint,
    grado varchar NOT NULL,
    asignatura varchar,
    docente varchar,
    periodo varchar,
    valoracion decimal,
    nota1 decimal,
    nota2 decimal,
    nota3 decimal,
    nota4 decimal,
    nota5 decimal,
    nota6 decimal,
    nota7 decimal,
    nota8 decimal,
    nota9 decimal,
    nota10 decimal,
    nota11 decimal,
    nota12 decimal,
    porcentaje1 decimal,
    porcentaje2 decimal,
    porcentaje3 decimal,
    porcentaje4 decimal,
    porcentaje5 decimal,
    porcentaje6 decimal,
    porcentaje7 decimal,
    porcentaje8 decimal,
    porcentaje9 decimal,
    porcentaje10 decimal,
    porcentaje11 decimal,
    porcentaje12 decimal,
    aspecto1 varchar,
    aspecto2 varchar,
    aspecto3 varchar,
    aspecto4 varchar,
    aspecto5 varchar,
    aspecto6 varchar,
    aspecto7 varchar,
    aspecto8 varchar,
    aspecto9 varchar,
    aspecto10 varchar,
    aspecto11 varchar,
    aspecto12 varchar,
    fecha1 date,
    fecha2 date,
    fecha3 date,
    fecha4 date,
    fecha5 date,
    fecha6 date,
    fecha7 date,
    fecha8 date,
    fecha9 date,
    fecha10 date,
    fecha11 date,
    fecha12 date,
    anotacion1 text,
    anotacion2 text,
    anotacion3 text,
    anotacion4 text,
    anotacion5 text,
    anotacion6 text,
    anotacion7 text,
    anotacion8 text,
    anotacion9 text,
    anotacion10 text,
    anotacion11 text,
    anotacion12 text,
    fechaa1 date,
    fechaa2 date,
    fechaa3 date,
    fechaa4 date,
    fechaa5 date,
    fechaa6 date,
    fechaa7 date,
    fechaa8 date,
    fechaa9 date,
    fechaa10 date,
    fechaa11 date,
    fechaa12 date,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: notascopy
-- Columns: 80
CREATE TABLE notascopy (
    ind bigint NOT NULL,
    estudiante bigint,
    grado varchar NOT NULL,
    asignatura varchar,
    docente varchar,
    periodo varchar,
    valoracion decimal,
    nota1 decimal,
    nota2 decimal,
    nota3 decimal,
    nota4 decimal,
    nota5 decimal,
    nota6 decimal,
    nota7 decimal,
    nota8 decimal,
    nota9 decimal,
    nota10 decimal,
    nota11 decimal,
    nota12 decimal,
    porcentaje1 decimal,
    porcentaje2 decimal,
    porcentaje3 decimal,
    porcentaje4 decimal,
    porcentaje5 decimal,
    porcentaje6 decimal,
    porcentaje7 decimal,
    porcentaje8 decimal,
    porcentaje9 decimal,
    porcentaje10 decimal,
    porcentaje11 decimal,
    porcentaje12 decimal,
    aspecto1 varchar,
    aspecto2 varchar,
    aspecto3 varchar,
    aspecto4 varchar,
    aspecto5 varchar,
    aspecto6 varchar,
    aspecto7 varchar,
    aspecto8 varchar,
    aspecto9 varchar,
    aspecto10 varchar,
    aspecto11 varchar,
    aspecto12 varchar,
    fecha1 date,
    fecha2 date,
    fecha3 date,
    fecha4 date,
    fecha5 date,
    fecha6 date,
    fecha7 date,
    fecha8 date,
    fecha9 date,
    fecha10 date,
    fecha11 date,
    fecha12 date,
    anotacion1 text,
    anotacion2 text,
    anotacion3 text,
    anotacion4 text,
    anotacion5 text,
    anotacion6 text,
    anotacion7 text,
    anotacion8 text,
    anotacion9 text,
    anotacion10 text,
    anotacion11 text,
    anotacion12 text,
    fechaa1 date,
    fechaa2 date,
    fechaa3 date,
    fechaa4 date,
    fechaa5 date,
    fechaa6 date,
    fechaa7 date,
    fechaa8 date,
    fechaa9 date,
    fechaa10 date,
    fechaa11 date,
    fechaa12 date,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: notasTemporales
-- Columns: 81
CREATE TABLE notasTemporales (
    ind bigint NOT NULL DEFAULT 0,
    estudiante bigint,
    grado varchar NOT NULL,
    asignatura varchar,
    docente bigint,
    periodo varchar,
    valoracion decimal,
    nota1 decimal,
    nota2 decimal,
    nota3 decimal,
    nota4 decimal,
    nota5 decimal,
    nota6 decimal,
    nota7 decimal,
    nota8 decimal,
    nota9 decimal,
    nota10 decimal,
    nota11 decimal,
    nota12 decimal,
    porcentaje1 decimal,
    porcentaje2 decimal,
    porcentaje3 decimal,
    porcentaje4 decimal,
    porcentaje5 decimal,
    porcentaje6 decimal,
    porcentaje7 decimal,
    porcentaje8 decimal,
    porcentaje9 decimal,
    porcentaje10 decimal,
    porcentaje11 decimal,
    porcentaje12 decimal,
    aspecto1 varchar,
    aspecto2 varchar,
    aspecto3 varchar,
    aspecto4 varchar,
    aspecto5 varchar,
    aspecto6 varchar,
    aspecto7 varchar,
    aspecto8 varchar,
    aspecto9 varchar,
    aspecto10 varchar,
    aspecto11 varchar,
    aspecto12 varchar,
    fecha1 date,
    fecha2 date,
    fecha3 date,
    fecha4 date,
    fecha5 date,
    fecha6 date,
    fecha7 date,
    fecha8 date,
    fecha9 date,
    fecha10 date,
    fecha11 date,
    fecha12 date,
    anotacion1 text,
    anotacion2 text,
    anotacion3 text,
    anotacion4 text,
    anotacion5 text,
    anotacion6 text,
    anotacion7 text,
    anotacion8 text,
    anotacion9 text,
    anotacion10 text,
    anotacion11 text,
    anotacion12 text,
    fechaa1 date,
    fechaa2 date,
    fechaa3 date,
    fechaa4 date,
    fechaa5 date,
    fechaa6 date,
    fechaa7 date,
    fechaa8 date,
    fechaa9 date,
    fechaa10 date,
    fechaa11 date,
    fechaa12 date,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    year int DEFAULT 2021
);

-- Table: notasTemporales2
-- Columns: 81
CREATE TABLE notasTemporales2 (
    ind bigint NOT NULL DEFAULT 0,
    estudiante bigint,
    grado varchar NOT NULL,
    asignatura varchar,
    docente bigint,
    periodo varchar,
    valoracion decimal,
    nota1 decimal,
    nota2 decimal,
    nota3 decimal,
    nota4 decimal,
    nota5 decimal,
    nota6 decimal,
    nota7 decimal,
    nota8 decimal,
    nota9 decimal,
    nota10 decimal,
    nota11 decimal,
    nota12 decimal,
    porcentaje1 decimal,
    porcentaje2 decimal,
    porcentaje3 decimal,
    porcentaje4 decimal,
    porcentaje5 decimal,
    porcentaje6 decimal,
    porcentaje7 decimal,
    porcentaje8 decimal,
    porcentaje9 decimal,
    porcentaje10 decimal,
    porcentaje11 decimal,
    porcentaje12 decimal,
    aspecto1 varchar,
    aspecto2 varchar,
    aspecto3 varchar,
    aspecto4 varchar,
    aspecto5 varchar,
    aspecto6 varchar,
    aspecto7 varchar,
    aspecto8 varchar,
    aspecto9 varchar,
    aspecto10 varchar,
    aspecto11 varchar,
    aspecto12 varchar,
    fecha1 date,
    fecha2 date,
    fecha3 date,
    fecha4 date,
    fecha5 date,
    fecha6 date,
    fecha7 date,
    fecha8 date,
    fecha9 date,
    fecha10 date,
    fecha11 date,
    fecha12 date,
    anotacion1 text,
    anotacion2 text,
    anotacion3 text,
    anotacion4 text,
    anotacion5 text,
    anotacion6 text,
    anotacion7 text,
    anotacion8 text,
    anotacion9 text,
    anotacion10 text,
    anotacion11 text,
    anotacion12 text,
    fechaa1 date,
    fechaa2 date,
    fechaa3 date,
    fechaa4 date,
    fechaa5 date,
    fechaa6 date,
    fechaa7 date,
    fechaa8 date,
    fechaa9 date,
    fechaa10 date,
    fechaa11 date,
    fechaa12 date,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    year int DEFAULT 2021
);

-- Table: notasttt
-- Columns: 81
CREATE TABLE notasttt (
    ind bigint NOT NULL,
    estudiante bigint,
    grado varchar NOT NULL,
    asignatura varchar,
    docente bigint,
    periodo varchar,
    valoracion decimal,
    nota1 decimal,
    nota2 decimal,
    nota3 decimal,
    nota4 decimal,
    nota5 decimal,
    nota6 decimal,
    nota7 decimal,
    nota8 decimal,
    nota9 decimal,
    nota10 decimal,
    nota11 decimal,
    nota12 decimal,
    porcentaje1 decimal,
    porcentaje2 decimal,
    porcentaje3 decimal,
    porcentaje4 decimal,
    porcentaje5 decimal,
    porcentaje6 decimal,
    porcentaje7 decimal,
    porcentaje8 decimal,
    porcentaje9 decimal,
    porcentaje10 decimal,
    porcentaje11 decimal,
    porcentaje12 decimal,
    aspecto1 varchar,
    aspecto2 varchar,
    aspecto3 varchar,
    aspecto4 varchar,
    aspecto5 varchar,
    aspecto6 varchar,
    aspecto7 varchar,
    aspecto8 varchar,
    aspecto9 varchar,
    aspecto10 varchar,
    aspecto11 varchar,
    aspecto12 varchar,
    fecha1 date,
    fecha2 date,
    fecha3 date,
    fecha4 date,
    fecha5 date,
    fecha6 date,
    fecha7 date,
    fecha8 date,
    fecha9 date,
    fecha10 date,
    fecha11 date,
    fecha12 date,
    anotacion1 text,
    anotacion2 text,
    anotacion3 text,
    anotacion4 text,
    anotacion5 text,
    anotacion6 text,
    anotacion7 text,
    anotacion8 text,
    anotacion9 text,
    anotacion10 text,
    anotacion11 text,
    anotacion12 text,
    fechaa1 date,
    fechaa2 date,
    fechaa3 date,
    fechaa4 date,
    fechaa5 date,
    fechaa6 date,
    fechaa7 date,
    fechaa8 date,
    fechaa9 date,
    fechaa10 date,
    fechaa11 date,
    fechaa12 date,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    year int DEFAULT 2021
);

-- Table: notas_backup
-- Columns: 80
CREATE TABLE notas_backup (
    ind bigint NOT NULL,
    estudiante bigint,
    grado varchar NOT NULL,
    asignatura varchar,
    docente varchar,
    periodo varchar,
    valoracion decimal,
    nota1 decimal,
    nota2 decimal,
    nota3 decimal,
    nota4 decimal,
    nota5 decimal,
    nota6 decimal,
    nota7 decimal,
    nota8 decimal,
    nota9 decimal,
    nota10 decimal,
    nota11 decimal,
    nota12 decimal,
    porcentaje1 decimal,
    porcentaje2 decimal,
    porcentaje3 decimal,
    porcentaje4 decimal,
    porcentaje5 decimal,
    porcentaje6 decimal,
    porcentaje7 decimal,
    porcentaje8 decimal,
    porcentaje9 decimal,
    porcentaje10 decimal,
    porcentaje11 decimal,
    porcentaje12 decimal,
    aspecto1 varchar,
    aspecto2 varchar,
    aspecto3 varchar,
    aspecto4 varchar,
    aspecto5 varchar,
    aspecto6 varchar,
    aspecto7 varchar,
    aspecto8 varchar,
    aspecto9 varchar,
    aspecto10 varchar,
    aspecto11 varchar,
    aspecto12 varchar,
    fecha1 date,
    fecha2 date,
    fecha3 date,
    fecha4 date,
    fecha5 date,
    fecha6 date,
    fecha7 date,
    fecha8 date,
    fecha9 date,
    fecha10 date,
    fecha11 date,
    fecha12 date,
    anotacion1 text,
    anotacion2 text,
    anotacion3 text,
    anotacion4 text,
    anotacion5 text,
    anotacion6 text,
    anotacion7 text,
    anotacion8 text,
    anotacion9 text,
    anotacion10 text,
    anotacion11 text,
    anotacion12 text,
    fechaa1 date,
    fechaa2 date,
    fechaa3 date,
    fechaa4 date,
    fechaa5 date,
    fechaa6 date,
    fechaa7 date,
    fechaa8 date,
    fechaa9 date,
    fechaa10 date,
    fechaa11 date,
    fechaa12 date,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: notas_backup2
-- Columns: 80
CREATE TABLE notas_backup2 (
    ind bigint NOT NULL DEFAULT 0,
    estudiante bigint,
    grado varchar NOT NULL,
    asignatura varchar,
    docente varchar,
    periodo varchar,
    valoracion decimal,
    nota1 decimal,
    nota2 decimal,
    nota3 decimal,
    nota4 decimal,
    nota5 decimal,
    nota6 decimal,
    nota7 decimal,
    nota8 decimal,
    nota9 decimal,
    nota10 decimal,
    nota11 decimal,
    nota12 decimal,
    porcentaje1 decimal,
    porcentaje2 decimal,
    porcentaje3 decimal,
    porcentaje4 decimal,
    porcentaje5 decimal,
    porcentaje6 decimal,
    porcentaje7 decimal,
    porcentaje8 decimal,
    porcentaje9 decimal,
    porcentaje10 decimal,
    porcentaje11 decimal,
    porcentaje12 decimal,
    aspecto1 varchar,
    aspecto2 varchar,
    aspecto3 varchar,
    aspecto4 varchar,
    aspecto5 varchar,
    aspecto6 varchar,
    aspecto7 varchar,
    aspecto8 varchar,
    aspecto9 varchar,
    aspecto10 varchar,
    aspecto11 varchar,
    aspecto12 varchar,
    fecha1 date,
    fecha2 date,
    fecha3 date,
    fecha4 date,
    fecha5 date,
    fecha6 date,
    fecha7 date,
    fecha8 date,
    fecha9 date,
    fecha10 date,
    fecha11 date,
    fecha12 date,
    anotacion1 text,
    anotacion2 text,
    anotacion3 text,
    anotacion4 text,
    anotacion5 text,
    anotacion6 text,
    anotacion7 text,
    anotacion8 text,
    anotacion9 text,
    anotacion10 text,
    anotacion11 text,
    anotacion12 text,
    fechaa1 date,
    fechaa2 date,
    fechaa3 date,
    fechaa4 date,
    fechaa5 date,
    fechaa6 date,
    fechaa7 date,
    fechaa8 date,
    fechaa9 date,
    fechaa10 date,
    fechaa11 date,
    fechaa12 date,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: notas_historico
-- Columns: 10
CREATE TABLE notas_historico (
    id int NOT NULL,
    fecha date NOT NULL,
    docente varchar NOT NULL,
    asignatura varchar NOT NULL,
    grado varchar NOT NULL,
    year int NOT NULL,
    actualizado timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tiempo varchar NOT NULL,
    hora varchar NOT NULL,
    minuto varchar NOT NULL
);

-- Table: notas_historico_docente
-- Columns: 81
CREATE TABLE notas_historico_docente (
    ind bigint NOT NULL DEFAULT 0,
    estudiante bigint,
    grado varchar NOT NULL,
    asignatura varchar,
    docente varchar,
    periodo varchar,
    valoracion decimal,
    nota1 decimal,
    nota2 decimal,
    nota3 decimal,
    nota4 decimal,
    nota5 decimal,
    nota6 decimal,
    nota7 decimal,
    nota8 decimal,
    nota9 decimal,
    nota10 decimal,
    nota11 decimal,
    nota12 decimal,
    porcentaje1 decimal,
    porcentaje2 decimal,
    porcentaje3 decimal,
    porcentaje4 decimal,
    porcentaje5 decimal,
    porcentaje6 decimal,
    porcentaje7 decimal,
    porcentaje8 decimal,
    porcentaje9 decimal,
    porcentaje10 decimal,
    porcentaje11 decimal,
    porcentaje12 decimal,
    aspecto1 varchar,
    aspecto2 varchar,
    aspecto3 varchar,
    aspecto4 varchar,
    aspecto5 varchar,
    aspecto6 varchar,
    aspecto7 varchar,
    aspecto8 varchar,
    aspecto9 varchar,
    aspecto10 varchar,
    aspecto11 varchar,
    aspecto12 varchar,
    fecha1 date,
    fecha2 date,
    fecha3 date,
    fecha4 date,
    fecha5 date,
    fecha6 date,
    fecha7 date,
    fecha8 date,
    fecha9 date,
    fecha10 date,
    fecha11 date,
    fecha12 date,
    anotacion1 text,
    anotacion2 text,
    anotacion3 text,
    anotacion4 text,
    anotacion5 text,
    anotacion6 text,
    anotacion7 text,
    anotacion8 text,
    anotacion9 text,
    anotacion10 text,
    anotacion11 text,
    anotacion12 text,
    fechaa1 date,
    fechaa2 date,
    fechaa3 date,
    fechaa4 date,
    fechaa5 date,
    fechaa6 date,
    fechaa7 date,
    fechaa8 date,
    fechaa9 date,
    fechaa10 date,
    fechaa11 date,
    fechaa12 date,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    year int DEFAULT 2021
);

-- Table: notificaciones
-- Columns: 5
CREATE TABLE notificaciones (
    ind bigint NOT NULL,
    bodyNotification text NOT NULL,
    textNotification varchar NOT NULL,
    fecha date NOT NULL,
    hora time NOT NULL
);

-- Table: notificacionesLeidas
-- Columns: 4
CREATE TABLE notificacionesLeidas (
    ind bigint NOT NULL,
    notifyind bigint NOT NULL,
    docente bigint NOT NULL,
    leida varchar NOT NULL DEFAULT S
);

-- Table: orden_asignaturas
-- Columns: 5
CREATE TABLE orden_asignaturas (
    ind bigint NOT NULL,
    asignatura varchar,
    materia varchar NOT NULL,
    abreviatura varchar NOT NULL,
    orden double NOT NULL
);

-- Table: pacientes
-- Columns: 36
CREATE TABLE pacientes (
    ind bigint NOT NULL,
    fecha date,
    hora time,
    tdei varchar,
    identificacion varchar,
    identificacion2 bigint,
    historia varchar,
    nombre1 varchar,
    nombre2 varchar,
    apellido1 varchar,
    apellido2 varchar,
    nombres varchar,
    sexo varchar,
    fecnac date,
    edad varchar,
    lugarnacimiento varchar,
    direccion_residencia varchar,
    ciudad_residencia varchar,
    barrio varchar,
    telefono_residencia1 varchar,
    telefono_residencia2 varchar,
    telefono_movil varchar,
    beeper varchar,
    codigo_beeper varchar,
    ocupacion varchar,
    estado_civil varchar,
    email1 varchar,
    email2 varchar,
    factuadatos date,
    otron char,
    otrop char,
    entidad varchar,
    tipo_de_usuario varchar,
    nivel_sisben varchar,
    ccontrib varchar,
    estado varchar
);

-- Table: parametros_informe
-- Columns: 6
CREATE TABLE parametros_informe (
    ind int NOT NULL,
    codigo_materia varchar,
    fila int,
    orden double,
    fila_certificado int,
    year int NOT NULL
);

-- Table: parametros_informe_primaria
-- Columns: 6
CREATE TABLE parametros_informe_primaria (
    ind bigint NOT NULL,
    codigo_materia varchar,
    fila int,
    orden int,
    fila_certificado int,
    year int NOT NULL
);

-- Table: parametros_informe_primaria_5
-- Columns: 6
CREATE TABLE parametros_informe_primaria_5 (
    ind bigint NOT NULL,
    codigo_materia varchar,
    fila int,
    orden int,
    fila_certificado int,
    year int NOT NULL
);

-- Table: perdidasfinales
-- Columns: 6
CREATE TABLE perdidasfinales (
    estudiante bigint,
    nombres varchar,
    grado varchar NOT NULL,
    sede varchar NOT NULL,
    area varchar,
    valoracionFinal double
);

-- Table: periodos
-- Columns: 4
CREATE TABLE periodos (
    ind int NOT NULL DEFAULT 0,
    nombre varchar NOT NULL,
    fechainicial date NOT NULL,
    fechafinal date NOT NULL
);

-- Table: permisos_docentes
-- Columns: 15
CREATE TABLE permisos_docentes (
    id int NOT NULL,
    nombre_solicitante varchar NOT NULL,
    cedula_solicitante varchar NOT NULL,
    cargo varchar NOT NULL,
    fecha_solicitud date NOT NULL,
    fecha_inicio_ausencia date NOT NULL,
    fecha_fin_ausencia date NOT NULL,
    dias_ausencia int NOT NULL,
    motivo text NOT NULL,
    firma_solicitante varchar NOT NULL,
    firma_coordinador varchar,
    firma_rectoria varchar,
    estado varchar DEFAULT pendiente,
    fecha_creacion timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: porcentajes_Area
-- Columns: 3
CREATE TABLE porcentajes_Area (
    area varchar,
    nivel int,
    sum(porcentaje) double
);

-- Table: porcentajes_area_colegio
-- Columns: 11
CREATE TABLE porcentajes_area_colegio (
    ind int NOT NULL,
    asignatura varchar,
    año int,
    area varchar,
    abreviatura varchar NOT NULL,
    porcentaje double,
    nivel int,
    fila int,
    fila_certificado int NOT NULL,
    orden double,
    year int NOT NULL
);

-- Table: porcentajes_area_colegio_5
-- Columns: 11
CREATE TABLE porcentajes_area_colegio_5 (
    ind int NOT NULL,
    asignatura varchar,
    año int,
    area varchar,
    abreviatura varchar NOT NULL,
    porcentaje double,
    nivel int,
    fila int,
    fila_certificado int NOT NULL,
    orden int,
    year int NOT NULL
);

-- Table: promover_estudiante
-- Columns: 81
CREATE TABLE promover_estudiante (
    ind bigint NOT NULL DEFAULT 0,
    estudiante bigint,
    grado varchar NOT NULL,
    asignatura varchar,
    docente varchar,
    periodo varchar,
    valoracion decimal,
    nota1 decimal,
    nota2 decimal,
    nota3 decimal,
    nota4 decimal,
    nota5 decimal,
    nota6 decimal,
    nota7 decimal,
    nota8 decimal,
    nota9 decimal,
    nota10 decimal,
    nota11 decimal,
    nota12 decimal,
    porcentaje1 decimal,
    porcentaje2 decimal,
    porcentaje3 decimal,
    porcentaje4 decimal,
    porcentaje5 decimal,
    porcentaje6 decimal,
    porcentaje7 decimal,
    porcentaje8 decimal,
    porcentaje9 decimal,
    porcentaje10 decimal,
    porcentaje11 decimal,
    porcentaje12 decimal,
    aspecto1 varchar,
    aspecto2 varchar,
    aspecto3 varchar,
    aspecto4 varchar,
    aspecto5 varchar,
    aspecto6 varchar,
    aspecto7 varchar,
    aspecto8 varchar,
    aspecto9 varchar,
    aspecto10 varchar,
    aspecto11 varchar,
    aspecto12 varchar,
    fecha1 date,
    fecha2 date,
    fecha3 date,
    fecha4 date,
    fecha5 date,
    fecha6 date,
    fecha7 date,
    fecha8 date,
    fecha9 date,
    fecha10 date,
    fecha11 date,
    fecha12 date,
    anotacion1 text,
    anotacion2 text,
    anotacion3 text,
    anotacion4 text,
    anotacion5 text,
    anotacion6 text,
    anotacion7 text,
    anotacion8 text,
    anotacion9 text,
    anotacion10 text,
    anotacion11 text,
    anotacion12 text,
    fechaa1 date,
    fechaa2 date,
    fechaa3 date,
    fechaa4 date,
    fechaa5 date,
    fechaa6 date,
    fechaa7 date,
    fechaa8 date,
    fechaa9 date,
    fechaa10 date,
    fechaa11 date,
    fechaa12 date,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    year int DEFAULT 2021
);

-- Table: prueba_estugrupos
-- Columns: 53
CREATE TABLE prueba_estugrupos (
    ind bigint NOT NULL,
    codigo bigint NOT NULL,
    estudiante bigint NOT NULL,
    nombres varchar,
    asignacion int,
    institucion_externa varchar NOT NULL,
    genero varchar NOT NULL,
    fecnac date NOT NULL,
    edad int NOT NULL,
    nivel int,
    grado varchar,
    numero int NOT NULL,
    anio int NOT NULL,
    pass varchar NOT NULL,
    activo varchar,
    banda varchar NOT NULL,
    HED varchar NOT NULL,
    idacudiente varchar NOT NULL,
    acudiente varchar NOT NULL,
    telefono1 varchar NOT NULL,
    telefono2 varchar NOT NULL,
    direccion varchar NOT NULL,
    email_estudiante varchar NOT NULL,
    email_acudiente varchar NOT NULL,
    desertor varchar NOT NULL DEFAULT N,
    otraInformacion varchar NOT NULL,
    estado varchar NOT NULL,
    year int NOT NULL,
    lugar varchar NOT NULL,
    sisben varchar NOT NULL,
    estrato varchar NOT NULL,
    lugarNacimiento varchar NOT NULL,
    lugarExpedicion varchar NOT NULL,
    fechaExpedicion varchar NOT NULL,
    tdei varchar NOT NULL,
    victimaConflicto varchar NOT NULL,
    lugarDesplazamiento varchar NOT NULL,
    fechaDesplazamiento varchar NOT NULL,
    etnia varchar NOT NULL,
    tipoSangre varchar NOT NULL,
    eps varchar NOT NULL,
    padre varchar NOT NULL,
    padreid varchar NOT NULL,
    telefonopadre varchar NOT NULL,
    ocupacionpadre varchar NOT NULL,
    madre varchar NOT NULL,
    madreid varchar NOT NULL,
    telefonomadre varchar NOT NULL,
    ocupacionmadre varchar NOT NULL,
    parentesco varchar NOT NULL,
    discapacidad varchar NOT NULL,
    telefono_acudiente varchar NOT NULL,
    eanterior varchar NOT NULL
);

-- Table: puestos
-- Columns: 5
CREATE TABLE puestos (
    estudiante bigint,
    nombres varchar,
    promedio decimal,
    grupo varchar,
    asignacion int
);

-- Table: puestosGrupo
-- Columns: 5
CREATE TABLE puestosGrupo (
    estudiante bigint,
    nombres varchar,
    promedio decimal,
    grupo varchar,
    asignacion int
);

-- Table: reclamo
-- Columns: 9
CREATE TABLE reclamo (
    ind bigint NOT NULL,
    estudiante varchar NOT NULL,
    profesor varchar NOT NULL,
    asignatura varchar NOT NULL,
    fecha date NOT NULL,
    aspecto text NOT NULL,
    nota double NOT NULL,
    observacion text NOT NULL,
    fecharegistro timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: registrados
-- Columns: 4
CREATE TABLE registrados (
    identificacion varchar NOT NULL,
    nombres varchar NOT NULL,
    photoURL text NOT NULL,
    registerat timestamp NOT NULL DEFAULT 0000-00-00 00:00:00
);

-- Table: registrar
-- Columns: 12
CREATE TABLE registrar (
    ind bigint NOT NULL,
    identificacion varchar NOT NULL,
    nombres varchar NOT NULL,
    email varchar NOT NULL,
    displayName varchar NOT NULL,
    fechanacimiento date NOT NULL,
    phoneNumber varchar NOT NULL,
    photoURL text NOT NULL,
    genero varchar NOT NULL,
    direccion varchar NOT NULL,
    registerat timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    google varchar NOT NULL
);

-- Table: registroIngresos
-- Columns: 9
CREATE TABLE registroIngresos (
    id bigint NOT NULL,
    fecha date NOT NULL,
    hora time NOT NULL,
    horaSalida time NOT NULL,
    nombres varchar NOT NULL,
    asunto varchar NOT NULL,
    identificacion int NOT NULL,
    tipo_visitante varchar NOT NULL,
    fecharegistro timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: restricciones
-- Columns: 4
CREATE TABLE restricciones (
    ind int NOT NULL,
    docente varchar NOT NULL,
    dia varchar NOT NULL,
    hora varchar NOT NULL
);

-- Table: sedes
-- Columns: 2
CREATE TABLE sedes (
    ind int NOT NULL,
    sede varchar NOT NULL
);

-- Table: seguridad
-- Columns: 5
CREATE TABLE seguridad (
    ind bigint NOT NULL,
    docente bigint NOT NULL,
    asignatura varchar NOT NULL,
    info json NOT NULL,
    fechahora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table: sumaporcentajes
-- Columns: 4
CREATE TABLE sumaporcentajes (
    estudiante bigint,
    asignatura varchar,
    grado varchar NOT NULL,
    porcentaje decimal
);

-- Table: tdei
-- Columns: 3
CREATE TABLE tdei (
    ind int NOT NULL,
    nombre varchar,
    abreviatura varchar
);

-- Table: tiempoDocentes
-- Columns: 10
CREATE TABLE tiempoDocentes (
    docente varchar NOT NULL,
    grado varchar NOT NULL,
    fecha date NOT NULL DEFAULT 0000-00-00,
    cantidad bigint NOT NULL DEFAULT 0,
    year(fecha) bigint,
    month(fecha) bigint,
    day(fecha) bigint,
    tt bigint,
    mf bigint,
    MIN varchar NOT NULL
);

-- Table: tiemposVista
-- Columns: 3
CREATE TABLE tiemposVista (
    docente varchar NOT NULL,
    horas decimal,
    minutos decimal
);

-- Table: ultimasNotas
-- Columns: 5
CREATE TABLE ultimasNotas (
    asignatura varchar,
    docente varchar,
    grado varchar NOT NULL,
    periodo varchar,
    fechahora timestamp NOT NULL DEFAULT 0000-00-00 00:00:00
);

-- Table: vistanotasif
-- Columns: 8
CREATE TABLE vistanotasif (
    fecha date NOT NULL DEFAULT 0000-00-00,
    docente varchar NOT NULL,
    asignatura varchar NOT NULL,
    grado varchar NOT NULL,
    min(n.fecha) date,
    tiempo varchar NOT NULL,
    hora varchar NOT NULL,
    minuto varchar NOT NULL
);

