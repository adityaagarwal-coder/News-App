import 'package:flutter/material.dart';
import 'package:news_app/pages/homepage.dart';

import 'sign_up_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 360,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/images/news logo.png", // Background Image for SplashScreen Page
            ),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: AnimatedCrossFade(
              // Animated Splash Screen
              firstChild: Container(
                child: CircularProgressIndicator(),
              ),
              secondChild: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 550,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SignUpPage()), //Navigation to SignUpPage
                                );
                              });
                            },
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              crossFadeState: CrossFadeState.showSecond,
              duration: Duration(seconds: 2), // duration of animation
            ),
          )),
    );
  }
}
