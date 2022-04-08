import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/cloudsearch/v1.dart';
import 'package:ss_skin_project/PhotoSubmission.dart';

import 'LogInScreen.dart';

// main class, runs app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name: "Skin Safety Scanner",
    options: const FirebaseOptions(
      apiKey: "AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y",
      messagingSenderId: "121689515063",
      projectId: "skin-safety-scanner",
      appId: '1:121689515063:android:3f3fb5bee8296b028e8bb2',
      storageBucket: 'gs://skin-safety-scanner',

    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PhotoSubmission(),
    );
  }
}