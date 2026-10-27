# 🍏 FruitHUP — E-Commerce Mobile Application

<p align="center">
  <b>A modern, feature-rich cross-platform mobile application for ordering fresh fruits, built with Flutter and engineered using Clean Architecture best practices.</b>
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

**FruitHUP** is a seamless cross-platform mobile e-commerce solution designed to deliver a smooth and intuitive fruit shopping experience for end users. 

The application is engineered prioritizing scalability, maintainability, and code testability. It adheres strictly to **Clean Architecture** principles, keeping a clear separation of concerns across Data, Domain, and Presentation layers.

> 🔗 **Looking for the Management System?** Check out the [FruitHUP Admin Dashboard Repository](https://github.com/YOUR_USERNAME/FruitHUP-Admin) for product management and order controls.

---

## 📱 User Interface & Showcase

<p align="center">
  <img src="screenshots/screen1.jpg" width="130" alt="Onboarding Screen" /> &nbsp;
  <img src="screenshots/screen2.jpg" width="130" alt="Authentication Screen" /> &nbsp;
  <img src="screenshots/screen3.jpg" width="130" alt="Home Screen" /> &nbsp;
  <img src="screenshots/screen4.jpg" width="130" alt="Product Details" /> &nbsp;
  <img src="screenshots/screen5.jpg" width="130" alt="Cart Screen" /> &nbsp;
  <img src="screenshots/screen6.jpg" width="130" alt="Checkout Flow" />
</p>


---

## 🏗️ Architecture & Technical Stack

The core design follows enterprise-level mobile architecture standards:

* **Framework:** [Flutter](https://flutter.dev/) (Dart)
* **Architecture:** Clean Architecture (Data, Domain, Presentation layer separation)
* **State Management:** BLoC / Cubit pattern for predictable state handling
* **Navigation & Routing:** GoRouter for declarative routing and deep linking support
* **Dependency Injection:** GetIt service locator for clean dependency injection
* **Backend & Cloud Services:**
  * **Firebase Authentication:** Secure sign-up/sign-in and session management
  * **Cloud Firestore:** Real-time NoSQL database for products, categories, and order processing
  * **Supabase Storage:** High-performance media hosting
* **Local Data Persistence:** SharedPreferences & Hive

---

## ✨ Key Features

* 🔐 **Secure Authentication:** User sign-in/sign-up powered by Firebase Auth.
* 🛍️ **Interactive Catalog:** Browse fruits by categories, fast search, and detailed product info.
* 🛒 **Smart Shopping Cart:** Dynamic item quantity adjustment with real-time total calculation.
* 💳 **Streamlined Checkout:** Fast order placement and delivery detail management.
* ⚡ **Real-time Synchronization:** Instant catalog and price updates synced from the Admin Dashboard.
* 🎨 **Responsive UI/UX:** Modern, pixel-perfect layouts designed for mobile screens.

---

## 📁 Repository Structure

```text
lib/
├── core/                   # Utilities, constants, shared widgets, & theme configuration
├── features/
│   ├── auth/               # Authentication domain, data, and UI
│   ├── home/               # Product discovery, categories, and main feed
│   ├── cart/               # Cart state management and local persistence
│   └── checkout/           # Order placement and checkout workflow
└── main.dart               # App entry point