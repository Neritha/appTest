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
    apiKey: 'AIzaSyBFyTlA-FwM_h3jX_dYY2siOJ79IL4BQ-w',
    appId: '1:136092567462:web:60de05027990992742b167',
    messagingSenderId: '136092567462',
    projectId: 'confworld-ffa9f',
    authDomain: 'confworld-ffa9f.firebaseapp.com',
    storageBucket: 'confworld-ffa9f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDN6wgwEdhLjuUKD4G5A42oSEpAUYLTDes',
    appId: '1:136092567462:android:4f8fdb29c55f72e642b167',
    messagingSenderId: '136092567462',
    projectId: 'confworld-ffa9f',
    storageBucket: 'confworld-ffa9f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANFcTto-H8d77HGnkh68PIgUOaD15Yc7M',
    appId: '1:136092567462:ios:135702aef19d3f5242b167',
    messagingSenderId: '136092567462',
    projectId: 'confworld-ffa9f',
    storageBucket: 'confworld-ffa9f.appspot.com',
    iosClientId: '136092567462-gj9f5ep19lisf2to6k34n39vn0nnv69r.apps.googleusercontent.com',
    iosBundleId: 'com.example.tutoYtBis',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANFcTto-H8d77HGnkh68PIgUOaD15Yc7M',
    appId: '1:136092567462:ios:0a0e1298c14c507c42b167',
    messagingSenderId: '136092567462',
    projectId: 'confworld-ffa9f',
    storageBucket: 'confworld-ffa9f.appspot.com',
    iosClientId: '136092567462-huj2btotbuno6gq7bhknm72rrgrlnuoj.apps.googleusercontent.com',
    iosBundleId: 'com.example.tutoYtBis.RunnerTests',
  );
}
