import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDCLrEvyJwNr3wq2s5ZrfLyK9007RL-kdQ",
            authDomain: "tahady2.firebaseapp.com",
            projectId: "tahady2",
            storageBucket: "tahady2.appspot.com",
            messagingSenderId: "927538831976",
            appId: "1:927538831976:web:43295cc6f904903b8491dd",
            measurementId: "G-ZJ1M6L8Q2E"));
  } else {
    await Firebase.initializeApp();
  }
}
