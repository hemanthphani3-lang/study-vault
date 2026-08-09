# StudyVault 🌌
> **Knowledge Beyond Borders** — Open Source Cross-Platform Academic Knowledge Network

[![Flutter](https://img.shields.io/badge/Flutter-v3.16+-02569B?logo=flutter)](https://flutter.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20%2B%20Feature--First-8B7DFF)](https://github.com)
[![State Management](https://img.shields.io/badge/State-Riverpod-63F2E8)](https://riverpod.dev)
[![Persistence](https://img.shields.io/badge/Database-Drift%20SQLite-62FFB5)](https://drift.simonbinder.eu)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

---

## 📖 Vision & Overview

**StudyVault** is a decentralized academic knowledge network engineered for students, researchers, and universities. It empowers learners to discover educational resources from verified academic sources and securely distribute and sync them across a peer-to-peer network.

- **Sprint 1 (Version 0.1.0-alpha)**: Production-grade Flutter mobile foundation, design system tokens, GoRouter navigation with central search shell, Drift SQLite scaffolding, Riverpod state foundation, and reusable UI components.
- **Future Milestones**: P2P Networking (`libp2p`), IPFS storage integration, Security Gateway, and FastAPI tracker services.

---

## 🎨 Design System & Color Palette

| Token | Hex Value | Role |
|---|---|---|
| **Background** | `#050816` | Deep space canvas |
| **Surface** | `#12182E` | Navigation bars, app bar, elevated panels |
| **Card** | `#1B2340` | Interactive card containers & glass backdrops |
| **Primary** | `#8B7DFF` | Futuristic violet primary brand / CTA |
| **Secondary** | `#63F2E8` | Neon cyan accent / peer highlights |
| **Success** | `#62FFB5` | Mint green verification & active nodes |
| **Warning** | `#FFD98A` | Amber notice & sync warnings |
| **Error** | `#FF6B81` | Coral red error & peer alerts |
| **Text Primary** | `#F8FAFC` | Crisp slate white high-contrast text |
| **Text Secondary**| `#AAB3D0` | Slate blue secondary text |
| **Hint** | `#6B7394` | Muted placeholder & inactive icons |

### Typography
- **Headings (Display, Headline, Title)**: `Space Grotesk` (Google Fonts)
- **Body & Labels (Body, Label, Caption)**: `Inter` (Google Fonts)

---

## 📂 Project Architecture

```
lib/
├── app/
│   ├── app.dart               # Root MaterialApp.router with Riverpod & Theme
│   └── router.dart            # GoRouter with StatefulShellRoute (5 tabs)
├── core/
│   ├── constants/             # App, Asset, and Route constants
│   ├── theme/                 # AppColors, Typography, Spacing, Radius, Theme
│   ├── widgets/               # PrimaryButton, GlassCard, AppSearchBar, Badges, etc.
│   ├── extensions/            # Context, String, Number extensions
│   ├── services/              # Drift Database & Logger services
│   ├── animations/            # FadeSlide & Pulse micro-animations
│   └── utils/                 # Functional Result<T, E> error handling
├── features/
│   ├── splash/                # Animated branding entrance
│   ├── home/                  # Network stats, quick actions, peer overview
│   ├── search/                # Deep academic resource discovery
│   ├── network/               # P2P mesh status, peer nodes, bandwidth
│   ├── library/               # Offline saved papers, datasets, books
│   └── settings/              # Storage, privacy, relay nodes & theme
├── shared/
│   ├── enums/                 # NetworkStatus, ResourceType, VerificationTier
│   ├── models/                # ResourcePreview, PeerNode, UserProfile
│   └── helpers/               # Formatters & Validators
└── main.dart                  # Production entry point
```

---

## 🚀 Getting Started

```bash
# Get dependencies
flutter pub get

# Run on emulator/device
flutter run
```
