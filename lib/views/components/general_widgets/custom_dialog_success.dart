import 'package:flutter/material.dart';
import 'package:pointofsales/utils/constants.dart';

class CustomDialogSuccess extends StatefulWidget {
  const CustomDialogSuccess(
      {Key? key, required this.descriptions, required this.onPressed})
      : super(key: key);

  final String descriptions;
  final VoidCallback onPressed;

  @override
  State<CustomDialogSuccess> createState() => _CustomDialogSuccessState();
}

class _CustomDialogSuccessState extends State<CustomDialogSuccess> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, top: 50, right: 10, bottom: 0),
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Success',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.descriptions,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                      onPressed: widget.onPressed,
                      child: Text('OK'))),
            ],
          ),
        ),
        Positioned(
          left: 30,
          right: 30,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Image.asset('assets/images/check-mark.png')),
          ),
        ),
      ],
    );
  }
}
