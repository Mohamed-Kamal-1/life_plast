# 🛠️ Life Plast ERP System (Local Desktop & Mobile)
**A High-Performance Offline-First ERP solution tailored for industrial supply management.**

Built for **stability**, **data integrity**, and **speed**, operating entirely locally to ensure 100% uptime in environments without internet connectivity.

---

## 🚀 Overview
Life Plast ERP is a specialized local management system designed for plumbing supply companies. It replaces manual paperwork with a robust digital infrastructure, focusing on fast data entry and local storage reliability.

### Key Business Modules:
* **Local Inventory Engine:** Real-time stock tracking across multiple warehouses without cloud dependency.
* **Offline Invoicing:** Instant Digital invoice generation and local record-keeping for daily sales.
* **Warehouse Reconciliation:** Specialized local algorithms to audit physical vs. digital stock movements.
* **Performance Dashboard:** High-speed data visualization for local sales trends and stock alerts.

---

## 🏗️ Architecture & Tech Stack
This project follows **Clean Architecture** principles to ensure the code is testable, maintainable, and independent of external frameworks.

* **Framework:** [Flutter](https://flutter.dev) (Optimized for **Windows Desktop** & Android).
* **State Management:** [BLoC / Cubit](https://pub.dev/packages/flutter_bloc) for predictable, localized state handling.
* **Local Storage (The Core):** * **[Hive](https://pub.dev/packages/hive):** Used for lightning-fast NoSQL data storage and local caching.
* **Architecture:** Clean Architecture (Data, Domain, and Presentation layers).
* **Updates:** [Shorebird](https://shorebird.dev) for Over-the-Air (OTA) patches when a temporary connection is available.
* **Dependency Injection:** [GetIt](https://pub.dev/packages/get_it) for decoupled service management.

---

## ✨ Features (Technical Highlights)
* **Zero-Latency Performance:** Since all data is stored locally, the app provides an instantaneous user experience even with large datasets.
* **Data Integrity & Security:** Implemented local backup logic to protect sensitive business data.
* **Cross-Platform Consistency:** Unified codebase for Windows (Office/Admin use) and Mobile (Warehouse floor use).
* **Luxury Minimalist UI:** A "Fakhama" dashboard designed for high-density data management with a premium, clean aesthetic.
* **Advanced Local Search:** Optimized indexing for rapid searching across thousands of stock items and invoices.

---

## 📸 Project Preview
*Here you can add your screenshots or a link to a demo video.*
> **Tip:** Adding a 1-minute video showing the "Local Database" speed will significantly boost your profile.

---

## 🛠️ Installation & Setup (For Developers)
1. **Clone the repo:**
   ```bash
   git clone [https://github.com/Mohamed-Kamal-1/life_plast.git](https://github.com/Mohamed-Kamal-1/life_plast.git)
