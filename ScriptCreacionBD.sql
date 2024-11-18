-- Crear la base de datos
CREATE DATABASE GestorTareas;
USE GestorTareas;

-- Crear tabla EQUIPOS
CREATE TABLE EQUIPOS (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion TEXT
);

-- Crear tabla PERSONAS
CREATE TABLE PERSONAS (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    Correo_electronico VARCHAR(255)
);

-- Crear tabla TAREAS
CREATE TABLE TAREAS (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(50) NOT NULL,
    Descripcion TEXT,
    Prioridad ENUM('ALTA', 'MEDIA', 'BAJA') NOT NULL,
    Estado ENUM('PENDIENTE', 'EN PROGRESO', 'COMPLETADA') NOT NULL,
    Fecha_inicio DATETIME,
    Fecha_vencimiento DATETIME,
    URL VARCHAR(2048) NULL
);

-- Crear tabla PERSONAS_EQUIPOS (relación muchos a muchos entre PERSONAS y EQUIPOS)
CREATE TABLE PERSONAS_EQUIPOS (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Cod_persona INT,
    Cod_equipo INT,
    FOREIGN KEY (Cod_persona) REFERENCES PERSONAS(Codigo) ON DELETE CASCADE,
    FOREIGN KEY (Cod_equipo) REFERENCES EQUIPOS(Codigo) ON DELETE CASCADE
);

-- Crear tabla EQUIPOS_TAREAS (relación muchos a muchos entre EQUIPOS y TAREAS)
CREATE TABLE EQUIPOS_TAREAS (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Cod_tarea INT,
    Cod_equipo INT,
    FOREIGN KEY (Cod_tarea) REFERENCES TAREAS(Codigo) ON DELETE CASCADE,
    FOREIGN KEY (Cod_equipo) REFERENCES EQUIPOS(Codigo) ON DELETE CASCADE
);