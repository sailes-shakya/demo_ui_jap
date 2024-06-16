import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:task_demo_ui/generated/assets.gen.dart';

import '../screen_one_page.dart';

class CustomButtonBar extends StatefulWidget {
  @override
  _CustomButtonBarState createState() => _CustomButtonBarState();
}

class _CustomButtonBarState extends State<CustomButtonBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ScreenOnepage(),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {},
            shape: CircleBorder(),
            backgroundColor: Colors.orange,
            child: Image(image: Svg(MyAssets.svg.barcodeScan.path), width: 40),
          ),
          Positioned(
              child: Text('スキャン',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
              bottom: -21,
              left: 0,
              right: 0),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildBottomNavigationItem(Icons.search, 'さがす', 0),
              _buildBottomNavigationItem(Icons.work, 'お仕事', 1),
              SizedBox(width: 50), // Space for FloatingActionButton
              _buildBottomNavigationItem(Icons.chat, 'チャット', 2),
              _buildBottomNavigationItem(Icons.person, 'マイページ', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: _selectedIndex == index ? Colors.orange : Colors.black,
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.orange : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
