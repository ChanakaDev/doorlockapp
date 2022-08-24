// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'connect_screen.dart';
import 'unlock_screen.dart';
// import 'package:path/path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: <String, WidgetBuilder>{
        '/connectScreen': (context) => const ConnectScreen(),
        '/unlockScreen': (context) => const UnlockScreen(),
        '/homeScreen': (context) => const HomeScreen(),
        
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  BuildContext? get context => null;

  @override
  Widget build(BuildContext context) {
    double cardWidth = (MediaQuery.of(context).size.width / 2) - 32;
    double cardHeight = 200.0;
    double cornerRadius = 15.0;
    String firstImagePath = 'assets/images/bluetooth_icon@2x.png';
    String secondImagePath = 'assets/images/fingerprint_icon@2x.png';
    String firstCardText = 'connect';
    String secondCardText = 'unlock';
    return Scaffold(
      body: Container(
        color: const Color(0xff1A133E),
        child: SafeArea(
          child: Container(
            color: const Color(0xff1A133E),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const Text(
                  'Smart Door Lock',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.asset('assets/images/banner_area@2x.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      cardCreator(
                        cardWidth,
                        cardHeight,
                        cornerRadius,
                        firstImagePath,
                        firstCardText,
                        context
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      cardCreator(
                        cardWidth,
                        cardHeight,
                        cornerRadius,
                        secondImagePath,
                        secondCardText,
                        context
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 80.0,
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                    top: 24.0,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff794DC2)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Lock door',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell cardCreator(
    double cardWidth,
    double cardHeight,
    double cornerRadius,
    String imagePath,
    String cardText,
    BuildContext context
  ) {
    return InkWell(
      onTap: () {
        if (cardText == 'connect') {
          print('Connect card clicked');
          Navigator.of(context).pushNamed('/connectScreen');
       
        } else {
          print('Unlock card clicked');
          Navigator.of(context).pushNamed('/unlockScreen');
        }
      },
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(cornerRadius),
                    topRight: Radius.circular(cornerRadius),
                    bottomLeft: Radius.circular(cornerRadius),
                    bottomRight: Radius.circular(cornerRadius),
                  ),
                ),
                width: cardWidth,
                height: cardHeight,
                child: Column(),
              ),
            ],
          ),
          SizedBox(
            width: cardWidth,
            height: cardHeight,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image.asset(imagePath),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 8.0,
            ),
            width: cardWidth,
            height: cardHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  cardText,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
