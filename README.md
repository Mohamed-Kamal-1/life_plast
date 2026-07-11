# 🛠️ Life Plast ERP System (Local Desktop & Mobile)

**A High-Performance Offline-First ERP solution tailored for industrial supply management.**

Built for **stability**, **data integrity**, and **speed**, operating entirely locally to ensure 100% uptime in environments without reliable internet connectivity.

---

## 🚀 Overview
Life Plast ERP is a specialized local management system designed for industrial and plumbing supply companies. It replaces manual paperwork with a robust digital infrastructure, focusing on fast data entry and local storage reliability.

### Key Business Modules:
* **Inventory Engine:** Real-time stock tracking with localized data persistence.
* **Offline Invoicing:** Instant digital invoice generation and local record-keeping for daily sales.
* **Stock Flow Audit:** Specialized logic to track and verify stock movements and sales history.
* **Performance Dashboard:** High-speed data visualization for sales trends and stock alerts.

---

## 🏗️ Architecture & Tech Stack
This project is built with a focus on **modularity** and **testability**, ensuring the business logic is decoupled from the UI.

* **Framework:** [Flutter](https://flutter.dev) (Optimized for **Windows Desktop** & Android).
* **State Management:** [BLoC / Cubit](https://pub.dev/packages/flutter_bloc) for predictable, localized state handling.
* **Local Persistence:** 
    * **SQLite:** Utilized as the primary relational database to structuralize, query, and manage complex inventory and accounting data efficiently.
    * **SharedPreferences:** Used for caching lightweight key-value data, user settings, and session flags.
* **Dependency Injection:** [Injectable](https://pub.dev/packages/injectable) & [GetIt](https://pub.dev/packages/get_it) for decoupled service management and cleaner code.
* **Business Logic:** Modularized using **Dart Mixins** to organize cross-cutting concerns (Sales, Purchases, Invoices).
* **Updates:** [Shorebird](https://shorebird.dev) for Over-the-Air (OTA) patches to deliver instant fixes.

---

## ✨ Technical Highlights
* **Zero-Latency Performance:** Since all data is handled locally, the application provides an instantaneous user experience.
* **Relational Data Integrity:** Designed structured SQLite tables with relational integrity to handle complex accounting transactions and prevent inventory data corruption.
* **Service-Oriented Design:** Logic is encapsulated in Singletons and Services to ensure a single source of truth for data.
* **Luxury Minimalist UI:** A premium dashboard designed for high-density data management with a clean, professional aesthetic.
* **Cross-Platform Consistency:** Unified codebase providing a native experience on Windows (Admin use) and Mobile.

---

## 📸 Project Preview
*(Add your screenshots here to showcase the Luxury UI)*

---

## 🛠️ Installation & Setup (For Developers)

1. **Clone the repo:**
   ```bash
   git clone [https://github.com/Mohamed-Kamal-1/life_plast.git](https://github.com/Mohamed-Kamal-1/life_plast.git)
