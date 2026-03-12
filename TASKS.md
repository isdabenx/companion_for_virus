# [Project Checklist] Companion for Virus!

Checklist de desarrollo alineado con `DESIGN.md`. Las tareas siguen el orden de las fases de desarrollo.

**Referencia:** Consulta [DESIGN.md](DESIGN.md) para detalles de cada funcionalidad.

---

## Fase 1: Infraestructura y limpieza

### Limpieza de dependencias
* [ ] Eliminar `slang`, `slang_flutter`, `slang_build_runner` de `pubspec.yaml`.
* [ ] Eliminar archivos generados de i18n (`lib/i18n/`).
* [ ] Eliminar archivos JSON de traducciones (`assets/i18n/`).
* [ ] Eliminar referencia a `assets/i18n/` en `pubspec.yaml` (sección flutter > assets).
* [ ] Verificar que `flutter pub get` y `build_runner build` funcionan correctamente.

### Tema (claro/oscuro)
* [ ] Definir `ThemeData` light y dark con la paleta de colores del DESIGN.md.
* [ ] Crear provider Riverpod para `ThemeMode` (claro/oscuro/sistema) con persistencia en `SharedPreferences`.
* [ ] Conectar `ThemeData` y `ThemeMode` al `MaterialApp.router` en `main.dart`.
* [ ] Eliminar colores hardcoded de widgets existentes — usar `Theme.of(context)` en su lugar.

### Strings y constantes
* [ ] Crear archivo de constantes de strings (`lib/core/strings.dart` o similar).
* [ ] Reemplazar todas las strings hardcoded en widgets por constantes.

### Actualizar Home (6 secciones)
* [ ] Actualizar `HomeScreen` de 4 a 6 botones (añadir Temporizador, Partida, Aleatorizador).
* [ ] Ajustar `GridView` para cuadrícula 2×3 o layout adaptable.
* [ ] Actualizar colores y iconos según nueva paleta.
* [ ] Añadir rutas nuevas a `app_routes.dart` y `app_router.dart`.
* [ ] Eliminar ruta de fan cards.

### Navegación
* [ ] Limpiar rutas de fan cards del router.
* [ ] Añadir rutas: `/timer`, `/game-tracker`, `/randomizer`.
* [ ] Crear scaffolds placeholder para las nuevas pantallas.
* [ ] Verificar que toda la navegación funciona (ida y vuelta).

---

## Fase 2: Herramientas interactivas

### Temporizador de turno (`/timer`)
* [ ] Diseñar UI: display grande del tiempo, botones inicio/pausa/reinicio.
* [ ] Implementar lógica del temporizador (cuenta atrás).
* [ ] Implementar selector de duración (30s, 60s, 90s, 2min, personalizado).
* [ ] Implementar modo cuenta progresiva (opcional).
* [ ] Implementar alerta visual al agotar tiempo (cambio de color, animación).
* [ ] Evaluar e integrar `audioplayers` para alerta sonora.
* [ ] Persistir duración por defecto en `SharedPreferences`.
* [ ] Asegurar que la pantalla se mantiene encendida durante el temporizador.

### Seguimiento de partida (`/game-tracker`)
* [ ] Diseñar UI: configuración inicial (nº jugadores, nombres, expansiones).
* [ ] Diseñar UI: estado de cada jugador (órganos con estado visual).
* [ ] Definir modelo de datos para estado de partida (jugador, órgano, estado).
* [ ] Implementar provider Riverpod para gestión del estado de partida.
* [ ] Implementar pantalla de configuración de partida.
* [ ] Implementar pantalla de seguimiento con estado de cada jugador.
* [ ] Implementar cambio de estado de órganos (tap para ciclar: vacío → sano → infectado → vacunado → inmunizado).
* [ ] Implementar indicador visual de quién va ganando.
* [ ] Implementar botón de reiniciar partida (con confirmación).

### Aleatorizador (`/randomizer`)
* [ ] Diseñar UI: selectores de parámetros fijos + botón generar.
* [ ] Definir datos de expansiones y variantes disponibles.
* [ ] Implementar lógica de aleatorización.
* [ ] Implementar UI de resultado (configuración generada).
* [ ] Implementar opción de fijar parámetros y aleatorizar el resto.

---

## Fase 3: Contenido (catálogo)

### Cartas oficiales (`/official-cards`)
* [ ] Definir modelo de datos `OfficialCard` (clase Dart pura).
* [ ] Preparar datos JSON en `assets/data/` con todas las cartas del juego base.
* [ ] Implementar provider Riverpod para cargar y filtrar cartas.
* [ ] Crear widget `CardPreview` (imagen pequeña + nombre).
* [ ] Implementar pantalla de lista/cuadrícula con `CardPreview`.
* [ ] Implementar filtros tipo chip (tipo, color, expansión).
* [ ] Implementar lógica de filtrado conectada a los chips.
* [ ] Implementar pantalla de detalle de carta (`/official-cards/:id`).
* [ ] Implementar navegación de lista a detalle.
* [ ] Obtener/preparar imágenes de las cartas.

### Reglas (`/rules`)
* [ ] Preparar archivos Markdown de reglas en `assets/rules/` (uno por expansión).
* [ ] Implementar UI con `TabBar`/`TabBarView` (una pestaña por expansión).
* [ ] Integrar `flutter_markdown_plus` para renderizar contenido.
* [ ] Implementar pestaña de variantes de la comunidad con `ExpansionTile`.

### FAQ (`/faq`)
* [ ] Definir estructura de datos pregunta/respuesta (JSON o lista en código).
* [ ] Implementar UI con `ExpansionTile` para preguntas desplegables.
* [ ] Preparar contenido de preguntas frecuentes.

---

## Fase 4: Pulido y configuración

### Configuración (`/settings`)
* [ ] Implementar UI de la pantalla de configuración.
* [ ] Implementar selector de tema (claro/oscuro/sistema) conectado al provider.
* [ ] Implementar config de temporizador por defecto.
* [ ] Implementar pantalla/diálogo "Acerca de" (nombre, versión, dev, enlace GitHub).
* [ ] Implementar pantalla/diálogo "Aviso legal" (disclaimer).

### Splash Screen
* [ ] Diseñar splash screen real (logo, nombre, branding).
* [ ] Implementar carga de preferencias durante el splash.
* [ ] Aplicar tema cargado antes de mostrar Home.

### Calidad
* [ ] Revisar UI/UX en dispositivo real (consistencia, responsividad).
* [ ] Verificar que tema claro/oscuro funciona en todas las pantallas.
* [ ] Limpiar código: eliminar código muerto, comentarios obsoletos.
* [ ] Ejecutar `flutter analyze` — cero warnings.
* [ ] Actualizar `README.md`.
* [ ] Preparar icono de la app.
* [ ] (Opcional) Preparar para publicación en Play Store.
