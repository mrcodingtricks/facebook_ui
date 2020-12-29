import 'package:facebook_ui/app_config.dart';
import 'package:facebook_ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> _screens =[
      HomeScreen(),
      Scaffold(),
      Scaffold(),
      Scaffold(),
      Scaffold(),
  ];

  List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: _CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index)=>setState(()=>_selectedIndex=index),
          ),
        ),
      ),
    );
  }
}


class _CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex ;
  final Function(int) onTap;

  const _CustomTabBar({Key key, this.icons, this.selectedIndex, this.onTap}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: icons
      .asMap()
      .map((key, value) => MapEntry(key,
       Tab(
        icon: Icon(value, color: key == selectedIndex ? AppConfig.facebook : Colors.black45)
      )
      )
      
      ).values.toList(),
      onTap: onTap,
    );
  }
}