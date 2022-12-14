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
    apiKey: 'AIzaSyAwfeunjn3SWOfYRPz5CbHJ9DsCey6iTPM',
    appId: '1:330758794136:web:31a37712395056dd3b99ed',
    messagingSenderId: '330758794136',
    projectId: 'barbotz-37910',
    authDomain: 'barbotz-37910.firebaseapp.com',
    storageBucket: 'barbotz-37910.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6qEz54Y7TX3cm-Pb6E2BwMERjHAyfq9c',
    appId: '1:330758794136:android:e44538e6b6f3ada13b99ed',
    messagingSenderId: '330758794136',
    projectId: 'barbotz-37910',
    storageBucket: 'barbotz-37910.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHxU1JggK6a81TKzop1VuF7DoHdyKUPrE',
    appId: '1:330758794136:ios:00cca568b57de5e63b99ed',
    messagingSenderId: '330758794136',
    projectId: 'barbotz-37910',
    storageBucket: 'barbotz-37910.appspot.com',
    iosClientId: '330758794136-aajgglpu6e426en45l9s33tqhghiackv.apps.googleusercontent.com',
    iosBundleId: 'de.barbotz.barbotzapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHxU1JggK6a81TKzop1VuF7DoHdyKUPrE',
    appId: '1:330758794136:ios:00cca568b57de5e63b99ed',
    messagingSenderId: '330758794136',
    projectId: 'barbotz-37910',
    storageBucket: 'barbotz-37910.appspot.com',
    iosClientId: '330758794136-aajgglpu6e426en45l9s33tqhghiackv.apps.googleusercontent.com',
    iosBundleId: 'de.barbotz.barbotzapp',
  );
}
