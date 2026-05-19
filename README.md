<!--
  Drop this file in: github.com/Shettymanyu/Smart-Parking-App-Flutter-App-And-IOT/README.md
  Your existing README is already strong; this is a tighter, recruiter-first version with badges, a clearer hero, and a short "what I built" framing.
-->

<h1 align="center">Smart Parking App &mdash; Flutter + IoT</h1>

<p align="center">
  <em>Cross-platform mobile app paired with Arduino sensors to show real-time parking-slot availability.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=dart&logoColor=white"/>
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=flat-square&logo=firebase&logoColor=black"/>
  <img src="https://img.shields.io/badge/Google%20Maps-4285F4?style=flat-square&logo=googlemaps&logoColor=white"/>
  <img src="https://img.shields.io/badge/Arduino-00979D?style=flat-square&logo=arduino&logoColor=white"/>
  <img src="https://img.shields.io/badge/GetX-8A2BE2?style=flat-square"/>
  <img src="https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-2E7D32?style=flat-square"/>
</p>

<p align="center">
  <a href="https://youtu.be/3mukGYjvixE?si=MhnM5dGtEfY931rl"><b>&#9654;&nbsp; Watch the demo on YouTube</b></a>
</p>

---

## What I built

A full-stack IoT product: ultrasonic sensors on an Arduino-class board detect whether each parking slot is occupied and push state to Firebase; the Flutter app reads that state and shows live availability on a Google Map, with auth, slot detail, and tutorial videos. Pubspec name: `car_parking_system`.

## Highlights

- **Real-time IoT &harr; cloud &harr; app loop** &mdash; Arduino &rarr; Firebase Realtime DB &rarr; Flutter listener
- **Cross-platform** Flutter build targets (Android, iOS, web, desktop scaffolding present)
- **Auth** via Firebase email/password and Google Sign-In
- **Maps** integration showing parking lots and slot status pins
- **Polished UI** with Lottie animations, custom Poppins font, SVG iconography
- **State management** with GetX (controllers, routing, dependency injection)

## Tech stack

- **Mobile:** Flutter, Dart, GetX
- **Backend / cloud:** Firebase Auth, Firestore, Realtime Database, Storage
- **Maps:** Google Maps SDK for Flutter
- **Media:** Lottie, flutter_svg, video_player, chewie
- **IoT:** Arduino/ESP firmware in `arduino/`, publishing to Firebase

## Screenshots

> Drop screenshots into `Assets/Photos/` and reference them here:

| Home | Map of slots | Auth |
| :---: | :---: | :---: |
| `Assets/Photos/home.png` | `Assets/Photos/map.png` | `Assets/Photos/auth.png` |

## Architecture at a glance

```
+----------------+      Wi-Fi push      +-------------------+     stream     +----------------+
|  Arduino /     |  ----------------->  |   Firebase RTDB   |  ----------->  |  Flutter app   |
|  ESP32 sensor  |                      |  /parking/slots   |                |  (GetX, Maps)  |
+----------------+                      +-------------------+                +----------------+
```

Data shape used by both ends:

```json
"parking/slots/{slotId}": {
  "occupied": true,
  "updatedAt": "2025-09-21T10:14:00Z"
}
```

## Getting started

### Prerequisites

- Flutter SDK 3.2+
- A Firebase project (Auth, Firestore, Realtime DB, Storage enabled)
- Google Maps API keys (Android + iOS)

### Run it

```bash
git clone https://github.com/Shettymanyu/Smart-Parking-App-Flutter-App-And-IOT.git
cd Smart-Parking-App-Flutter-App-And-IOT
flutter pub get

# Wire up Firebase
dart pub global activate flutterfire_cli
flutterfire configure

# Then
flutter run
```

Add your Google Maps API keys:

- **Android:** `android/app/src/main/AndroidManifest.xml`

  ```xml
  <meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_ANDROID_MAPS_API_KEY"/>
  ```

- **iOS:** `ios/Runner/Info.plist`

  ```xml
  <key>GMSApiKey</key>
  <string>YOUR_IOS_MAPS_API_KEY</string>
  ```

### IoT firmware

Open `arduino/` in Arduino IDE or PlatformIO, fill in your Wi-Fi credentials and Firebase database URL/key, flash to an ESP32/ESP8266, and confirm slot state appears in your RTDB console.

## Project structure

```
.
|-- lib/                 Flutter app source (screens, controllers, services)
|-- Assets/              Lottie, photos, icons, videos
|-- arduino/             Microcontroller sketches for slot sensors
|-- android/ ios/ web/ desktop/   Platform scaffolding
|-- pubspec.yaml         Dependencies, assets, fonts
|-- firebase.json        Firebase tooling config
`-- analysis_options.yaml
```

## Roadmap

- [ ] Slot reservation + payment flow
- [ ] Push notifications when a watched lot frees up
- [ ] Admin web dashboard for lot owners
- [ ] Move firmware to MQTT for lower bandwidth

## Author

Built by **Manyu Shetty** &mdash; <a href="https://github.com/Shettymanyu">@Shettymanyu</a> &middot; <a href="mailto:shettymanyu@gmail.com">shettymanyu@gmail.com</a>

If you found this useful, a star on the repo is appreciated.
