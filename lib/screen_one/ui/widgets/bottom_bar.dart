import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:task_demo_ui/generated/assets.gen.dart';
import 'package:task_demo_ui/screen_one/ui/screen_one_page.dart';

void main() => runApp(PersistenBottomNavBarDemo());

class PersistenBottomNavBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        backgroundColor: Colors.red,
        tabs: [
          PersistentTabConfig(
            screen: ScreenOnepage(),
            item: ItemConfig(
              activeForegroundColor: Colors.orange,
              icon: Icon(Icons.search),
              title: "さがす",
            ),
          ),
          PersistentTabConfig(
            screen: ScreenOnepage(),
            item: ItemConfig(
              activeForegroundColor: Colors.orange,
              icon: Icon(Icons.local_post_office),
              title: "お仕事",
            ),
          ),
          PersistentTabConfig(
            screen: ScreenOnepage(),
            item: ItemConfig(
              icon: Image(image: Svg(MyAssets.svg.barcodeScan.path)),
              title: "打刻する",
              activeForegroundColor: Colors.orange,
            ),
          ),
          PersistentTabConfig(
            screen: ScreenOnepage(),
            item: ItemConfig(
              activeForegroundColor: Colors.orange,
              icon: Icon(Icons.local_post_office),
              title: "チャット",
            ),
          ),
          PersistentTabConfig(
            screen: ScreenOnepage(),
            item: ItemConfig(
              icon: Icon(Icons.settings),
              activeForegroundColor: Colors.orange,
              title: "チャット",
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style13BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}
