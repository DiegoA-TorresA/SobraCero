# 🌱 SobraCero — Monorepo

> **Marketplace de rescate de alimentos**: ventas con descuento de excedentes y donaciones automáticas para organizaciones sociales.

Este repositorio contiene tanto el **Backend** como el **Frontend** de la plataforma SobraCero, estructurado bajo una arquitectura de **Monorepo**.

---

## 📁 Estructura del Proyecto

```text
SobraCero/
├── sobracero-backend/        # API REST con Java 21, Spring Boot y PostgreSQL
├── sobracero-frontend/       # Aplicación Web SPA con Angular 22 y TypeScript
├── .github/                  # Configuración de GitHub (CODEOWNERS y plantillas de PR)
└── README.md                 # Documentación general del monorepo
```

---

## 👥 Equipo y Distribución de Responsabilidades (Gitflow)

El desarrollo del frontend y la plataforma sigue una estrategia colaborativa sin conflictos de merge:

| Desarrollador | Módulo Asignado | Carpeta de Trabajo | Rama de Feature |
|---|---|---|---|
| **Dev 1 (Líder)** | Estructura Base, Core, Auth, Layout, Backend | `sobracero-frontend/src/app/core/`, `layout/`, `auth/` | `main` y `develop` |
| **Dev 2** | Landing pública, Impacto público y 404 | `sobracero-frontend/src/app/features/landing/` | `feature/parte-2-landing` |
| **Dev 3** | Consumidor (Ofertas cercanas, Mapa, Pago y Reservas) | `sobracero-frontend/src/app/features/consumidor/` | `feature/parte-3-consumidor` |
| **Dev 4** | Comercio (Publicar oferta, Canje con código y Donaciones) | `sobracero-frontend/src/app/features/comercio/` | `feature/parte-4-comercio` |
| **Dev 5** | Organización social (Donaciones, Recojos y Ley 30498) | `sobracero-frontend/src/app/features/organizacion/` | `feature/parte-5-organizacion` |
| **Dev 6** | Administración e Impacto (Validaciones, Reportes CSV y Predicción) | `sobracero-frontend/src/app/features/admin/`, `impacto/` | `feature/parte-6-admin-impacto` |

---

## 🔄 Flujo de Trabajo para el Equipo

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/DiegoA-TorresA/SobraCero.git
   cd SobraCero
   ```
2. **Crear tu rama de trabajo desde `develop`:**
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feature/parte-N-...
   ```
3. **Pegar tu carpeta `src`:** Reemplaza únicamente tu subcarpeta en `sobracero-frontend/src/app/features/<tu-modulo>`.
4. **Hacer commit y push:**
   ```bash
   git add sobracero-frontend/src/app/features/<tu-modulo>
   git commit -m "feat(<modulo>): descripcion de tu entrega"
   git push -u origin feature/parte-N-...
   ```
5. **Abrir Pull Request:** Hacia la rama **`develop`**.

---

## 🚀 Cómo Ejecutar en Local

### 1. Backend (`sobracero-backend`)
* Requiere Java 21+ instalado.
* **Opción rápida (con PostgreSQL embebido y datos demo, sin configurar nada):**
  ```bash
  cd sobracero-backend
  ./mvnw test-compile "exec:java" "-Dexec.mainClass=pe.upc.sobracero.LocalEmbeddedApplication" "-Dexec.classpathScope=test"
  ```
* La API y la documentación Swagger estarán disponibles en:  
  `http://localhost:8080/swagger-ui/index.html`

### 2. Frontend (`sobracero-frontend`)
* Requiere Node.js 22 LTS o 24.
* **Ejecutar:**
  ```bash
  cd sobracero-frontend
  npm install
  npm start
  ```
* Se abrirá en el navegador en:  
  `http://localhost:4200`

---

## 🔑 Cuentas de Demostración

* **Consumidor:** `consumidor@demo.pe` | Clave: `Demo1234`
* **Comercio:** `comercio1@demo.pe` | Clave: `Demo1234`
* **Organización:** `ong1@demo.pe` | Clave: `Demo1234`
* **Administrador:** `admin@sobracero.pe` | Clave: `Admin1234`
