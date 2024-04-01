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
    apiKey: 'AIzaSyBEJMeFAxYrUwbWDkzhMcczXLFv_ne06r0',
    appId: '1:458931646485:web:98a583294d026dbee91e1c',
    messagingSenderId: '458931646485',
    projectId: 'netflix-42e6e',
    authDomain: 'netflix-42e6e.firebaseapp.com',
    storageBucket: 'netflix-42e6e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9QY9uex0bA9Ys91FzDldGbPB1uow5kSc',
    appId: '1:458931646485:android:0fbaf5e300ffb6cfe91e1c',
    messagingSenderId: '458931646485',
    projectId: 'netflix-42e6e',
    storageBucket: 'netflix-42e6e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMHiXrwnl5FvxBJp-jPD6OTNZnR3PX4nI',
    appId: '1:458931646485:ios:001a4f6f863deaebe91e1c',
    messagingSenderId: '458931646485',
    projectId: 'netflix-42e6e',
    storageBucket: 'netflix-42e6e.appspot.com',
    iosBundleId: 'com.example.netflix',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBMHiXrwnl5FvxBJp-jPD6OTNZnR3PX4nI',
    appId: '1:458931646485:ios:d09ec746fa39eef7e91e1c',
    messagingSenderId: '458931646485',
    projectId: 'netflix-42e6e',
    storageBucket: 'netflix-42e6e.appspot.com',
    iosBundleId: 'com.example.netflix.RunnerTests',
  );
}