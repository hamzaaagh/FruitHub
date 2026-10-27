# 🍏 FruitHUP — Premium E-Commerce Mobile Application

<p align="center">
  <b>A modern, feature-rich cross-platform e-commerce application for ordering fresh fruits, built with Flutter and engineered using Clean Architecture best practices.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Clean%20Architecture-000000?style=for-the-badge" alt="Clean Architecture">
  <img src="https://img.shields.io/badge/BLoC%2FCubit-02569B?style=for-the-badge" alt="BLoC/Cubit">
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase">
  <img src="https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white" alt="Supabase">
</p>

---

## 📌 Overview

**FruitHUP** is a seamless cross-platform mobile e-commerce solution designed to deliver a smooth and intuitive fruit shopping experience. 

The application is built from the ground up prioritizing scalability, maintainability, and testability. It adheres strictly to **Clean Architecture** principles, maintaining a clear separation of concerns across Data, Domain, and Presentation layers.

---

## 📱 User Interface & Showcase

<p align="center">
  <img src="screenshots/screen1.png" width="130" alt="Onboarding Screen" /> &nbsp;
  <img src="screenshots/screen2.png" width="130" alt="Authentication Screen" /> &nbsp;
  <img src="screenshots/screen3.png" width="130" alt="Home Screen" /> &nbsp;
  <img src="screenshots/screen4.png" width="130" alt="Product Details" /> &nbsp;
  <img src="screenshots/screen5.png" width="130" alt="Cart Screen" /> &nbsp;
  <img src="screenshots/screen6.png" width="130" alt="Checkout Flow" /> &nbsp;
  <img src="screenshots/screen7.png" width="130" alt="Admin / Profile" />
</p>

> **Note:** Place your application screenshots inside a `screenshots/` directory in the repository root and name them `screen1.png` through `screen7.png` for them to display automatically.

---

## 🏗️ Architecture & Technical Stack

The core design follows enterprise-level mobile architecture standards:

* **Framework:** [Flutter](https://flutter.dev/) (Dart)
* **Architecture:** Clean Architecture (Data, Domain, Presentation layer separation)
* **State Management:** BLoC / Cubit pattern for predictable state flow
* **Navigation & Routing:** GoRouter for declarative routing and deep linking support
* **Dependency Injection:** GetIt service locator for clean dependency management
* **Backend & Cloud Services:**
  * **Firebase Authentication:** Secure user sign-up and session handling
  * **Cloud Firestore:** Real-time NoSQL database for store listings and orders
  * **Supabase Storage:** High-performance media and asset hosting
* **Local Data Persistence:** SharedPreferences & Hive

---

## ✨ Key Features

* 🔐 **Secure Authentication:** User sign-in/sign-up powered by Firebase Auth.
* 🛍️ **Interactive Catalog:** Browse fruits by categories, search items, and view detailed product info.
* 🛒 **Smart Shopping Cart:** Dynamic item management with real-time tax and price calculations.
* 💳 **Streamlined Checkout:** Fast and seamless order placement workflow.
* 🖥️ **Admin Dashboard:** Dedicated interface for product creation, catalog management, and stock updates.
* 🎨 **Responsive UI/UX:** Pixel-perfect, responsive layouts adhering to modern mobile UI design guidelines.

---

## 📁 Repository Structure

```text
lib/
├── core/                   # Utilities, constants, shared widgets, & theme configuration
├── features/
│   ├── auth/               # Authentication domain, data, and presentation UI
│   ├── home/               # Product discovery, categories, and main feeds
│   ├── cart/               # Cart state management and persistence
│   ├── checkout/           # Checkout steps and order submission
│   └── admin/              # Admin dashboard and product management tools
└── main.dart               # App entry point
