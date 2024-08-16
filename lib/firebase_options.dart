// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'jkbZ2bVMjs6jQwY-AIzaSyBCd8H4WYiNhRkLTOY',
    appId: '1:749499558695:web:45d1c44d88b7bda77cd702',
    messagingSenderId: '749499558695',
    projectId: 'back-91009',
    authDomain: 'back-91009.firebaseapp.com',
    storageBucket: 'back-91009.appspot.com',
    measurementId: 'G-44S8RS12ML',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPxf4v-zECcFti7quQreSGXQY-rUjSXzM',
    appId: '1:749499558695:android:d63fc2e0a4ede9f87cd702',
    messagingSenderId: '749499558695',
    projectId: 'back-91009',
    storageBucket: 'back-91009.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-Y-jv4zjYfE9y6ZB-Hh2yT7y1Ve1LR0Q',
    appId: '1:489759883476:ios:bf7a4e0c61c574a723fb41',
    messagingSenderId: '489759883476',
    projectId: 'back-f4e66',
    storageBucket: 'back-f4e66.appspot.com',
    iosBundleId: 'com.example.back',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-Hh2yAIzaSyBCd8H4WYiT7y1Ve1LR0Q',
    appId: '1:489759883476:ios:bf7a4e0c61c574a723fb41',
    messagingSenderId: '489759883476',
    projectId: 'back-f4e66',
    storageBucket: 'back-f4e66.appspot.com',
    iosBundleId: 'com.example.back',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBCd8H4-WYHh2yT7y1Ve1LR0Qi',
    appId: '1:749499558695:web:b44c5c04983c18747cd702',
    messagingSenderId: '749499558695',
    projectId: 'back-91009',
    authDomain: 'back-91009.firebaseapp.com',
    storageBucket: 'back-91009.appspot.com',
    measurementId: 'G-FNPEVHJBLY',
  );

}
