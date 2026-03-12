# Companion for Virus!

[![Flutter](https://img.shields.io/badge/Flutter-3.41.4-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.11.1-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-TBD-lightgrey)]()

App complementaria para el juego de cartas *Virus!*. Consulta cartas, reglas y FAQ, y usa herramientas interactivas durante las partidas: temporizador de turno, seguimiento de partida y aleatorizador de configuración.

> **Disclaimer**: Este proyecto no es oficial. No está afiliado con Tranjis Games.

## Funcionalidades

- **Cartas oficiales** — Catálogo de cartas del juego base y expansiones con filtros por tipo, color y expansión.
- **Reglas** — Reglas oficiales por expansión + variantes de la comunidad.
- **FAQ** — Preguntas frecuentes con respuestas desplegables.
- **Temporizador de turno** — Cuenta atrás configurable con alerta sonora y visual.
- **Seguimiento de partida** — Estado de cada jugador: órganos, infecciones, vacunas.
- **Aleatorizador** — Generador de configuraciones de partida aleatorias.
- **Tema claro/oscuro** — Con opción automática según el sistema.

## Requisitos previos

- [Flutter](https://docs.flutter.dev/get-started/install) 3.41.4 o superior
- Dart 3.11.1 o superior (incluido con Flutter)

## Instalación y ejecución

```bash
# Clonar el repositorio
git clone https://github.com/isdabenx/companion_for_virus.git
cd companion_for_virus

# Instalar dependencias
flutter pub get

# Generar código (Riverpod)
dart run build_runner build --delete-conflicting-outputs

# Ejecutar la app
flutter run
```

### Generación de código en modo watch (desarrollo)

```bash
dart run build_runner watch --delete-conflicting-outputs
```

## Estructura del proyecto

```
lib/
  config/          # Tema, router
  core/            # Providers globales, constantes
  features/
    home/          # Pantalla principal
    cards/         # Catálogo de cartas
    rules/         # Reglas por expansión
    faq/           # Preguntas frecuentes
    timer/         # Temporizador de turno
    game_tracker/  # Seguimiento de partida
    randomizer/    # Aleatorizador
    settings/      # Configuración
    splash/        # Pantalla de carga
  shared/          # Widgets reutilizables
  main.dart
```

## Stack técnico

| Categoría | Tecnología |
|---|---|
| Framework | Flutter / Dart |
| Estado | Riverpod 3.x + anotaciones + `build_runner` |
| Navegación | `go_router` 17.x |
| Markdown | `flutter_markdown_plus` |
| Persistencia | `shared_preferences` |
| Enlaces | `url_launcher` |

Para decisiones técnicas detalladas, consulta [DESIGN.md](DESIGN.md).

## Contribuir

1. Haz un fork del repositorio.
2. Crea una rama para tu funcionalidad (`git checkout -b feature/nueva-funcionalidad`).
3. Asegúrate de que el código compila y pasa los linters (`flutter analyze`).
4. Abre una Pull Request describiendo los cambios.

## Documentación

- [DESIGN.md](DESIGN.md) — Documento de diseño completo.
- [TASKS.md](TASKS.md) — Checklist de desarrollo.

## Licencia

Por definir.
