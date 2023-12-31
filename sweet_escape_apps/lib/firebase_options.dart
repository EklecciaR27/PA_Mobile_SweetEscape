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
    apiKey: 'AIzaSyAdOUuQ-TF4el44Uf8uxTPMT-mqR5t6ncI',
    appId: '1:960107140411:web:4c9c9e592635889dc1d31e',
    messagingSenderId: '960107140411',
    projectId: 'sweetescape-e13b6',
    authDomain: 'sweetescape-e13b6.firebaseapp.com',
    storageBucket: 'sweetescape-e13b6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASd1Zm2XhPjy5wb89c5jwddVMoiyHL21c',
    appId: '1:960107140411:android:96423f3e12c9dc91c1d31e',
    messagingSenderId: '960107140411',
    projectId: 'sweetescape-e13b6',
    storageBucket: 'sweetescape-e13b6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEN_Gxwaz7L_ymqQ_0zmgHElkNfiGQ4BE',
    appId: '1:960107140411:ios:65026de1b6a42163c1d31e',
    messagingSenderId: '960107140411',
    projectId: 'sweetescape-e13b6',
    storageBucket: 'sweetescape-e13b6.appspot.com',
    iosBundleId: 'com.example.sweetEscapeApps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEN_Gxwaz7L_ymqQ_0zmgHElkNfiGQ4BE',
    appId: '1:960107140411:ios:6fe3b2b17979371bc1d31e',
    messagingSenderId: '960107140411',
    projectId: 'sweetescape-e13b6',
    storageBucket: 'sweetescape-e13b6.appspot.com',
    iosBundleId: 'com.example.sweetEscapeApps.RunnerTests',
  );
}
