# Smart Parking App — Flutter + IoT
Project name (pubspec): `car_parking_system`

A cross-platform Flutter application paired with an Arduino-based IoT setup to monitor and display real-time parking slot availability. The app integrates Firebase for backend services and Google Maps for location and navigation, with a clean UI enhanced by Lottie animations and custom fonts.

Demo video:
https://youtu.be/3mukGYjvixE?si=MhnM5dGtEfY931rl

## Features
- Firebase Authentication (email/password and Google Sign-In)
- Real-time data with Firebase (Firestore and Realtime Database)
- Parking slots visualization on Google Maps
- Media support (Lottie animations, instructional videos)
- GetX for state management and routing
- Custom UI with SVG icons and Poppins font
- Deep links and external links via URL Launcher

## Tech Stack
- Flutter (Dart)
- GetX
- Firebase: Auth, Firestore, Realtime Database, Storage
- Google Maps SDK for Flutter
- Video Player + Chewie
- Lottie, flutter_svg, fluttertoast, uuid

## Project Structure
- `lib/` – Flutter application source (screens, controllers, services, widgets)
- `Assets/`
  - `animation/` – Lottie JSON animations
  - `Photos/` – Images and screenshots
  - `Icons/` – SVGs and icons
  - `video/` – Local demo/tutorial videos
- `arduino/` – Microcontroller sketches for the parking sensors/controller
- `android/`, `ios/`, `linux/`, `macos/`, `windows/`, `web/` – Platform scaffolding
- `pubspec.yaml` – Dependencies, assets, and fonts configuration
- `firebase.json` – Firebase-related configuration for tooling
- `analysis_options.yaml` – Lint rules

## Screenshots
Place screenshots under `Assets/Photos/` and reference them here, for example:
- Home screen
- Map with parking slots
- Authentication flow

## Getting Started

### Prerequisites
- Flutter SDK (3.2+ recommended)
- Dart SDK compatible with the Flutter version above
- A Firebase project (enable Auth, Firestore, Realtime Database, and Storage as needed)
- Google Maps API key (Android and iOS)

### 1) Clone and install
```bash
git clone https://github.com/Shettymanyu/Smart-Parking-App-Flutter-App-And-IOT.git
cd Smart-Parking-App-Flutter-App-And-IOT
flutter pub get
```

### 2) Configure Firebase (FlutterFire CLI)
If you haven’t installed FlutterFire CLI:
```bash
dart pub global activate flutterfire_cli
```
Then configure:
```bash
flutterfire configure
```
This will generate platform-specific Firebase configuration (e.g., `google-services.json` for Android and `GoogleService-Info.plist` for iOS). Ensure the selected Firebase project has the products you’re using (Auth, Firestore, Realtime Database, Storage).

### 3) Add Google Maps API keys
- Android: add your API key to `android/app/src/main/AndroidManifest.xml`:
```xml
<meta-data
  android:name="com.google.android.geo.API_KEY"
  android:value="YOUR_ANDROID_MAPS_API_KEY"/>
```
- iOS: add your API key to `ios/Runner/AppDelegate.swift` or `AppDelegate.m` (depending on template) or `Info.plist`:
```xml
<key>GMSApiKey</key>
<string>YOUR_IOS_MAPS_API_KEY</string>
```

### 4) Run
```bash
flutter run
```

## IoT Setup (arduino/)
- Open the sketches under `arduino/` in Arduino IDE or PlatformIO.
- Update Wi-Fi credentials and Firebase keys/endpoints within the sketch as required.
- Flash the code to your microcontroller (e.g., ESP8266/ESP32).
- The device should publish parking slot state changes to Firebase. Ensure the database paths match those used by the Flutter app.

Tip: Use consistent data paths and structure across app and device, e.g.:
```
/parking/slots/{slotId} -> { occupied: true/false, updatedAt: <timestamp> }
```

## Packages Used
- get (^4.6.6)
- firebase_core, firebase_auth, cloud_firestore, firebase_database, firebase_storage
- google_sign_in
- google_maps_flutter
- flutter_svg
- lottie
- video_player, chewie
- url_launcher
- fluttertoast
- uuid
- another_dashed_container
- Fonts: Poppins (Light/Regular/Medium/SemiBold/Bold)

See `pubspec.yaml` for exact versions and assets/fonts configuration.

## Development Notes
- Lints are configured in `analysis_options.yaml`
- Assets are declared in `pubspec.yaml` under `flutter/assets`
- Custom font family `Poppins` is configured in `pubspec.yaml`

## Roadmap Ideas
- Slot reservation and bookings
- Payment integration
- Push notifications (slot availability changes)
- Admin dashboard for slot management

## Contributing
Issues and PRs are welcome. Please follow conventional commit messages and run:
```bash
flutter analyze
flutter test
```
before submitting.

## Acknowledgements
- Flutter & Dart teams
- Firebase
- Google Maps Platform
- Open-source packages authors

---
If you use this project publicly, consider crediting “Smart Parking App — Flutter + IoT” in your README.
