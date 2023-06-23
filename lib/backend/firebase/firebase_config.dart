import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBc7IPMvoIkWE62fbidZ3bEBhb-Pb-Jy6o",
            authDomain: "refugio-167f7.firebaseapp.com",
            projectId: "refugio-167f7",
            storageBucket: "refugio-167f7.appspot.com",
            messagingSenderId: "135642738745",
            appId: "1:135642738745:web:409eadf47a0b5fdea2dde8",
            measurementId: "G-HN0ZLDBTDZ"));
  } else {
    await Firebase.initializeApp();
  }
}
