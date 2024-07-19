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
    apiKey: 'AIzaSyCj81lYQwk3JT6kZj4WKMvIoLzsbsuVFpw',
    appId: '1:759933188988:web:31ca2dc850e4672d4b82f9',
    messagingSenderId: '759933188988',
    projectId: 'chat-app-7352f',
    authDomain: 'chat-app-7352f.firebaseapp.com',
    storageBucket: 'chat-app-7352f.appspot.com',
    measurementId: 'G-517ZFT0DY6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXqkVZlNtyJ-C1hIGShJXQygJrUNqA7ts',
    appId: '1:759933188988:android:7771b6a8a43f550e4b82f9',
    messagingSenderId: '759933188988',
    projectId: 'chat-app-7352f',
    storageBucket: 'chat-app-7352f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdFmo05FeL4qoCrt0ER7lG_VJA6frGlUk',
    appId: '1:759933188988:ios:aa5e6a6a0e59eb7b4b82f9',
    messagingSenderId: '759933188988',
    projectId: 'chat-app-7352f',
    storageBucket: 'chat-app-7352f.appspot.com',
    iosBundleId: 'com.example.email',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdFmo05FeL4qoCrt0ER7lG_VJA6frGlUk',
    appId: '1:759933188988:ios:8f348a157164a45e4b82f9',
    messagingSenderId: '759933188988',
    projectId: 'chat-app-7352f',
    storageBucket: 'chat-app-7352f.appspot.com',
    iosBundleId: 'com.example.email.RunnerTests',
  );
}
