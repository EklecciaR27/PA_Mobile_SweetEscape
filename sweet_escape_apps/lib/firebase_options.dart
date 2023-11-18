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
    apiKey: 'AIzaSyCqHUg6RhomecD0yL99hvOd68oQcm8bfe0',
    appId: '1:1079109317565:web:8cc9ae92ca0072ad9ad8d4',
    messagingSenderId: '1079109317565',
    projectId: 'papemo-7bff6',
    authDomain: 'papemo-7bff6.firebaseapp.com',
    storageBucket: 'papemo-7bff6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHW1gKHQLV4RBvrzl21l2J9BzZEcmtX84',
    appId: '1:1079109317565:android:96577cc402e91ea79ad8d4',
    messagingSenderId: '1079109317565',
    projectId: 'papemo-7bff6',
    storageBucket: 'papemo-7bff6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCyqZ3lUn7re_KnyS3ytcljM2YcS0saFqo',
    appId: '1:1079109317565:ios:0859c71e67cd063c9ad8d4',
    messagingSenderId: '1079109317565',
    projectId: 'papemo-7bff6',
    storageBucket: 'papemo-7bff6.appspot.com',
    iosBundleId: 'com.example.sweetEscapeApps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCyqZ3lUn7re_KnyS3ytcljM2YcS0saFqo',
    appId: '1:1079109317565:ios:cc78a437e83641cb9ad8d4',
    messagingSenderId: '1079109317565',
    projectId: 'papemo-7bff6',
    storageBucket: 'papemo-7bff6.appspot.com',
    iosBundleId: 'com.example.sweetEscapeApps.RunnerTests',
  );
}
