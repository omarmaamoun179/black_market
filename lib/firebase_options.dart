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
    apiKey: 'AIzaSyD8ylw4Mdmst1ZcLzyKlNvNF_yJOAuRiFI',
    appId: '1:323353103679:web:811e02fec3caaf8589178a',
    messagingSenderId: '323353103679',
    projectId: 'blackmarket-c0c2a',
    authDomain: 'blackmarket-c0c2a.firebaseapp.com',
    storageBucket: 'blackmarket-c0c2a.appspot.com',
    measurementId: 'G-E84XEQFW2J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBC7pxIlxAxMpE4LPQl4Mn1AD472prjm-g',
    appId: '1:323353103679:android:9a2824ebe0fe05f289178a',
    messagingSenderId: '323353103679',
    projectId: 'blackmarket-c0c2a',
    storageBucket: 'blackmarket-c0c2a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXCgaRScqs-y5KEjB6ZbJmxi_HLT-cBGo',
    appId: '1:323353103679:ios:5e647b0bb09b532489178a',
    messagingSenderId: '323353103679',
    projectId: 'blackmarket-c0c2a',
    storageBucket: 'blackmarket-c0c2a.appspot.com',
    iosBundleId: 'com.example.blackMarket',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCXCgaRScqs-y5KEjB6ZbJmxi_HLT-cBGo',
    appId: '1:323353103679:ios:747abb78d11ae1e089178a',
    messagingSenderId: '323353103679',
    projectId: 'blackmarket-c0c2a',
    storageBucket: 'blackmarket-c0c2a.appspot.com',
    iosBundleId: 'com.example.blackMarket.RunnerTests',
  );
}
