import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:project_test/features/cart/presentation/views/cart_view.dart';
import 'package:project_test/features/home/presentation/views/home_view.dart';
import 'package:project_test/features/profile/presentation/views/profile_view.dart';

PersistentTabController _controller = PersistentTabController();

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      backgroundColor: Color(0xFF07A66FF),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const homeView(),
    const CartView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      inactiveColorPrimary: Colors.white,
      activeColorPrimary: Colors.white,
      icon: Icon(Icons.home),
    ),
    PersistentBottomNavBarItem(
      inactiveColorPrimary: Colors.white,
      activeColorPrimary: Colors.white,
      icon: Icon(Icons.shopping_cart),
    ),
    PersistentBottomNavBarItem(
      inactiveColorPrimary: Colors.white,
      activeColorPrimary: Colors.white,
      icon: FaIcon(FontAwesomeIcons.solidUser),
    ),
  ];
}
