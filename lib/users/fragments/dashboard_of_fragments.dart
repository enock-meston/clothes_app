import 'package:clothes_app/users/UserPreferences/current_user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'favorites_fragment_screen.dart';
import 'home_fragment_screen.dart';
import 'order_fragment_screen.dart';
import 'profile_fragment_screen.dart';


class DashboardOfFragments extends StatelessWidget {

  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());

  List<Widget> _fragmentScreens =
  [
    HomeFragmentScreen(),
    FavoritesFragmentScreen(),
    OrderFragmentScreen(),
    ProfileFragmentScreen(),
  ];

  List _navigationButtonProperties= [
    {
      "active_icon":Icons.home,
      "non_active_icon": Icons.home_outlined,
      "label": "HOME",
    },
    {
      "active_icon":Icons.favorite,
      "non_active_icon": Icons.favorite_border,
      "label": "FAVORITES",
    },
    {
      "active_icon":FontAwesomeIcons.boxOpen,
      "non_active_icon": FontAwesomeIcons.box,
      "label": "ORDERS",
    },{
      "active_icon":Icons.person,
      "non_active_icon": Icons.person_outline,
      "label": "PROFILE",
    },
  ];

  RxInt _indexNumber = 0.obs;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState){
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller){
        return Scaffold(
          backgroundColor: Colors.black,
            body: SafeArea(
              child: Obx(
                  ()=>_fragmentScreens[_indexNumber.value]
              ),
            ),
            bottomNavigationBar: Obx(
                ()=>BottomNavigationBar(
                  currentIndex: _indexNumber.value,
                  onTap: (value){
                    _indexNumber.value = value;
                  },
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white24,
                  items: List.generate(4, (index) {
                    var navigationProperty = _navigationButtonProperties[index];
                    return BottomNavigationBarItem(
                      backgroundColor: Colors.black,
                      icon: Icon(navigationProperty["non_active_icon"]),
                      activeIcon: Icon(navigationProperty["active_icon"]),
                      label: navigationProperty["label"],
                    );
                  }),
                ),
            ),
        );
      },
    );
  }
}
