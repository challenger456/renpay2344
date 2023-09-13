import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:renpay/HomeScreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreen(){
    return [
      HomeScreen(),
      Text('Home'),
      Text('Home'),
      Text('Home'),

    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems(){
    return [
      PersistentBottomNavBarItem(
          icon: ImageIcon(AssetImage('asset/s2-1 (1).png',),size: 35,color: Colors.deepPurple,),
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(AssetImage('asset/t.png'),size: 35,color: Colors.deepPurple,),
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(AssetImage('asset/s3-1.png'),size: 35,color: Colors.deepPurple,),
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(AssetImage('asset/s-1.png'),size: 35,color: Colors.deepPurple,),
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        screens: _buildScreen(),
      items: _navBarItems(),
      backgroundColor: Color(0xffBCBEFA),
      bottomScreenMargin: 0,
      margin: EdgeInsets.only(left: 30,right:30,top: 10,bottom: 30 ),
      navBarHeight: 60,
      controller: controller,
      navBarStyle: NavBarStyle.style6,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(50),
        adjustScreenBottomPaddingOnCurve: true,
      ),
    );
  }
}
