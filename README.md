# Flouka User App

## Overview
Flouka is a Flutter application designed for users, built with scalability and maintainability in mind. It follows **Clean Architecture** principles to separate concerns and ensure testability.

## Architecture

The project is structured by **Features** (Feature-first), where each feature contains its own **Data**, **Domain**, and **Presentation** layers.

### Directory Structure

```
lib/
├── core/                  # Shared resources (Config, Constants, Widgets, Helpers)
├── features/              # Feature modules
│   ├── [feature_name]/    # e.g., auth, cart, home
│   │   ├── data/          # Data layer
│   │   │   ├── datasources/ # Remote (API) or Local data sources
│   │   │   ├── models/      # Data models (DTOs) parsing JSON
│   │   │   └── repositories/# Implementation of domain repositories
│   │   ├── domain/        # Domain layer (Business Logic)
│   │   │   ├── entities/    # Pure Dart objects (Business entities)
│   │   │   ├── repositories/# Abstract interfaces for repositories
│   │   │   └── usecases/    # Application specific business rules
│   │   └── presentation/  # UI layer
│   │       ├── providers/   # State Management (Provider)
│   │       ├── views/       # Screens / Pages
│   │       └── widgets/     # Feature-specific widgets
├── app_providers.dart     # Global Provider setup
├── main.dart              # Entry point
└── injection_container.dart # Dependency Injection setup (GetIt)
```

## Key Technologies & Libraries

- **Framework:** [Flutter](https://flutter.dev/)
- **State Management:** [Provider](https://pub.dev/packages/provider)
- **Dependency Injection:** [GetIt](https://pub.dev/packages/get_it)
- **Networking:** [Dio](https://pub.dev/packages/dio)
- **Local Storage:** [Shared Preferences](https://pub.dev/packages/shared_preferences)
- **Maps:** [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)
- **Firebase:** Core, Messaging (FCM)

## Setup & Running

1. **Prerequisites:**
   - Flutter SDK
   - Android Studio / VS Code
   - CocoaPods (for iOS)

2. **Installation:**
   ```bash
   flutter pub get
   ```

3. **Running the App:**
   ```bash
   flutter run
   ```

## Development Guidelines

- **New Features:** Create a new folder in `lib/features/` and follow the Data/Domain/Presentation structure.
- **State Management:** Use `ChangeNotifier` and register it in `app_providers.dart` if it needs to be globally accessible, or scoped locally.
- **Dependency Injection:** Register new repositories and use cases in `injection_container.dart`.

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Clean Architecture in Flutter](https://resocoder.com/flutter-clean-architecture-proposal/)
