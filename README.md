# Document de disseny i estructura del projecte: *Companion for Virus\!*

## Aquest document descriu l'estructura, funcionalitats i disseny de l'app d'ajuda per al joc *Virus\!*, desenvolupada amb Flutter. L'app està pensada com un complement per als jugadors, oferint regles, informació sobre cartes oficials i de la comunitat, i una secció de preguntes freqüents

## **1\. Objectius del projecte**

- Crear una app que serveixi com a assistent per al joc *Virus\!*.
- Oferir informació clara i organitzada sobre les regles oficials i no oficials.
- Permetre consultar cartes oficials i fan-made (creades per la comunitat).
- Resoldre dubtes comuns amb una secció de FAQ.
- Proporcionar una interfície intuïtiva i personalitzable (idioma, tema clar/fosc).

## **2\. Estructura general**

### **Pantalles principals**

1. **Home**: Pantalla inicial amb accés a les quatre seccions principals.
2. **Cartes oficials**: Llista de totes les cartes oficials del joc base i expansions.
3. **Cartes de fans**: Llista de cartes creades per la comunitat amb informació sobre els autors.
4. **Regles**: Regles oficials dividides per expansió i regles no oficials creades pels fans.
5. **FAQ**: Preguntes freqüents amb respostes desplegables.

### **Configuració**

- Accessible des de l'AppBar a totes les pantalles.
- Opcions:
  - Idioma (català, castellà, anglès).
  - Tema (clar/fosc).
  - About (informació sobre l'app).
  - Disclaimer (avís legal).

## **3\. Funcionalitats detallades**

### **3.1. Home**

- Disposició en graella 2x2:

| Cartes oficials | Cartes de fans |
| :---: | :---: |
| Regles | FAQ  |

- Cada botó té:

  - Un color diferent per identificar la secció (veure paleta més avall).
  - Una icona representativa.
  - Text curt amb el nom de la secció.

- Opció de canviar entre vista en graella i vista en llista mitjançant un botó a l'AppBar:

  - Vista en graella: Mostra els botons en format quadrícula.
  - Vista en llista: Mostra els botons en format vertical amb icones i text més grans.

### **3.2. Cartes oficials**

- Llista en format graella amb filtres tipus xips:
  - Filtres disponibles:
    - Tipus (òrgans, virus, medicaments, tractaments).
    - Color (vermell, verd, blau...).
    - Expansió (base, Virus\! 2, Halloween...).
- Cada carta mostra:
  - Imatge petita.
  - Nom curt.
- Detall de la carta quan es selecciona:
  - Imatge gran.
  - Nom complet.
  - Descripció dels efectes.
  - Interaccions amb altres cartes.

### **3.3. Cartes de fans**

#### Flux de gestió

1. Les cartes fan-made es gestionen mitjançant issues al repositori GitHub:
   - Els usuaris obren un issue amb tota la informació requerida sobre la carta (nom, imatge, descripció...).
   - Aquest issue genera automàticament una *pull request* que serà revisada pel mantenidor del projecte.
   - Si s'aprova, es fa un *merge* al repositori principal i la carta s'inclou a l'app.

#### Funcionalitats dins l'app

- Llista en format graella similar a les cartes oficials, però amb informació addicional:
  - Autor visible a sota del nom curt.
- Filtres tipus xips igual que les oficials.
- Detall de la carta quan es selecciona:
  - Imatge gran.
  - Nom complet.
  - Autor.
  - Descripció dels efectes i regles associades.
- Botó o enllaç directe al repositori GitHub perquè els usuaris puguin proposar noves cartes.

### **3.4. Regles**

- Dividides en pestanyes (*tabs*):
  - Una pestanya per al joc base i una per a cada expansió (*Virus\!*, *Virus\! Halloween*, etc.).
    - Cada pestanya conté les regles específiques d'aquella expansió.
  - Pestanya separada per a variants creades per la comunitat:
    - Llistat expandible (*accordion*) on cada regla es pot desplegar per veure'n els detalls.

### **3.5. FAQ**

- Format expandible (*accordion*) per mostrar preguntes freqüents:
  - Cada pregunta es mostra com un títol curt que es pot desplegar per veure la resposta completa.
- Botó o enllaç directe al GitHub perquè els usuaris puguin proposar noves preguntes mitjançant issues.

### **3.6. Configuració**

Accessible des de l'AppBar a qualsevol pantalla mitjançant una icona ⚙️.

#### Opcions disponibles

1. **Idioma**:
   - Selecció d'idioma entre català, castellà i anglès.
2. **Tema**:
   - Tema clar o fosc amb opció automàtica segons el sistema operatiu del dispositiu.
3. **About**:
   - Informació sobre l'app (nom, versió, desenvolupador, enllaç al GitHub).
4. **Disclaimer**:
   - Avís legal indicant que aquesta app és un projecte no oficial creat per fans.

## **4\. Paleta de colors**

### Colors principals

- Verd (\#8BC34A): Per a les cartes oficials.
- Blau (\#87CEEB): Per a les cartes fan-made.
- Groc (\#F7DC6F): Per a les regles.
- Vermell clar (\#FFC080): Per al FAQ.

### Colors secundaris

- Fons clar: Gris clar (\#F7F7F7).
- Fons fosc (tema fosc): Gris fosc (\#333333).
- Text principal: Negre (\#000000) o blanc (\#FFFFFF) segons el tema.

## **5\. Tecnologies utilitzades**

1. **Framework**: Flutter
2. **Gestió d'estat**: Riverpod amb anotacions i *freezed* per immutabilitat.
3. **Navegació**: *go\_router* per una navegació eficient dins l'app.
4. **Markdown**: Manuals en format Markdown gestionats amb *markdown\_widget*.
5. **Traduccions**: *easy\_localization* per suport multilingüe (català, castellà, anglès).
6. **Repositori col·laboratiu**: GitHub per gestionar cartes fan-made i FAQ.

## **6\. Flux del projecte**

1. **Fase 1: Planificació i configuració inicial**

   - Crear el projecte Flutter.
   - Configurar dependències inicials.
   - Establir el repositori GitHub.
   - Dissenyar l'estructura bàsica.

2. **Fase 2: Implementació de la navegació i estructura bàsica**

   - Configurar *go\_router*.
   - Desenvolupar la pantalla Home.
   - Implementar el canvi de vista entre graella i llista.

3. **Fase 3: Desenvolupament de funcionalitats principals**

   - Implementar cartes oficials i fan-made.
   - Desenvolupar regles i FAQ.
   - Integrar manuals en Markdown.

4. **Fase 4: Personalització i configuració**

   - Implementar *easy\_localization* per traduccions.
   - Afegir tema clar/fosc.

5. **Fase 5: Integració amb GitHub**

   - Afegir enllaços al repositori.
   - Configurar plantilles d'issues per cartes fan-made i FAQ.
