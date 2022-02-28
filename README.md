## POC-Flutter-Open/Save-Json-File

### Objective:
using the size 800x600 pixels, implement a flutter application that allows opening and saving a json file.

acceptance criteria:
- be desktop
- open a json file
- save the title and details fields in a json file
- show recent files using localstorage

### Comandos:
#### Habilitar web
```
flutter config --enable-web
```

#### Habilitar desktop
```
flutter config --enable-windows-desktop
```
```
flutter config --enable-macos-desktop
```
```
flutter config --enable-linux-desktop
```

#### Criar Projeto Web
```
flutter create --project-name {NOME_DO_PROJETO} --platforms=web .
```
#### Buildando o projeto
```
slidy run build
```
```
flutter run -d chrome
```

#### Flutter & Dart Version: 
```
Flutter 2.10.0 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 5f105a6ca7 (4 days ago) • 2022-02-01 14:15:42 -0800
Engine • revision 776efd2034
Tools • Dart 2.16.0 • DevTools 2.9.2
```
```
28/02/2022
em testes realizados flutter desktop não funciona com visual studio 2022 recomendado utilizar o visual studio 2019
```
##### Instalação do flutter:
```
https://docs.flutter.dev/get-started/install
```

##### Atualizar o flutter:
```
flutter upgrade
```
##### Verificar versão de pacotes:
```
flutter pub outdated
```
##### Atualizar pacotes:
```
flutter pub upgrade
```
#### Slidy Version: 
```
Slidy version: 3.2.2
```
##### Instalação slidy:
```
https://github.com/Flutterando/slidy
```

##### Alteração pubspec.yaml:
```
vars: 
    clean: flutter clean
    get: flutter pub get
    runner: flutter pub run build_runner
scripts: 
    build: $clean & $get & $runner build --delete-conflicting-outputs
    watch: $clean & $get & $runner watch --delete-conflicting-outputs --use-polling-watcher
```

##### Comandos slidy:
```
slidy run build
```
```
slidy g page pages/{pageName}
```
```
slidy g m features/{featureName} -c
```
```
slidy generate widget widget/{widgetName}
```
```
slidy g mbx store/{storeName}
```

##### Chocolatey:
```
https://chocolatey.org/install#individual
```
