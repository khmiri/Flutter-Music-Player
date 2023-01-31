import 'package:flutter/material.dart';

class RotatedTextBtn extends StatelessWidget {
  final String? myLable;
  final IconData? myIcon;
  final bool? disabled;

  final VoidCallback? myCallBack;

   const RotatedTextBtn({
    required this.myLable,
    this.myIcon,
    this.disabled=false,
    this.myCallBack,
    Key? key,
  }) : assert(disabled!=null,"disabled cannot be null"),super(key: key) ;

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
                style: TextStyle(
                  color:disabled!?Colors.grey:Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              label: myIcon != null
                  ? Icon(myIcon,color: Colors.black,)
                  : const SizedBox(
                      width: 0,
                    ),
            )));
  }
}
