# E-Commerce App

A modern e-commerce mobile application built with Flutter. This app provides a seamless shopping experience with features like product browsing, category filtering, shopping cart management, and more.

## Features

- Browse products by categories
- View detailed product information
- Add/remove items to cart
- Manage shopping cart
- Responsive design for both iOS and Android

## Technologies Used

- Flutter
- Dart
- Provider (State Management)
- REST API Integration

## Screenshots

| ![Home Screen](/screenshots/screenshot_01.png) | ![Shopping Cart](/screenshots/screenshot_02.png) |
| :--------------------------------------------: | :----------------------------------------------: |
|                  Home Screen                   |                  Shopping Cart                   |

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- iOS Simulator (for Mac users) or Android Emulator

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/ecommerce_app.git
```

2. Navigate to the project directory:

```bash
cd ecommerce_app
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

## Project Structure

```
lib/
├── models/      # Data models
├── providers/   # State management
├── screens/     # UI screens
└── services/    # API services
```

## GitHub Actions Configuration

### Android Signing Setup

1. Generate a keystore file if you haven't already:

```bash
keytool -genkey -v -keystore android/app/keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

2. Convert your keystore file to base64:

```bash
base64 android/app/keystore.jks
```

3. Add the following secrets to your GitHub repository (Settings > Secrets and variables > Actions):

- `KEYSTORE_BASE64`: Your base64-encoded keystore file
- `KEY_ALIAS`: The alias used when creating the keystore
- `STORE_PASSWORD`: The keystore password
- `KEY_PASSWORD`: The key password

### iOS Signing Setup

1. Convert your iOS distribution certificate to base64:

```bash
base64 distribution_certificate.p12
```

2. Convert your provisioning profile to base64:

```bash
base64 provisioning_profile.mobileprovision
```

3. Add the following secrets to your GitHub repository:

- `BUILD_CERTIFICATE_BASE64`: Your base64-encoded distribution certificate (.p12)
- `P12_PASSWORD`: The password for your .p12 file
- `BUILD_PROVISION_PROFILE_BASE64`: Your base64-encoded provisioning profile
- `KEYCHAIN_PASSWORD`: Any string to use as temporary keychain password

4. Update `ios/exportOptions.plist` with your team and provisioning profile details:

- Replace `YOUR_TEAM_ID` with your Apple Developer Team ID
- Replace `YOUR_PROVISIONING_PROFILE_NAME` with your profile name
- Update the bundle identifier if different from `com.example.ecommerce_app`

### Workflow Details

The GitHub Actions workflows will automatically:

- Build on every push to the main branch and pull requests
- Create signed APK and AAB files for Android
- Create a signed IPA file for iOS
- Upload build artifacts that can be downloaded from the Actions tab

You can find the workflow configurations in:

- `.github/workflows/android_build.yml`
- `.github/workflows/ios_build.yml`

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
