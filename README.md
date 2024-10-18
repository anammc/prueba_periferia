# prueba_peliculas

Esta es una aplicación simple desarrollada en Flutter que consume una API de peliculas. Muestra información como fecha de lanzamiento, popularidad, y más datos interesantes de cada pelicula.

## Arquitectura

La aplicación sigue el patrón de **Clean Architecture**, lo que facilita la mantenibilidad y escalabilidad del proyecto. La lógica de negocio está separada de los detalles de implementación (UI, API, etc.), lo que permite una mejor organización del código y pruebas más sencillas.

## Requisitos Previos

Antes de comenzar, asegúrate de tener lo siguiente instalado:

- Flutter SDK (versión 3.22.2 o superior)
- Dart SDK (versión 3.4.3 o superior)
- Un editor de texto como [VS Code](https://code.visualstudio.com/) o [Android Studio](https://developer.android.com/studio)

## Dependencias

Las principales dependencias utilizadas en este proyecto son:

- `google_fonts: ^6.2.1`: Para usar fuentes personalizadas de Google.
- `page_transition: ^2.1.0`: Para realizar transiciones personalizadas entre pantallas.
- `dio: ^5.7.0`: Para realizar las peticiones HTTP a la API.
- `dartz: ^0.10.1`: Para manejar programación funcional y resultados.
- `get_it: ^7.7.0`: Para la inyección de dependencias.
- `rxdart: ^0.28.0`: Para la programación reactiva basada en streams.
- `shared_preferences: ^2.3.2`: Para almacenar datos de forma local en el dispositivo.
- `connectivity_plus: ^3.0.3`: Para verificar el estado de la conectividad a internet.
- `cached_network_image: ^3.4.1`: Para mostrar imágenes con caché de manera eficiente.


## Instalación

1. Navega a la carpeta del proyecto:
    ```bash
    cd prueba_peliculas

2. Instala las dependencias del proyecto:
    ```bash
    flutter pub get

3. Conecta un dispositivo o inicia un emulador y ejecuta la aplicación:
    ```bash
    flutter run
