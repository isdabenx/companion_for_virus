# [Project Checklist] Companion for Virus

Aquest document agrupa les tasques per mòduls lògics i dependències tècniques per al desenvolupament de "Companion for Virus!".

**Referència:** Consulta el `Document del Projecte` per a més detalls sobre cada funcionalitat.

---

## 🚀 Setup & Core Infrastructure (Fonaments)

* [ ] Crear projecte Flutter, configurar Git i repositori GitHub.
* [x] Definir l'estructura de carpetes del projecte.
* [ ] Afegir dependències essencials (`pubspec.yaml`):
  * [ ] `flutter_riverpod` + `riverpod_annotation` + `riverpod_generator`
  * [ ] `freezed` + `freezed_annotation`
  * [ ] `go_router`
  * [ ] `easy_localization`
  * [ ] `shared_preferences`
  * [ ] `url_launcher`
  * [ ] `markdown_widget`
  * [ ] `build_runner`
* [ ] Configurar `build_runner` per a generació de codi (`freezed`, `riverpod`).
* [ ] Configurar `easy_localization` (carpeta `assets/translations`, fitxers `ca.json`, `es.json`, `en.json` bàsics).
* [ ] Definir paleta de colors i `ThemeData` base per a tema Clar i Fosc.
* [ ] Configurar `go_router`: definir rutes principals (`/`, `/home`, `/official-cards`, `/fan-cards`, `/rules`, `/faq`, `/settings`, etc.).
* [ ] Implementar l'arrel de l'App (`MaterialApp.router`) connectant Core Services (Router, Localization, Theme).

## 💧 Feature: Splash Screen (`/`) (Càrrega Inicial)

* [ ] Crear la pantalla/widget per al Splash Screen (UI simple: logo/nom, indicador).
* [ ] Implementar la lògica de càrrega inicial (preferències d'usuari des de `shared_preferences`).
* [ ] Aplicar l'idioma i tema carregats.
* [ ] Implementar la navegació a `/home` quan la càrrega finalitzi.

## 뼈 UI Shell & Navegació Bàsica (Estructura Visual Post-Splash)

* [ ] Crear Scaffolds bàsics (placeholders) per a les pantalles principals (Home, Oficials, Fans, Regles, FAQ, Settings) per verificar la configuració de `go_router`.
* [ ] Implementar un Scaffold principal reutilitzable o una estructura base comuna.
* [ ] Implementar AppBar global/reutilitzable amb títol dinàmic i icona ⚙️ per a Configuració (la navegació a `/settings` ha de funcionar).

## 🏠 Feature: Pantalla Home (`/home`) (Punt d'Entrada Principal)

* [ ] Implementar layout per defecte en graella 2x2.
* [ ] Crear widget reutilitzable `SectionButton` (icona, text, color).
* [ ] Assignar colors correctes als botons de secció.
* [ ] Integrar els `SectionButton` al layout de Home.
* [ ] Implementar la navegació des dels botons a les rutes corresponents.
* [ ] Afegir botó a l'AppBar per canviar vista Graella/Llista.
* [ ] Implementar la vista alternativa en Llista vertical.
* [ ] Implementar Provider (`Riverpod`) per gestionar l'estat de la vista (graella/llista).

## 🃏 Feature: Visualització de Cartes (Oficials) (Funcionalitat Core)

* **Models i Dades:**
  * [ ] Definir model `OfficialCard` amb `freezed`.
  * [ ] Preparar font de dades (p.ex., JSON a `assets`).
  * [ ] Implementar Provider (`Riverpod`) per carregar/gestionar dades (amb estats càrrega/error).
* **UI Llista/Graella (`/official-cards`):**
  * [ ] Crear widget `CardPreview` (imatge petita, nom curt).
  * [ ] Implementar pantalla de llista/graella utilitzant `CardPreview`.
  * [ ] Implementar UI dels filtres tipus "Chip" (Tipus, Color, Expansió).
  * [ ] Implementar lògica de filtratge connectada als Chips i al Provider.
  * [ ] Implementar indicadors de càrrega/missatges d'error bàsics.
* **UI Detall (`/official-cards/:id`):**
  * [ ] Implementar pantalla de Detall de Carta Oficial.
  * [ ] Implementar la navegació des de `CardPreview` a Detall passant l'ID.
  * [ ] Mostrar tots els detalls requerits de la carta (imatge gran, nom, descripció, interaccions).

## 🎨 Feature: Visualització de Cartes (Fans) (Extensió)

* **Models i Dades:**
  * [ ] Definir model `FanCard` amb `freezed` (inclou `author`).
  * [ ] Definir estratègia d'obtenció de dades (p.ex., JSON des d'URL GitHub).
  * [ ] Implementar Provider (`Riverpod`) per carregar/gestionar dades (amb estats càrrega/error).
