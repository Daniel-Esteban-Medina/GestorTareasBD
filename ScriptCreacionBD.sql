-- Tabla principal
CREATE DATABASE GestorTareas;
USE GestorTareas;

-- Tabla principal
CREATE TABLE EQUIPOS (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL UNIQUE,  -- UNIQUE para que no se repitan los nombres
    Descripcion TEXT
);

-- Tabla principal
CREATE TABLE PERSONAS (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    Correo_electronico VARCHAR(255)
);

-- Tabla principal
CREATE TABLE TAREAS (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(50) NOT NULL,
    Descripcion TEXT,
    Prioridad ENUM('ALTA', 'MEDIA', 'BAJA') NOT NULL,
    Estado ENUM('PENDIENTE', 'EN PROGRESO', 'COMPLETADA') NOT NULL,
    Fecha_inicio DATETIME,
    Fecha_vencimiento DATETIME,
    URL VARCHAR(2048) NULL -- La URL puede ser NULL
);

-- Tabla intermedia
CREATE TABLE PERSONAS_EQUIPOS (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Cod_persona INT,
    Cod_equipo INT,
    FOREIGN KEY (Cod_persona) REFERENCES PERSONAS(Codigo) ON DELETE CASCADE,
    FOREIGN KEY (Cod_equipo) REFERENCES EQUIPOS(Codigo) ON DELETE CASCADE
);

-- Tabla intermedia
CREATE TABLE EQUIPOS_TAREAS (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Cod_tarea INT,
    Cod_equipo INT,
    FOREIGN KEY (Cod_tarea) REFERENCES TAREAS(Codigo) ON DELETE CASCADE,
    FOREIGN KEY (Cod_equipo) REFERENCES EQUIPOS(Codigo) ON DELETE CASCADE
);
