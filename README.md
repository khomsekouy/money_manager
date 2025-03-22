# flutter_money_manager

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

A well-structured Flutter project should follow Clean Architecture with layers:
lib/
│── core/                 # Core utilities, themes, constants
│   ├── error/            # Error handling
│   ├── usecases/         # Use case logic
│   ├── network/          # API client, Dio or Http setup
│── data/                 # Data layer
│   ├── datasources/      # Remote & local data sources
│   ├── models/           # Data models
│   ├── repositories/     # Repository implementations
│── domain/               # Business logic layer
│   ├── entities/         # Business models (pure Dart classes)
│   ├── repositories/     # Repository contracts (abstract classes)
│   ├── usecases/         # Business logic (GetExpenses, AddTransaction)
│── presentation/         # UI layer
│   ├── blocs/            # State management (BLoC or Cubit)
│   ├── pages/            # Screens (Dashboard, Add Expense)
│   ├── widgets/          # Reusable UI components
│── main.dart             # Entry point

🔹 Features to Include
    ✅ User Authentication (Google Sign-in, Email)
    ✅ Expense Tracking (Income & Expense categories)
    ✅ Budget Management (Set limits, alerts)
    ✅ Statistics & Reports (Pie charts, Bar graphs)
    ✅ Export Data (CSV, PDF)
    ✅ Dark Mode Support
    
    Would you like a sample main.dart setup or help with any specific feature? 🚀

📌 Clean Architecture Overview

    Clean Architecture divides your code into three main layers:
    
    1️⃣ Presentation Layer (UI + State Management)
    2️⃣ Domain Layer (Business Logic + Use Cases)
    3️⃣ Data Layer (Repositories + Data Sources)