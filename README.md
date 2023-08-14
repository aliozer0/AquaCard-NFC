# AquaCard NFC
AquaCard NFC is a Flutter application that enables user authentication through reading NFC cards and verifies their validity.

## About the Project
AquaCard NFC is a mobile application that allows users to log in by reading their NFC cards.
The application performs authentication of NFC cards and checks their validity. 
If the correct card is read, the screen turns green; otherwise, it displays a red alert. After 10 seconds, the screen returns to grey.

## Screenshots
Here are some screenshots of the application:

<img src="/assets/loginScreen.png" height="400" alt="Screenshot"/>  <img src="/assets/image/NfcDefault.png" height="400" alt="Screenshot"/>  <img src="/assets/image/NfcSuccess.png" height="400" alt="Screenshot"/>  <img src="/assets/image/NfcCancel.png" height="400" alt="Screenshot"/>

## Used Libraries
The following libraries are used in the application:

- [nfc_manager](https://pub.dev/packages/nfc_manager)
- [http](https://pub.dev/packages/http)

## Installation
Follow the steps below to set up the project in your local development environment:

1. Clone the project: `git clone https://github.com/aliozer0/AquaCard-NFC.git`
2. Install dependencies: `flutter pub get`

## Usage

To use AquaCard NFC:

1. Launch the application: `flutter run`
2. Enter your credentials.
3. Hold your NFC card against the back of your device.
4. The screen changes color based on card verification.
5. HTTP POST requests handle data exchange with the server.
