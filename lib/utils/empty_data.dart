import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pointofsales/utils/size_config.dart';

class EmptyData extends StatefulWidget {
  const EmptyData({Key? key}) : super(key: key);

  @override
  _EmptyDataState createState() => _EmptyDataState();
}

class _EmptyDataState extends State<EmptyData> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/empty-data.jpg"),
            Text("Data not found!")
            // Lottie.asset("assets/json/emptydata.json")
          ],
        ),
      ),
    );
  }
}
