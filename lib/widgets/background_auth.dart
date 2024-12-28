import 'package:flutter/material.dart';

class BackgroundAuth extends StatelessWidget {
  final Widget child;

  const BackgroundAuth({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: -40,
              right: -199,
              child: Image.asset('assets/login/top1.png',
                  width: size.width * 0.65),
            ),
            Positioned(
              top: 98,
              left: 75,
              child:
                  Image.asset('assets/login/lá.png', width: size.width * 0.18),
            ),
            Positioned(
              bottom: -30,
              left: 70,
              child: Image.asset('assets/login/bot2.png',
                  width: size.width * 0.32),
            ),
            Positioned(
              bottom: -23,
              left: -130,
              child: Image.asset('assets/login/bot1.png',
                  width: size.width * 0.65),
            ),
            Positioned(
              bottom: -25,
              right: 26,
              child: Image.asset('assets/login/bot3.png',
                  width: size.width * 0.35),
            ),
            child
          ],
        ),
      ),
    );
  }
}
