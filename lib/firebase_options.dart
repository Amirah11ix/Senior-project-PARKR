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
/// 
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...


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
    apiKey: 'AIzaSyA18CwGqedTO7GN8GC0E06R_5G9hagFHTg',
    appId: '1:486443342284:web:f42769fad40b455828e569',
    messagingSenderId: '486443342284',
    projectId: 'parker-a7bad',
    authDomain: 'parker-a7bad.firebaseapp.com',
    databaseURL: 'https://parker-a7bad-default-rtdb.firebaseio.com',
    storageBucket: 'parker-a7bad.appspot.com',
    measurementId: 'G-864S42FEN5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIZ85vpc-c4A9eHJ0263Y4afrBQ938mEU',
    appId: '1:486443342284:android:f6acc4521523199b28e569',
    messagingSenderId: '486443342284',
    projectId: 'parker-a7bad',
    databaseURL: 'https://parker-a7bad-default-rtdb.firebaseio.com',
    storageBucket: 'parker-a7bad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYxvGdQFMGWg_5DxWhGZlR3dRgKfJ1Bac',
    appId: '1:486443342284:ios:2a60f8732648d07928e569',
    messagingSenderId: '486443342284',
    projectId: 'parker-a7bad',
    databaseURL: 'https://parker-a7bad-default-rtdb.firebaseio.com',
    storageBucket: 'parker-a7bad.appspot.com',
    iosBundleId: 'com.example.smartCarParking',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYxvGdQFMGWg_5DxWhGZlR3dRgKfJ1Bac',
    appId: '1:486443342284:ios:2a60f8732648d07928e569',
    messagingSenderId: '486443342284',
    projectId: 'parker-a7bad',
    databaseURL: 'https://parker-a7bad-default-rtdb.firebaseio.com',
    storageBucket: 'parker-a7bad.appspot.com',
    iosBundleId: 'com.example.smartCarParking',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA18CwGqedTO7GN8GC0E06R_5G9hagFHTg',
    appId: '1:486443342284:web:b2c76e83d8e3be3d28e569',
    messagingSenderId: '486443342284',
    projectId: 'parker-a7bad',
    authDomain: 'parker-a7bad.firebaseapp.com',
    databaseURL: 'https://parker-a7bad-default-rtdb.firebaseio.com',
    storageBucket: 'parker-a7bad.appspot.com',
    measurementId: 'G-JVHZMFGG32',
  );
}
