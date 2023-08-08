# AquaCard NFC
AquaCard NFC is a Flutter application that enables user authentication through reading NFC cards and verifies their validity.

## About the Project
AquaCard NFC is a mobile application that allows users to log in by reading their NFC cards.
The application performs authentication of NFC cards and checks their validity. 
If the correct card is read, the screen turns green; otherwise, it displays a red alert. After 10 seconds, the screen returns to grey.

## Used Libraries
The following libraries are used in the application:

- [nfc_manager](https://pub.dev/packages/nfc_manager)
- [http](https://pub.dev/packages/http)

## Installation
Follow the steps below to set up the project in your local development environment:

1. Clone the project: `git clone https://github.com/YOUR_USERNAME/AquaCard-NFC.git`
2. Install dependencies: `flutter pub get`
3. ...

## Usage
To use the AquaCard NFC application, follow these steps:

1. Launch the application: `flutter run`
2. Enter your username and password.
3. Hold your NFC card against the back of your device.
4. If the card is verified, the screen will turn green; otherwise, it will display red and return to grey after 10 seconds.
5. ...

## Screenshots
Here are some screenshots of the application:

<img src="/assets/loginScreen.png" height="400" alt="Screenshot"/>  
<img src="/assets/aquaCard-default.png" height="400" alt="Screenshot"/>  
<img src="/assets/aquaCard-green.png" height="400" alt="Screenshot"/>  
<img src="/assets/aquaCard-red.png" height="400" alt="Screenshot"/>

## License

This project is licensed under the [MIT License](LICENSE).
