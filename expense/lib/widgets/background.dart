import 'package:flutter/material.dart';

class BackgroundImg extends StatefulWidget {
  const BackgroundImg({super.key});

  @override
  State<BackgroundImg> createState() => _BackgroundImgState();
}

class _BackgroundImgState extends State<BackgroundImg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/logo_black.png",
              ),
              opacity: 0.2)),
    );
  }
}
