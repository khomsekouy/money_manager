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

**A well-structured Flutter project should follow Clean Architecture with layers:**
1.         lib/
2.         │── core/                 # Core utilities, themes, constants
3.         │   ├── error/            # Error handling
4.         │   ├── usecases/         # Use case logic
5.         │   ├── network/          # API client, Dio or Http setup
6.         │── data/                 # Data layer
7.         │   ├── datasources/      # Remote & local data sources
8.         │   ├── models/           # Data models
9.         │   ├── repositories/     # Repository implementations
10.         │── domain/               # Business logic layer
11.         │   ├── entities/         # Business models (pure Dart classes)
12.         │   ├── repositories/     # Repository contracts (abstract classes)
13.         │   ├── usecases/         # Business logic (GetExpenses, AddTransaction)
14.         │── presentation/         # UI layer
15.         │   ├── blocs/            # State management (BLoC or Cubit)
16.         │   ├── pages/            # Screens (Dashboard, Add Expense)
17.         │   ├── widgets/          # Reusable UI components
18.         │── main.dart         # Entry point

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