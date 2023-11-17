import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimension extends StatefulWidget {
  const Dimension({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _DimensionState createState() =>  _DimensionState();
}

class _DimensionState extends State<Dimension> {
  int _counter = 0;
  late MediaQueryData queryData;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    TextStyle style38 = const TextStyle(
      inherit: true,
      fontSize: 38.0,
    );
    TextStyle style20 = const TextStyle(
      inherit: true,
      fontSize: 20.0,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Button tapped $_counter time${ _counter == 1 ? '' : 's' }.',
            style: style38,
          ),
           Text(
            'size (pixels): w=${queryData.size.width * devicePixelRatio}, h=${queryData.size.height * devicePixelRatio}',
            style: style20,
          ),
           Text(
            'devicePixelRatio: $devicePixelRatio',
            style: style20,
          ),
           Text(
            'size: w=${queryData.size.width}, h=${queryData.size.height}',
            style: style20,
          ),
           Text(
            'textScaleFactor: w=${queryData.textScaleFactor}',
            style: style20,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.height;
}