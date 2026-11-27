# Fundora

### Give Every Naira a Purpose.

Fundora is a personal income allocation application built with Flutter that helps users distribute their income across customizable financial categories using percentage-based allocation.

Instead of wondering where your money went, Fundora helps you decide where it should go before you spend it.

Users can configure their financial categories, assign allocation percentages, enter their weekly or monthly income, and instantly see how much money belongs to each category.

---

## Overview

Fundora is designed to make personal income distribution simple, transparent, and intentional.

The application focuses on one primary objective: helping users give every portion of their income a purpose.

### Key Features

- **Custom Categories:** Create and manage personalized financial categories.
- **Percentage-Based Allocation:** Assign custom percentages to different categories.
- **Automatic Calculations:** Instantly calculate the monetary value assigned to each category.
- **Flexible Income Frequency:** Support weekly and monthly income allocation.
- **Allocation Summary:** View allocated amounts and unallocated balances.
- **Allocation History:** Review previously saved income allocations.
- **Offline-First:** Store application data locally without requiring an internet connection.
- **Customizable Experience:** Configure currency, allocation frequency, and application theme.

---

## Technology Stack

Fundora is built using the following technologies and packages.

| Technology | Purpose |
|---|---|
| Flutter | Cross-platform UI framework |
| Dart | Programming language |
| Provider | State management |
| Hive CE | Local database |
| GoRouter | Application navigation |
| FL Chart | Financial data visualization |
| Intl | Currency and date formatting |
| UUID | Unique identifier generation |

---

## Architecture

Fundora follows a **Feature-First Architecture** with separation of presentation, domain, and data responsibilities.

```text
lib/
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── providers.dart
│
├── core/
│   ├── constants/
│   ├── errors/
│   ├── extensions/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── features/
│   ├── dashboard/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── income/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── allocation/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── categories/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── history/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── settings/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
└── main.dart
```

### Architectural Responsibilities

**Presentation Layer**
- Screens and reusable widgets.
- Provider classes.
- User interactions and UI state.

**Domain Layer**
- Business entities.
- Repository contracts.
- Allocation calculations.
- Allocation validation.
- Business rules.

**Data Layer**
- Data models.
- Repository implementations.
- Local data sources.
- Database operations.

The allocation engine is kept independent of the presentation and persistence layers to ensure that financial calculations can be tested independently.

---

## Allocation Logic

Fundora uses percentage-based calculations to determine how much income should be assigned to each category.

### Formula

```text
Allocated Amount = Income × (Percentage / 100)
```

### Example

Given a monthly income of ₦77,000:

| Category | Percentage | Amount |
|---|---:|---:|
| Transportation | 25% | ₦19,250 |
| Savings | 20% | ₦15,400 |
| Feeding | 20% | ₦15,400 |
| Development | 15% | ₦11,550 |
| Tithe & Giving | 10% | ₦7,700 |
| Entertainment | 10% | ₦7,700 |
| **Total** | **100%** | **₦77,000** |

### Allocation Rules

- Total allocation cannot exceed 100%.
- Allocations below 100% are allowed.
- Unallocated percentages and monetary balances are displayed.
- Changes to percentages trigger automatic recalculation.
- Zero or negative income values are rejected.
- Historical allocations preserve the category names, percentages, and amounts used at the time of allocation.
- Monetary calculations use integer minor units to avoid floating-point precision errors.

---

## Getting Started

### Prerequisites

Ensure you have the following installed:

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Git

### Installation

**1. Clone the repository**

```bash
git clone https://github.com/your-username/fundora.git
```

**2. Navigate to the project directory**

```bash
cd fundora
```

**3. Install dependencies**

```bash
flutter pub get
```

**4. Run the application**

```bash
flutter run
```

---

## Development Workflow

Fundora uses a feature-branch Git workflow.

The `main` branch contains stable code, while new features and bug fixes are developed in separate branches.

### Branch Naming Convention

| Prefix | Usage |
|---|---|
| `feature/` | New features |
| `fix/` | Bug fixes |
| `refactor/` | Code restructuring |
| `test/` | Testing improvements |
| `docs/` | Documentation |
| `chore/` | Maintenance |

### Example

```bash
git checkout -b feature/allocation-engine
```

### Commit Convention

Fundora follows Conventional Commits.

Format:

```text
type(scope): description
```

Examples:

```text
feat(allocation): implement percentage calculations

feat(categories): add category management

fix(allocation): handle monetary rounding

test(allocation): add calculator unit tests

refactor(income): separate repository logic

docs(readme): update project documentation
```

### Pull Requests

All feature branches should be reviewed before merging into `main`.

Before submitting a pull request, run:

```bash
dart format .
flutter analyze
flutter test
```

---

## Testing

Fundora uses Flutter's testing framework to maintain code quality and ensure reliable financial calculations.

Testing priorities include:

- Allocation calculation accuracy.
- Percentage validation.
- Monetary rounding.
- Repository operations.
- Historical allocation integrity.
- Provider state management.
- Widget interactions.

Run tests using:

```bash
flutter test
```

Run static analysis using:

```bash
flutter analyze
```

---

## Project Roadmap

Fundora is being developed incrementally.

### Phase 1 — Foundation
- [ ] Flutter project setup.
- [ ] Feature-first architecture.
- [ ] Provider configuration.
- [ ] Hive CE integration.
- [ ] Application theme and navigation.

### Phase 2 — Category Management
- [ ] Create categories.
- [ ] Edit categories.
- [ ] Delete categories.
- [ ] Custom percentage allocation.
- [ ] Category persistence.

### Phase 3 — Allocation Engine
- [ ] Income calculation service.
- [ ] Percentage validation.
- [ ] Monetary rounding.
- [ ] Unallocated balance calculation.
- [ ] Unit tests.

### Phase 4 — Income Allocation
- [ ] Income input.
- [ ] Weekly allocation.
- [ ] Monthly allocation.
- [ ] Allocation preview.
- [ ] Save allocation records.

### Phase 5 — Dashboard and History
- [ ] Dashboard overview.
- [ ] Allocation charts.
- [ ] Recent allocations.
- [ ] Historical allocation details.

### Phase 6 — Testing and Release
- [ ] Repository tests.
- [ ] Provider tests.
- [ ] Widget tests.
- [ ] Data persistence validation.
- [ ] Android release build.

---

## Contributing

Contributions, suggestions, and improvements are welcome.

If you would like to contribute:

1. Fork the repository.
2. Create a feature branch.
3. Implement your changes.
4. Add or update relevant tests.
5. Submit a pull request with a clear description.

Please follow the project's naming conventions and commit message standards.

---

## License

This project is currently under development. Licensing and distribution terms will be established before the first public release.

---

## Author

**Divine-David**

Flutter Developer

---

### Fundora

*Give Every Naira a Purpose.*