* **UI Llista/Graella (`/fan-cards`):**
  * [ ] Implementar pantalla de llista/graella (reutilitzant/adaptant `CardPreview` per mostrar autor).
  * [ ] Implementar UI dels filtres tipus "Chip".
  * [ ] Implementar lògica de filtratge.
  * [ ] Implementar indicadors de càrrega/error.
* **UI Detall (`/fan-cards/:id`):**
  * [ ] Implementar pantalla de Detall de Carta Fan.
  * [ ] Implementar la navegació des de la llista a Detall.
  * [ ] Mostrar tots els detalls requerits (incloent autor).
* **Integració GitHub:**
  * [ ] Afegir botó/enllaç a la pantalla de llista.
  * [ ] Implementar funcionalitat per obrir Issues amb `url_launcher`.

## 📖 Feature: Regles (`/rules`) (Contingut Estàtic/Markdown)

* [ ] Implementar UI de la pantalla amb `TabBar` / `TabBarView`.
* [ ] Crear pestanyes per Joc Base i Expansions Oficials.
* [ ] Crear pestanya "Regles Comunitat".
* [ ] Preparar contingut de regles en arxius Markdown (`.md`).
* [ ] Integrar `markdown_widget` per mostrar el contingut `.md` a les pestanyes.
* [ ] Implementar layout d'acordió (`ExpansionPanelList`) per a regles de la comunitat.
* [ ] Estructurar/obtenir i mostrar dades de regles de la comunitat dins l'acordió.

## ❓ Feature: FAQ (`/faq`) (Contingut Dinàmic Simple)

* [ ] Implementar UI de la pantalla amb layout d'acordió.
* [ ] Definir/obtenir estructura de dades Pregunta/Resposta (p.ex., List\<Map> o JSON).
* [ ] Implementar la visualització desplegable P&R connectada a les dades.
* [ ] Afegir botó/enllaç per suggerir preguntes.
* [ ] Implementar funcionalitat per obrir Issues amb `url_launcher`.

## ⚙️ Feature: Configuració (`/settings`) (Funcionalitat Completa)

* [ ] Implementar UI de la pantalla de Configuració.
* **Idioma:**
  * [ ] Implementar UI per seleccionar idioma (Català, Castellà, Anglès).
  * [ ] Connectar UI amb `easy_localization` i `shared_preferences` (per guardar/carregar).
* **Tema:**
  * [ ] Implementar UI per seleccionar tema (Clar, Fosc, Automàtic).
  * [ ] Connectar UI amb Provider de `ThemeMode` i `shared_preferences` (per guardar/carregar).
* **Seccions Informatives:**
  * [ ] Implementar pantalla/diàleg "About" (mostrar nom, versió, dev, enllaç GitHub amb `url_launcher`).
  * [ ] Implementar pantalla/diàleg "Disclaimer" (mostrar avís legal).

## ✨ Tasques Transversals & Finalització (Polit i Qualitat)

* **Traduccions (`easy_localization`):**
  * [ ] Extreure TOTES les cadenes visibles per l'usuari als fitxers `.json` (progressivament).
  * [ ] Completar traduccions per a `ca`, `es`, `en`.
* **Integració GitHub (Templates):**
  * [ ] Crear plantilles (`ISSUE_TEMPLATE`) a `.github/` per a Propostes de Cartes Fan i FAQ.
* **Qualitat i Polit:**
  * [ ] Refinar gestió d'errors i indicadors de càrrega a tota l'app.
  * [ ] Realitzar proves funcionals completes en diferents dispositius/mides.
  * [ ] Revisar UI/UX (consistència, responsivitat bàsica, accessibilitat).
  * [ ] Verificar funcionament final de temes i idiomes.
  * [ ] Analitzar i optimitzar el rendiment si cal (ús de DevTools).
  * [ ] Netejar codi: eliminar codi mort/comentat, afegir comentaris clau, seguir guia d'estil Dart/Flutter.
  * [ ] Actualitzar el `README.md` principal del repositori.
