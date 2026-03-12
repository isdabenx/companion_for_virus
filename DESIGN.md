# Documento de diseño: *Companion for Virus!*

App complementaria para el juego de cartas *Virus!*. Ofrece consulta de reglas y cartas, además de herramientas interactivas para usar durante las partidas (temporizador de turno, contador de partida, aleatorizador de variantes).

> **Disclaimer**: Proyecto no oficial. No está afiliado con Tranjis Games.

## 1. Objetivos

- Servir como herramienta útil **durante** las partidas, no solo como referencia puntual.
- Ofrecer consulta rápida de cartas y reglas con filtros.
- Proporcionar herramientas interactivas: temporizador, seguimiento de partida, aleatorizador.
- Interfaz sencilla, intuitiva y con tema claro/oscuro.

## 2. Plataforma e idioma

- **Plataforma**: Android.
- **Idioma**: Castellano (único).

## 3. Pantallas principales

### 3.1. Home

- Punto de entrada con acceso a las secciones principales en una cuadrícula 2×3 (o disposición adaptable):

| Cartas | Reglas |
|:---:|:---:|
| FAQ | Temporizador |
| Partida | Aleatorizador |

- Cada botón tiene:
  - Color identificativo de la sección (ver paleta).
  - Icono representativo.
  - Texto corto con el nombre de la sección.
- Opción de cambiar entre vista cuadrícula y vista lista mediante un botón en la AppBar.
- Logo del juego visible en la parte superior.

### 3.2. Cartas oficiales

Catálogo de todas las cartas del juego base y expansiones.

- **Lista/cuadrícula** con filtros tipo chip:
  - Tipo (órgano, virus, medicamento, tratamiento).
  - Color (rojo, verde, azul, amarillo, multicolor).
  - Expansión (base, Virus! 2, Halloween, etc.).
- Cada carta muestra:
  - Imagen pequeña.
  - Nombre corto.
- **Detalle** al seleccionar:
  - Imagen grande.
  - Nombre completo.
  - Descripción de los efectos.
  - Interacciones con otras cartas.

### 3.3. Reglas

Reglas oficiales divididas por expansión.

- **Tabs**: una pestaña para el juego base y una por cada expansión.
- Contenido renderizado desde archivos Markdown.
- Pestaña adicional para variantes de la comunidad:
  - Formato acordeón (`ExpansionTile`) con cada variante desplegable.

### 3.4. FAQ

Preguntas frecuentes con respuestas desplegables.

- Formato acordeón (`ExpansionTile`).
- Cada pregunta se muestra como título que se expande para mostrar la respuesta.

### 3.5. Temporizador de turno

Herramienta para controlar el tiempo de turno durante la partida.

- Temporizador configurable (30s, 60s, 90s, 2min, personalizado).
- Botones de inicio, pausa, reinicio.
- Alerta sonora y visual al agotar el tiempo.
- Opción de modo cuenta atrás o cuenta progresiva.
- Pantalla diseñada para ser visible con el móvil apoyado en la mesa.

### 3.6. Seguimiento de partida

Herramienta para hacer seguimiento del estado de una partida en curso.

- Configuración inicial:
  - Número de jugadores (2-6).
  - Nombre de cada jugador (opcional).
  - Expansiones en juego.
- Estado de cada jugador:
  - Órganos colocados (corazón, cerebro, estómago, hueso) con estado (sano, infectado, vacunado, inmunizado).
- Indicador visual claro de quién va ganando (cuerpo más completo).
- Botón de reiniciar partida.

### 3.7. Aleatorizador

Herramienta para generar configuraciones aleatorias de partida.

- Selección aleatoria de:
  - Expansiones a incluir.
  - Variantes/reglas opcionales.
  - Número de jugadores (o dejarlo fijo).
- Botón "Generar partida" que muestra la configuración resultante.
- Opción de fijar parámetros (ej: "siempre incluir Virus! 2") y aleatorizar el resto.

## 4. Configuración

