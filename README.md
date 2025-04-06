## About
**Cafe Curator** is an Android application designed using the `Flutter` framework for coffee enthusiasts to save and manage their coffee preferences. Users can easily log their coffee strength and amount of sugar, creating a personalized coffee diary.

## Objective
The primary objective of this project is to learn and implement key concepts in `UI design` and `Firebase` integration. This includes:
- **UI Design**: Developing a user-friendly and visually appealing interface that enhances user experience.
- **Firebase Core**: Understanding the fundamentals of Firebase as a backend service for mobile applications.
- **Firebase Authentication**: Implementing user authentication to allow users to securely log in and manage their coffee preferences.
- **Firebase Cloud Firestore**: Utilizing Firestore to store and retrieve user data, ensuring that coffee preferences are saved and accessible across devices.

## Demo
You can download the APK file to install the application on your Android device:
> This will require **granting permission** to *install apps from unknown sources*

[**Download APK**](https://github.com/Swarnotaj003/Cafe-Curator/releases/download/v1.0/app-release.apk)

## App Preview
Sign in | Register | Home screen
--------|----------|------------
![image](https://github.com/user-attachments/assets/102c4df9-829e-4673-b328-0f6195a3a3f9) | ![image](https://github.com/user-attachments/assets/641a641f-be71-4d3f-8262-606a224286bb) | ![image](https://github.com/user-attachments/assets/0104217b-1496-4273-bf82-949cc1acd7be)

## Getting Started

To run this project locally, follow these steps:

### Prerequisites

- Flutter SDK installed on your device
- An IDE like Android Studio or VS Code
- An Android emulator or a physical device for testing

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/Swarnotaj003/Cafe-Curator.git
    cd cafe_curator
    ```
2. Install the dependencies:
    ```bash
    flutter pub get
    ```
3. Set up Firebase:
    - Create a Firebase project in the Firebase Console.
    - Add your Android app to the Firebase project and download the google-services.json file.
    - Place the google-services.json file in the android/app directory.

4. Configure your app:
    - Update the necessary configurations in android/app/build.gradle and android/build.gradle as per Firebase setup instructions.

5. Run the app:
    ```bash
    flutter run
