# Clean Dart CLI

![screenshots/logo.png](https://github.com/sthormio/clean-dart-cli/blob/main/screenshots/logo.png?raw=true)

This project is one cli for integrate Flutter and Dart with Clean Architecture

With this cli you can generate the structure of the folders based on the structure of the Clean Architecture and files like models, usecases and entites for automatize the time of the development.

## How to use?

First thing that you need to do is activate the clean-dart-cli, for this run the command bellow in your terminal

```dart
$ pub global activate clean_dart_cli
```

### Generate the layers folders

With clean-dart-cli you can generate all folders of the one specific layer

how to generate domain layer

```dart
$ clean-dart gen layer domain /example
```

![screenshots/domain.png](https://github.com/sthormio/clean-dart-cli/blob/main/screenshots/domain.png?raw=true)

how to generate infra layer

```dart
$ clean-dart gen layer infra /example
```

![screenshots/infra.png](https://github.com/sthormio/clean-dart-cli/blob/main/screenshots/infra.png?raw=true)

how to generate external layer

```dart
$ clean-dart gen layer external /example
```

![screenshots/external.png](https://github.com/sthormio/clean-dart-cli/blob/main/screenshots/external.png?raw=true)

how to generate ui layer

```dart
$ clean-dart gen layer ui /example
```

![screenshots/ui.png](https://github.com/sthormio/clean-dart-cli/blob/main/screenshots/ui.png?raw=true)

how to generate complete layers

```dart
$ clean-dart gen layer complete /example
```

![screenshots/completedartcli.png](https://github.com/sthormio/clean-dart-cli/blob/main/screenshots/completedartcli.png?raw=true)

### Generate Files

how to generate usecases

```dart
$ clean-dart gen usecase /example/domain/usecases RegisterUser
```

![screenshots/usecase.png](https://github.com/sthormio/clean-dart-cli/blob/main/screenshots/usecase.png?raw=true)

how to generate entities

```dart
$ clean-dart gen entity /example/domain/entities User
```

![screenshots/entity.png](https://github.com/sthormio/clean-dart-cli/blob/main/screenshots/entity.png?raw=true)

how to generate models

```dart
$ clean-dart gen model /example/infra/models User
```

![screenshots/model.png](https://github.com/sthormio/clean-dart-cli/blob/main/screenshots/model.png?raw=true)

darthow to generate modelsJs (Model with Json Serializable)

```dart
$ clean-dart gen modelJs /user/external/models User
```

![screenshots/model_js.png](https://github.com/sthormio/clean-dart-cli/blob/main/screenshots/model_js.png?raw=true)

how to generate error

```dart
$ clean-dart gen error /user/domain/error User
```

![screenshots/error.png](https://github.com/sthormio/clean-dart-cli/blob/main/screenshots/error.png?raw=true)


## Upgrade Clean Dart Cli

```dart
$ clean-dart upgrade
```

## List Commands

```dart
$ clean-dart --help
```

## How to contribute?

You can clone this project and send a pull request with your improvements or open issues
