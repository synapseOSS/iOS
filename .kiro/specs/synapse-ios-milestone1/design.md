# Technical Design - Synapse iOS Milestone 1

## Architecture Overview

### MVVM Pattern
```
View (SwiftUI) → ViewModel (@MainActor ObservableObject) → Service → SupabaseManager
```

### Project Structure
```
Synapse/
├── App/                    # Entry point
├── Core/
│   ├── Services/           # SupabaseManager, AuthService, NetworkMonitor
│   ├── Extensions/         # View+, Date+ extensions
│   └── Constants/          # AppConstants (env-based config)
├── Models/                 # User, Post, Story, Comment
├── Features/
│   ├── Authentication/     # Login, Register, ForgotPassword
│   ├── Home/               # Feed, PostCard
│   └── Profile/            # User profile
├── Utilities/              # KeychainHelper
└── Resources/              # Assets, xcconfig
```

## Core Components

### 1. SupabaseManager (Singleton)
- Initializes SupabaseClient with env-based credentials
- Exposes `auth` and `database` clients
- Single source of truth for Supabase operations

### 2. AuthService
- `signUp(email:password:)` → User
- `signIn(email:password:)` → User
- `signOut()`
- `resetPassword(email:)`
- `getCurrentSession()` → Session?

### 3. AuthViewModel
- Published state: `isAuthenticated`, `currentUser`, `isLoading`, `errorMessage`
- Handles auth flow and session persistence
- Auto-login via `checkSession()` on app launch

### 4. HomeViewModel
- Fetches posts from Supabase with user relations
- Handles loading/error states
- Pull-to-refresh support

## Data Models

### User
| Field | Type | Notes |
|-------|------|-------|
| id | UUID | Primary key |
| email | String | Required |
| username | String | Required |
| displayName | String? | Optional |
| avatarUrl | String? | Optional |
| bio | String? | Optional |
| createdAt | Date | Auto |
| updatedAt | Date | Auto |

### Post
| Field | Type | Notes |
|-------|------|-------|
| id | UUID | Primary key |
| userId | UUID | Foreign key |
| content | String | Required |
| imageUrls | [String]? | Optional |
| likesCount | Int | Default 0 |
| commentsCount | Int | Default 0 |
| createdAt | Date | Auto |
| updatedAt | Date | Auto |
| user | User? | Relation |

### Story
| Field | Type | Notes |
|-------|------|-------|
| id | UUID | Primary key |
| userId | UUID | Foreign key |
| mediaUrl | String | Required |
| mediaType | MediaType | image/video |
| expiresAt | Date | 24h expiry |
| createdAt | Date | Auto |

## Security Considerations
- Credentials stored in `.xcconfig` (gitignored)
- Session tokens managed by Supabase SDK
- KeychainHelper available for secure storage
- No hardcoded secrets in codebase

## Dependencies
| Package | Version | Purpose |
|---------|---------|---------|
| supabase-swift | 2.0.0+ | Backend client |
| Nuke | 12.0.0+ | Image loading |
