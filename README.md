# Каталог молекул — Flutter

Каталог соединений по данным ChEMBL: список, деталь молекулы и связанный
экран механизма действия. Список и детали молекул загружаются из ChEMBL API.
Механизмы действия пока берутся из локальных данных ЛР2; их перевод на API —
следующий шаг ЛР3.

## Возможности

- Поиск по части названия без учёта регистра и сообщение «Ничего не найдено».
- Возврат с сохранением запроса, результатов и позиции списка.
- Светлая и тёмная темы, русский и английский интерфейс.
- Настройки хранятся в памяти сессии. Переводятся только подписи интерфейса.
- Индикаторы загрузки и сообщение об ошибке с кнопкой «Повторить».

## Подготовка и запуск

Нужен Flutter SDK с версией Dart, совместимой с `pubspec.yaml`.
Команды выполняются из корня проекта:

```bash
flutter pub get
flutter gen-l10n
dart run build_runner build
```

Локализация генерируется из `lib/l10n/*.arb`; сгенерированные Dart-файлы
не хранятся в Git. Эти же команды устраняют отсутствие `AppLocalizations`.

| Платформа | Что требуется | Команда |
| --- | --- | --- |
| Web | Chrome или Edge | `flutter run -d chrome` или `flutter run -d edge` |
| Windows | Visual Studio 2022 с «Desktop development with C++» | `flutter run -d windows` |
| Android | Android SDK и эмулятор либо телефон | `flutter run -d <android-device-id>` |


## Архитектура

`features/molecule` содержит сценарии каталога, включая экран механизма
выбранной молекулы, и разделён на `domain`, `data` и `presentation`.
`features/mechanism` содержит модель и репозиторий механизмов с правилом
связи по ID формы вещества и исходного соединения. Зависимость направлена
от `molecule` к `mechanism`; обратных импортов нет.
В `common` находятся навигация, темы и настройки; в `l10n` — переводы.
Состоянием управляет `flutter_bloc` с Cubit,
репозитории предоставляются по интерфейсам. Навигация — `go_router`
с идентификаторами в пути и переходами через `push`/`pop`.
Для молекул цепочка загрузки: `MoleculeApi` → `NetworkMoleculeDataSource` →
`MoleculeRepository` → Cubit → экран. DTO генерируются через
`json_serializable`; сгенерированные `*.g.dart` хранятся в Git.
Общий экземпляр Dio создаётся в корне приложения, базовый адрес и таймауты
настроены в `common/network/dio_client.dart`.

## Данные и ограничения

Загружаются первые 20 молекул, у которых `pref_name` отличается от `null`,
упорядоченные по ChEMBL ID. Поиск пока выполняется только по загруженной странице.
Деталь молекулы получает данные отдельным запросом по ID. Отсутствующие формула
и масса отображаются как «Нет данных»; вместо отсутствующего названия используется ID.
Пагинация пока не реализована.

Для механизмов пока используются 11 локальных записей ChEMBL для 9 молекул
из каталога ЛР2. Связь учитывает ID формы вещества и исходного соединения.
Для остальных молекул отображается отсутствие данных в локальном каталоге.
Изображения структур заменены иконками-заглушками.

Скриншоты ниже относятся к версии ЛР2, проверенной на Android, Web и Windows.

## Скриншоты

### Android

| Светлая тема | Тёмная тема |
| --- | --- |
| <img src="docs/screenshots/android-list-light.png" alt="Список молекул на Android в светлой теме" width="260"> | <img src="docs/screenshots/android-list-dark.png" alt="Список молекул на Android в тёмной теме" width="260"> |

| Поиск и выбор языка | Ничего не найдено |
| --- | --- |
| <img src="docs/screenshots/android-search-language.png" alt="Поиск молекул и меню языка на Android" width="260"> | <img src="docs/screenshots/android-search-empty.png" alt="Пустой результат поиска на Android" width="260"> |

Деталь молекулы:

<img src="docs/screenshots/android-molecule-detail.png" alt="Деталь PRAZOSIN на Android" width="260">

### Windows

| Список молекул | Деталь молекулы и выбор языка |
| --- | --- |
| <img src="docs/screenshots/windows-list-light.png" alt="Список молекул на Windows в светлой теме" width="540"> | <img src="docs/screenshots/windows-molecule-detail.png" alt="Деталь PRAZOSIN и меню языка на Windows" width="540"> |

Механизм действия:

<img src="docs/screenshots/windows-mechanism-detail.png" alt="Механизм действия PRAZOSIN на Windows" width="800">

| Ничего не найдено | Результаты поиска |
| --- | --- |
| <img src="docs/screenshots/windows-search-empty.png" alt="Пустой результат поиска на Windows" width="540"> | <img src="docs/screenshots/windows-search-results.png" alt="Поиск NICOTINE и NORNICOTINE на Windows" width="540"> |
