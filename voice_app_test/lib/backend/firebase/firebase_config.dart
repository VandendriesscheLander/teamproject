import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDzO8jkTnGKRjtjLcNQmgQq3FATOblevsc",
            authDomain: "voice-app-test-8w91ed.firebaseapp.com",
            projectId: "voice-app-test-8w91ed",
            storageBucket: "voice-app-test-8w91ed.firebasestorage.app",
            messagingSenderId: "466369120140",
            appId: "1:466369120140:web:52aba5e3e0692dc20c78a9",
            measurementId: "G-XPP20N2SDZ"));
  } else {
    await Firebase.initializeApp();
  }
}
