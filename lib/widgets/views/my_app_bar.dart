import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget  implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

//
@override
  Size get preferredSize => const Size.fromHeight(100);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 100,
      shadowColor: Colors.transparent,
      //a Row to add Two widgets besides eachother
      title: Row(children: [
        const Text(
          "Discover",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        //
        // to give space between
        //
        Expanded(child: Container()),

        //
        //Drawer or menu Icon
        //
        const Icon(
          Icons.sort,
          color: Colors.black,
        )
      ]),
    );
  }
}