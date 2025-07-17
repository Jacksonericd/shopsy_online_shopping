# 🛍️ Shopsy – Product Listing & Cart App

**Shopsy** is a Flutter-based mobile app prototype for a small online store. It showcases essential e-commerce features like product listing, detailed views, cart functionality, and local cart persistence, all implemented using **Clean Architecture** and **Provider** for state management.

---

## ✨ Features

- 📦 Product list loaded from a local JSON file
- 🔍 View product details with image and price
- 🛒 Add to cart and remove from cart
- 💾 Persistent cart using SharedPreferences
- 🧠 State management with Provider
- 🧱 Clean Architecture implementation
- ⚙️ Dependency injection with `get_it`
- 🖼️ Image caching using `cached_network_image`

---

## 📁 Project Structure (Clean Architecture)
<pre>
lib/
├── core/               # Constants, service locators, route configurations
├── data/               # Data layer: models, datasources, repository impl
│   ├── models/
│   ├── datasources/
│   ├── repositories/
│   └── services/
├── domain/             # Domain layer: entities, use cases, abstract repos
│   ├── entities/
│   ├── repositories/
│   ├── usecases/
│   └── services/
├── presentation/       # UI layer: providers, screens, widgets
│   ├── providers/
│   ├── pages/
│   └── widgets/
└── main.dart           # App entry point
</pre>

---

## 🔧 Getting Started

### 1. Clone the repo
```bash
git clone https://github.com/Jacksonericd/shopsy_online_shopping.git
cd shopsy
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Generate JSON serialization code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Run the app
```bash
flutter run
```

👤 Developer
Jackson Eric Dcosta