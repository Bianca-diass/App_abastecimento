import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCIHII3XpngoVrjoDSIi2bjT5S5A0JxcUA',
    appId: '1:611734471152:web:50fb1b5dc611d228badd35',
    messagingSenderId: '611734471152',
    projectId: 'projetoabastecimento-d916d',
    authDomain: 'projetoabastecimento-d916d.firebaseapp.com',
    storageBucket: 'projetoabastecimento-d916d.firebasestorage.app',
    measurementId: 'G-4M8Y1CBVKH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0WlZH1QGhsl5sryb0qYfzwaGULZp3ydc',
    appId: '1:611734471152:android:6387a8ce0b49f3aabadd35',
    messagingSenderId: '611734471152',
    projectId: 'projetoabastecimento-d916d',
    storageBucket: 'projetoabastecimento-d916d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkW6CKs7gD1nF1we3noPwQgeiapPtvmrA',
    appId: '1:611734471152:ios:385ed5e869a4b219badd35',
    messagingSenderId: '611734471152',
    projectId: 'projetoabastecimento-d916d',
    storageBucket: 'projetoabastecimento-d916d.firebasestorage.app',
    iosBundleId: 'com.example.controleAbastecimento',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkW6CKs7gD1nF1we3noPwQgeiapPtvmrA',
    appId: '1:611734471152:ios:385ed5e869a4b219badd35',
    messagingSenderId: '611734471152',
    projectId: 'projetoabastecimento-d916d',
    storageBucket: 'projetoabastecimento-d916d.firebasestorage.app',
    iosBundleId: 'com.example.controleAbastecimento',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCIHII3XpngoVrjoDSIi2bjT5S5A0JxcUA',
    appId: '1:611734471152:web:115988053fe9cc3cbadd35',
    messagingSenderId: '611734471152',
    projectId: 'projetoabastecimento-d916d',
    authDomain: 'projetoabastecimento-d916d.firebaseapp.com',
    storageBucket: 'projetoabastecimento-d916d.firebasestorage.app',
    measurementId: 'G-99DPCTSDT8',
  );
}
