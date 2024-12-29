# Zhakir

**Zhakir** is a comprehensive religious application that allows users to recite the Qur’an and hadith, 
watch and listen to religious sermons, and read religious books. 
It is built using Flutter with the MVVM architecture pattern, 
leveraging Cubit for state management.

## Table of Contents
- [Features](#features)
- [Folder Structure](#folder-structure)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Contact](#contact)

---
## App Screenshot

<img src="https://github.com/user-attachments/assets/c012f645-a425-43ca-9b3e-0667551a7f32" alt="Splash Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/91c7016e-a6d6-4855-8304-a2c678affecc" alt="Splash Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/0b357596-2a99-4e36-a97f-247f6b55f424" alt="Onboarding Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/456bffe3-7125-4b38-880c-5f9919104daa" alt="Authentication Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/9e19f12e-99aa-4c3e-8114-023f17b093ea" alt="Home Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/f95936a4-bc21-407c-bb31-73a8d46e203b" alt="Sermons Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/e0e64b71-1a23-4e81-9c4c-5ee4ab69f26a" alt="Qur'an Recitation Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/75428da9-2786-40d6-add6-ae11c668adc8" alt="Hadith Screen" width="300" height="450">
<img src="https://github.com/user-attachments/assets/8984035f-d332-425c-9317-c6f3dd1b142e" alt="Book Library Screen" width="300" height="450">

## Features
- **Qur’an Recitation**: Read and recite the Holy Qur’an.
- **Hadith Access**: Explore collections of hadiths.
- **Religious Sermons**: Watch and listen to inspiring sermons.
- **Religious Books**: Access a library of religious books.

---

## Folder Structure
The project follows a modular structure with separation of concerns:

```
lib/
├── core
│   ├── helpers
│   ├── utils
│   ├── widgets
├── features
│   ├── splash
│   ├── on_bording
│   ├── auth
│   ├── home
│       ├── data
│       │   ├── models
│       │   ├── repository
│       ├── presentation
│           ├── manager
│           ├── views
```

### Core
- **Helpers**: Contains utility classes and functions used across the app.
- **Utils**: Provides constants, enums, and reusable configurations.
- **Widgets**: Houses common reusable widgets.

### Features
Each feature is divided into submodules:
- **Splash**: Handles the app's splash screen.
- **Onboarding**: Manages the onboarding flow for new users.
- **Auth**: Authentication-related functionality (e.g., login, registration).
- **Home**: Core features of the application.
  - **Data**: Includes models and repositories for handling data.
  - **Presentation**: Manages state (via Cubit) and views (UI).

---

## Technologies Used
- **Flutter**: Cross-platform mobile app framework.
- **Cubit**: Lightweight state management solution.
- **MVVM**: Model-View-ViewModel architecture.

---

## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart 3.0+
- A code editor such as [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/mohammed266/owli_aleazm.git
   ```

2. Navigate to the project directory:
   ```bash
   cd owli_aleazm
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

---

## Contact
For questions, feedback, or collaboration, feel free to reach out:
- **Email**: mohammed.abduu2020@gmail.com

