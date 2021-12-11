import 'package:flutter/material.dart';
import 'package:news_app/pages/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_app/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'pages/homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false, // debug banner is removed
          title: 'News App',
          home: SplashScreen()), //Splash Screen page
    );
  }
}
