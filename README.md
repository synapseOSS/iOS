# Synapse iOS

iOS client for Synapse social platform built with SwiftUI and Supabase.

## Features
- User authentication (sign up, login, password recovery)
- Real-time messaging and notifications
- Profile management with avatar uploads
- Social feed with posts and interactions
- Image caching and optimized loading

## Requirements
- iOS 16+
- Xcode 15+
- Swift 5.9+

## Setup

### 1. Clone the repository
```bash
git clone <repository-url>
cd iOS
```

### 2. Configure Supabase
```bash
cp Synapse/Resources/Debug.xcconfig.example Synapse/Resources/Debug.xcconfig
```

Edit `Debug.xcconfig` and add your credentials:
```
SUPABASE_URL = your_supabase_url
SUPABASE_ANON_KEY = your_supabase_anon_key
```

### 3. Build and run
Open `Synapse.xcodeproj` in Xcode and build (⌘+R)

## Architecture
- **Pattern**: MVVM (Model-View-ViewModel)
- **UI**: SwiftUI
- **Backend**: Supabase
  - Auth: User authentication
  - Database: PostgreSQL with real-time subscriptions
  - Storage: File uploads (avatars, media)
  - Realtime: Live updates and messaging

## Dependencies
- [supabase-swift](https://github.com/supabase/supabase-swift) - Supabase client library
- [Nuke](https://github.com/kean/Nuke) - Async image loading and caching

## Project Structure
```
Synapse/
├── Models/          # Data models
├── Views/           # SwiftUI views
├── ViewModels/      # Business logic
├── Services/        # API and Supabase services
└── Resources/       # Config files and assets
```

## Contributing
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push and open a pull request

## License
[Add your license here]
