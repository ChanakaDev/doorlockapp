import 'package:flutter/material.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF1A133E),
                Color(0xFF794DC2),
              ],
              begin: FractionalOffset(0.0, 1.0),
              end: FractionalOffset(0.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: IconButton(
                    icon: Image.asset('assets/images/back_icon@2x.png'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/homeScreen');
                    },
                  ),
                ),
                const Text(
                  'Available Devices',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  child: IconButton(
                    icon: Image.asset('assets/images/home_icon@2x.png'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/homeScreen');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
