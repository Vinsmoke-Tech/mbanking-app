import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  SmallText({Key? key, this.color = const Color.fromARGB(255, 47, 47, 47), 
      required this.text,
      this.size=12,
      this.height=1.2
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}