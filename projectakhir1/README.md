# Project Akhir 1: Freshness Scanner for Fish and Vegetables

## Overview
Project Akhir 1 is a Flutter application designed to scan and determine the freshness level of fish and vegetables. The app utilizes machine learning and image processing to analyze images taken by users and provide results regarding the freshness of the scanned items.

## Features
- User authentication (login and registration)
- Image scanning for fish and vegetables
- Display of scan results with confidence levels
- User profile management
- History of scanned items

## Project Structure
```
projectakhir1
├── lib
│   ├── main.dart
│   ├── models
│   │   ├── fish.dart
│   │   ├── vegetable.dart
│   │   └── user.dart
│   ├── providers
│   │   ├── auth_provider.dart
│   │   ├── fish_provider.dart
│   │   └── vegetable_provider.dart
│   ├── screens
│   │   ├── auth
│   │   │   ├── login_screen.dart
│   │   │   └── register_screen.dart
│   │   ├── home_screen.dart
│   │   ├── scan
│   │   │   ├── scan_fish_screen.dart
│   │   │   └── scan_vegetable_screen.dart
│   │   ├── result
│   │   │   ├── fish_result_screen.dart
│   │   │   └── vegetable_result_screen.dart
│   │   └── profile_screen.dart
│   ├── widgets
│   │   ├── fish_card.dart
│   │   ├── vegetable_card.dart
│   │   └── custom_button.dart
│   ├── utils
│   │   ├── constants.dart
│   │   └── validators.dart
│   └── services
│       ├── api_service.dart
│       └── scan_service.dart
├── pubspec.yaml
└── README.md
```

## Setup Instructions
1. **Clone the repository**:
   ```
   git clone <repository-url>
   cd projectakhir1
   ```

2. **Install dependencies**:
   Run the following command in the terminal:
   ```
   flutter pub get
   ```

3. **Run the application**:
   Use the following command to start the app:
   ```
   flutter run
   ```

## Usage
- **Login/Register**: Users can create an account or log in to access the scanning features.
- **Scan Items**: Navigate to the scan screen to take pictures of fish or vegetables. The app will analyze the images and provide freshness results.
- **View Results**: After scanning, users can view the results, including confidence levels and other relevant details.
- **Profile Management**: Users can manage their profiles and view their scan history.

## Technologies Used
- Flutter
- Dart
- Provider for state management
- HTTP for API calls
- Shared Preferences for local storage

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.