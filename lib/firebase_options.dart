// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDWZ9H6-LyPEpJR8nCKsLBZ1qi6FxTeEB8',
    appId: '1:684151425038:web:cdb50f0ca138d3cf72145f',
    messagingSenderId: '684151425038',
    projectId: 'e-commerce-72187',
    authDomain: 'e-commerce-72187.firebaseapp.com',
    storageBucket: 'e-commerce-72187.appspot.com',
    measurementId: 'G-PZVS9BPNZC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxNnttRA73dyhImrYbuA2cdmfTtF-4_MA',
    appId: '1:684151425038:android:30b71977874ee0cf72145f',
    messagingSenderId: '684151425038',
    projectId: 'e-commerce-72187',
    storageBucket: 'e-commerce-72187.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUBaRK42maxnSq8j1SGGEwZhCtskqPRJ4',
    appId: '1:684151425038:ios:69fb0686c5de1b8172145f',
    messagingSenderId: '684151425038',
    projectId: 'e-commerce-72187',
    storageBucket: 'e-commerce-72187.appspot.com',
    androidClientId:
        '684151425038-fubnkncp7695a0fdfdnda6saquvns756.apps.googleusercontent.com',
    iosClientId:
        '684151425038-5k575ekdulncb62am6n425bt4rdsssoc.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCUBaRK42maxnSq8j1SGGEwZhCtskqPRJ4',
    appId: '1:684151425038:ios:8c96a19bbd0ec8ed72145f',
    messagingSenderId: '684151425038',
    projectId: 'e-commerce-72187',
    storageBucket: 'e-commerce-72187.appspot.com',
    androidClientId:
        '684151425038-fubnkncp7695a0fdfdnda6saquvns756.apps.googleusercontent.com',
    iosClientId:
        '684151425038-i32o98c64330vqi2q3vcp0ioc8qe55fi.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce.RunnerTests',
  );
}
