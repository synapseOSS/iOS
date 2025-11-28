# Implementation Tasks - Synapse iOS Milestone 1

## 1. Project Setup
- [x] Create Xcode project structure
- [x] Configure Swift Package Manager dependencies
- [x] Set up folder structure per specification
- [x] Configure `.gitignore` for iOS development
- [x] Create environment configuration (xcconfig example)

## 2. Core Services
- [x] Implement `SupabaseManager.swift` singleton
- [x] Implement `AuthService.swift` with auth methods
- [x] Implement `NetworkMonitor.swift` for connectivity
- [x] Create `AppConstants.swift` for env-based config

## 3. Data Models
- [x] Create `User.swift` with Codable conformance
- [x] Create `Post.swift` with Codable conformance
- [x] Create `Story.swift` with MediaType enum
- [x] Create `Comment.swift` with Codable conformance

## 4. Authentication Feature
- [x] Implement `AuthViewModel.swift` with state management
- [x] Create `LoginView.swift` with email/password fields
- [x] Create `RegisterView.swift` with validation
- [x] Create `ForgotPasswordView.swift` for password reset
- [x] Implement session persistence and auto-login

## 5. Home Feed Feature
- [x] Implement `HomeViewModel.swift` for post fetching
- [x] Create `HomeView.swift` with post list
- [x] Create `PostCardView.swift` for post display
- [x] Add pull-to-refresh capability
- [x] Handle loading/error/empty states

## 6. Utilities & Extensions
- [x] Create `KeychainHelper.swift` for secure storage
- [x] Create `View+Extensions.swift`
- [x] Create `Date+Extensions.swift` with timeAgo formatter

## 7. Profile Feature (Skeleton)
- [x] Create `ProfileView.swift` placeholder

## 8. App Entry Point
- [x] Create `SynapseApp.swift` with auth state routing
- [x] Wire up environment objects

## 9. Documentation
- [x] Update README.md with setup instructions
- [ ] Add inline code comments for complex logic

## Remaining Work
- [ ] Create actual Xcode project file (.xcodeproj)
- [ ] Add Assets.xcassets with app icons
- [ ] Configure Info.plist with xcconfig variables
- [ ] Test on iOS Simulator
- [ ] Connect to actual Supabase instance
