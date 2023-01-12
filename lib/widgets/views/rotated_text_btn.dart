import 'package:flutter/material.dart';

class RotatedTextBtn extends StatelessWidget {
  final String? myLable;
  final IconData? myIcon;

  final VoidCallback? myCallBack;

  const RotatedTextBtn({
    this.myLable,
    this.myIcon,
    this.myCallBack,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: RotatedBox(
            quarterTurns: 3,
            child: TextButton.icon(
              onPressed: myCallBack,
              icon: Text(
                myLable ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              label: myIcon != null
                  ? Icon(myIcon)
                  : const SizedBox(
                      width: 0,
                    ),
            )));
  }
}
