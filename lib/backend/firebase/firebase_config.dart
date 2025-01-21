import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBmio0QaMwwhuR4Ky6w9Y-lpjCjGgKX5Qc",
            authDomain: "memesplanet-8c245.firebaseapp.com",
            projectId: "memesplanet-8c245",
            storageBucket: "memesplanet-8c245.firebasestorage.app",
            messagingSenderId: "1038614189555",
            appId: "1:1038614189555:web:d9d1519a6adecd1bbd6e86",
            measurementId: "G-7SWE710FL2"));
  } else {
    await Firebase.initializeApp();
  }
}
