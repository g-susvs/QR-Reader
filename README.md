# QR Reader

Un nuevo proyecto del [curso de Flutter](https://www.udemy.com/course/flutter-ios-android-fernando-herrera/) 😁.


<!-- ## Pendiente
- ✅ crear cada body para cada opción seleccionada
- ✅ simular lista de IP
- ✅ hacer funcional el scan button
- ✅Crear metodos del db provider
- ✅Crear scan list provider y respectivos metodos -->



## Dependencias utilizadas
- [Provider](https://pub.dev/packages/provider)
- [Flutter barcode scan](https://pub.dev/packages/flutter_barcode_scanner)
- [SQLite](https://pub.dev/packages/sqflite#-readme-tab-)
- [Path provider](https://pub.dev/packages/path_provider/install) Nos ayuda a saber donde se encuentra el archivo de la base de datos.
- [Url launcher](https://pub.dev/packages/url_launcher/install)
- [Google maps flutter](https://pub.dev/packages/google_maps_flutter/install)

## Configuraciones Google maps
Habilitar el SDK de Google Maps tanto de Android como IOS en [Google Developers Console](https://console.cloud.google.com/) para obtener sus respectivas **API_kEY** y configurar los archivos ``AndroidManifest.xml`` y ``AppDelegate.swift`` siguiendo la [documentación.](https://pub.dev/packages/google_maps_flutter)

## Inconvenientes

#### Configurar multidex
Los archivos de las apps para Android contiene archivos con formato DEX que limitan la catidad de métodos a los que se puede hacer referencia desde un archivo DEX, para superar esta limitación tenemos que habilitar la configuración ``multidex`` que permite que la app compile y lea varios archivos DEX.

Si minSdkVersion está configurado en 20 o en una versión anterior, deberás usar la biblioteca multidex y realizar las siguientes modificaciones en el proyecto de la app.
Modificar el archivo ``build.gradle`` que existe en "[your project]\android\app\build.gradle" para habilitar multidex y agregar la biblioteca multidex, [más información.](https://developer.android.com/studio/build/multidex)
```gradle
    defaultConfig {
        // ...
        
        multiDexEnabled true
        
        // ...
    }
```



