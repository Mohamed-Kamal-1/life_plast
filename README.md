# 🛠️ Life Plast ERP System
**An Enterprise Resource Planning solution tailored for plumbing and industrial supply management.**

Built with a focus on **scalability**, **high-performance data rendering**, and **cross-platform efficiency** (Windows & Mobile).

---

## 🚀 Overview
Life Plast ERP is designed to streamline the complex operations of plumbing supply companies. It manages everything from multi-warehouse inventory reconciliation to real-time sales tracking and financial reporting.

### Key Business Modules:
* **Inventory Management:** Real-time tracking across multiple physical and virtual warehouses.
* **Sales & Invoicing:** Automated invoice generation with tax calculations and discount management.
* **Warehouse Reconciliation:** Advanced logic for inventory audits and stock movement tracking.
* **Dashboard & Analytics:** High-level overview of sales performance and stock levels.

---

## 🏗️ Architecture & Tech Stack
This project follows **Clean Architecture** principles to ensure the code is testable, maintainable, and independent of external frameworks.

* **Framework:** [Flutter](https://flutter.dev) (Targeting Windows Desktop & Android).
* **State Management:** [BLoC / Cubit](https://pub.dev/packages/flutter_bloc) for predictable state transitions.
* **Architecture:** Clean Architecture (Data, Domain, and Presentation layers).
* **Database:** * **Remote:** Firebase Firestore (Real-time sync).
    * **Local:** Hive (Offline-first capability & caching).
* **Updates:** [Shorebird](https://shorebird.dev) for Over-the-Air (OTA) patches without needing a full reinstall.
* **Dependency Injection:** GetIt.
* **Network:** Dio with interceptors for robust API handling.

---

## ✨ Features (Technical Highlights)
* **Cross-Platform Consistency:** Shared codebase for Windows Desktop (Office staff) and Mobile (Warehouse staff).
* **Luxury Minimalist UI:** Custom-built components designed for "Grandeur" (Fakhama) and ease of use in fast-paced environments.
* **Real-time Stock Reconciliation:** Custom algorithms to handle stock updates across multiple locations simultaneously.
* **Offline-First Support:** Workers can continue logging data in warehouses with poor connectivity; syncs automatically when online.

---

## 📸 Screenshots (Optional)
*Add your best screenshots here to show off that "Luxury Minimalist" design.*
| Dashboard | Inventory List | Invoice View |
| :---: | :---: | :---: |
| ![Dash](https://via.placeholder.com/200x400) | ![Inv](https://via.placeholder.com/200x400) | ![Inv](https://via.placeholder.com/200x400) |

---

## 🛠️ Installation & Setup
1. **Clone the repo:**
   ```bash
   git clone [https://github.com/Mohamed-Kamal-1/life_plast.git](https://github.com/Mohamed-Kamal-1/life_plast.git)