Accesible desde la AppBar en todas las pantallas mediante un icono de engranaje.

- **Tema**: Claro, oscuro, o automático según el sistema.
- **Temporizador**: Valor por defecto del temporizador de turno.
- **Acerca de**: Nombre, versión, desarrollador, enlace a GitHub.
- **Aviso legal**: Disclaimer de proyecto no oficial.

## 5. Paleta de colores

### Secciones del Home

| Sección | Color | Código |
|---|---|---|
| Cartas | Verde | `#036528` |
| Reglas | Amarillo/naranja | `#F39400` |
| FAQ | Rojo | `#BD0926` |
| Temporizador | Morado | `#6D3187` |
| Partida | Azul | `#2A4795` |
| Aleatorizador | Verde claro | `#89B03E` |

### Tema

| Elemento | Claro | Oscuro |
|---|---|---|
| Fondo | `#F7F7F7` | `#1A1A1A` |
| Superficie | `#FFFFFF` | `#2C2C2C` |
| Texto principal | `#242424` | `#F0F0F0` |
| AppBar fondo | `#E3D9E4` | `#3D2E3E` |
| AppBar texto | `#242424` | `#F0F0F0` |

## 6. Stack técnico

| Categoría | Tecnología | Justificación |
|---|---|---|
| Framework | Flutter / Dart | Multiplataforma, pero foco en Android |
| Estado | Riverpod 3.x + anotaciones + `build_runner` | State reactivo real (temporizador, partida) |
| Navegación | `go_router` 17.x | Navegación declarativa |
| Markdown | `flutter_markdown_plus` | Renderizar reglas en Markdown |
| Persistencia | `shared_preferences` | Preferencias (tema, config temporizador) |
| Enlaces | `url_launcher` | Abrir GitHub, enlaces externos |
| Audio | `audioplayers` (pendiente evaluar) | Alerta sonora del temporizador |

**Decisiones clave:**
- **Sin i18n**: Un solo idioma (castellano). Strings directas o constantes.
- **Sin `freezed`**: Clases puras de Dart 3.x (sealed classes, records, pattern matching).
- **Sin fan cards**: Eliminada la sección. Complejidad alta (flujo GitHub) sin valor real para el usuario final.
- **Datos estáticos en assets**: Cartas y reglas como JSON/Markdown en `assets/`. Sin backend.

## 7. Estructura del proyecto

```
lib/
  config/          # Tema, router
  core/            # Providers globales, constantes
  features/
    home/          # Pantalla principal
    cards/         # Catálogo de cartas (lista + detalle)
    rules/         # Reglas por expansión
    faq/           # Preguntas frecuentes
    timer/         # Temporizador de turno
    game_tracker/  # Seguimiento de partida
    randomizer/    # Aleatorizador de configuración
    settings/      # Configuración de la app
    splash/        # Pantalla de carga inicial
  shared/          # Widgets reutilizables
  main.dart
assets/
  data/            # JSON de cartas
  rules/           # Archivos Markdown de reglas
  images/          # Imágenes de cartas y logo
  fonts/           # Tipografías
```

## 8. Fases de desarrollo

### Fase 1: Infraestructura y limpieza
- Eliminar i18n (slang), limpiar dependencias.
- Configurar ThemeData (claro/oscuro) correctamente.
- Conectar strings como constantes.
- Actualizar Home para 6 secciones.

### Fase 2: Herramientas interactivas (valor diferencial)
- Temporizador de turno.
- Seguimiento de partida.
- Aleatorizador.

### Fase 3: Contenido (catálogo)
- Cartas oficiales (modelo, datos JSON, UI lista + detalle + filtros).
- Reglas (archivos Markdown por expansión, UI con tabs).
- FAQ (datos, UI acordeón).

### Fase 4: Pulido
- Tema claro/oscuro completo.
- Configuración funcional.
- About y disclaimer.
- Pruebas en dispositivo real.
- Iconos, splash screen real, preparar para Play Store (si se quiere).
