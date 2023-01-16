import 'package:flutter/material.dart';

// this enum indicates all items in this BottomNavBar
enum BottomNavBarSelectedItem { home, search, playlists, liked }

class MyBottomNavBar extends StatelessWidget {
  final dynamic selectedItem;

  const MyBottomNavBar({
    required this.selectedItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /*
       Convert selectedItem string to enum
       the argument that was received by the constructor is of type String
       to compare it with enum we should cast it or convert it to type enum
    */

    BottomNavBarSelectedItem navSelectedItem = BottomNavBarSelectedItem.values
        .firstWhere((e) => e.toString() == selectedItem);
    
    /*  
        navSelectedItem is type enum, so we are going to use it below,
        Inside Customs IconButton within this NavBar
  
    */

    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //
          //List of Custom Icon Button defined in Custom widget class the bottom of this page
          //
          NavBarIconButton(
            navSelectedItem: navSelectedItem,
            currentItem: BottomNavBarSelectedItem.home,
            myIcon: Icons.home_outlined,
          ),
          //
          //
          NavBarIconButton(
            navSelectedItem: navSelectedItem,
            currentItem: BottomNavBarSelectedItem.search,
            myIcon: Icons.search,
          ),
          //
          //
          NavBarIconButton(
            navSelectedItem: navSelectedItem,
            currentItem: BottomNavBarSelectedItem.playlists,
            myIcon: Icons.collections_bookmark_outlined,
          ),
          //
          //
          NavBarIconButton(
            navSelectedItem: navSelectedItem,
            currentItem: BottomNavBarSelectedItem.liked,
            myIcon: Icons.favorite_outline,
          ),
        ],
      ),
    );
  }
}



//
//Custom IconButton widget for BottomNavBar 
//
class NavBarIconButton extends StatelessWidget {
  const NavBarIconButton({
    Key? key,
    required this.navSelectedItem,
    required this.currentItem,
    required this.myIcon,
    this.myCallBack,
  }) : super(key: key);

  //the selectedItem, if it equals the currentItem we change the color
  final BottomNavBarSelectedItem navSelectedItem;

  //What item is this to compare with the selectedIcon
  final BottomNavBarSelectedItem currentItem;

  //
  //Icon to display
  final IconData myIcon;

  //VoidCallBack
  final VoidCallback? myCallBack;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      enableFeedback: false,
      onPressed: myCallBack,
      icon: Icon(
        myIcon,
        //if The selectedItem equals the current item we change the color ( black for selected )
        color: navSelectedItem == currentItem
            ? Colors.black
            : Colors.black45,
        size: 35,
      ),
    );
  }
}
