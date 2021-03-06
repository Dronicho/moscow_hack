![App Logo][]

Это репозиторий с исходным кодом для нашего приложения, написанного во время [Moscow city hack](https://moscityhack.innoagency.ru)

Исходный код бекенда можно найти [здесь](https://github.com/semyon-dev/i.moscow)

## Описание

Далее идет описание архитектурных решений и выбора технологий

### Выбор технологий

Приложение полностью написано на [Flutter](https://flutter.dev)
Почему? Потому что кроссплатформа - это круто, а среди всех кроссплатформенных фреймворков Flutter, по моему мнению, является лучшим выбором,
благодаря тому, что он компилирует исходный код в нативный код платформы (Swift, Kotlin), что позволяет получить большой рост производительности

### Архитектура

<a href="https://bloclibrary.dev/#/">
  <p align="center">
    <img src="https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_logo_full.png" height="100" alt="Bloc" />
  </p>
</a>
Среди всего многообразия достуных архитектур (MVP, MVC, MVVM, MVI и тд.) было решено взять BLoC(Buisness Logical Component), так как является наиболее mature и battle-tested из всех архитектур и придумано гуглом(создателем Flutter), а также я его знаю)

Как говорят сами создатели, Bloc - это класс, в котором:
* Все входы - потоки
* Все выходы - потоки

Также, Bloc разбивает состояние на независимые блоки, в отличии от того же Redux, где state приложения - это один большой объект

Это позволяет удобно разбивать приложение на логические блоки, 1 экран - 1 блок, чего я и придерживаюсь

### Структура
Исходя из вышеописаных соображений, получается следующая структура
```
module_name/
  view/
    - view.dart
    - page.dart
  bloc/
    - bloc_state.dart
    - bloc.dart
  wigets/
    // вспомогательные виджеты
```
`view.dart` и `widgets/` содержат весь UI,

`page.dart` обертка над `view.dart` обычно нужна, для того, чтобы создать и добавить `Bloc` в контекст

`bloc/` бизнес логика
### Зависимости
в проекты были использованы следующие зависимости

#### flutter_bloc
Собственно сам state management, состоит из нескольких пакетов:
* `bloc` - ядро, предоставляет ключевые классы `Bloc` и `Cubit` для реализации данного подхода
* `flutter_bloc` - набор полезных виджетов для удобной интеграции блоков во флаттер
#### GetIt
простой, но мощный service locator для инъекции зависимостей, например для локального сохранения и работы с сетью
#### Firebase
Еще одно гугловское решение, платформа разработки мобильных приложений с огромным функционалом
* `firebase_core` - ключевой пакет для инициализации Firebase
* `firebase_messaging` - пакет для получения push-уведомлений
* `firebase_storage` - пакет для работы с объктным хранилищем (для фотографий и дополнительных материалом проекта)

Из того, что не успели реализовать
* `firestore` - база данных с обновлениями в реальном времени, хотели использовать для чата

[app logo]: https://github.com/Dronicho/moscow_hack/blob/master/images/title.png
### Getting Started
Запуск в режиме отладки:
```
git clone https://github.com/Dronicho/moscow_hack.git
cd moscow_hack
flutter run
```
> Необходим запущенный эмулятор или подключенное устройство

Для сборки релизной версии(она не лагает)
#### Android
```
flutter build apk --split-per-abi
flutter install
```
#### IOS
```
flutter build ios
flutter install
```
Приложение будет установлено на подключенное устройство

