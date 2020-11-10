import 'package:flutter/material.dart';
import 'package:boke/routing/route_names.dart';
import 'package:provider/provider.dart';
import 'package:boke/states/global_user_state.dart';
import 'package:boke/states/state_theme.dart';

import '../navbar_item/navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarTableDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 150),
            child: NavBarLogo(
              navigationPath: RouteHome,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Consumer<GlobalUserState>(
                builder: (context, state, _) {
                  if (state.isLogin) {
                    return NavBarItem(
                      title: 'Admin',
                      navigationPath: RouteAdmin,
                    );
                  } else {
                    return NavBarItem(
                      title: '登录/注册',
                      navigationPath: RouteLogin,
                    );
                  }
                },
              ),
              SizedBox(width: 20),
              NavBarItem(
                title: '关于',
                navigationPath: RouteAbout,
              ),
              SizedBox(width: 20),
              Consumer<StateTheme>(
                builder: (context, state, _) {
                  return GestureDetector(
                    onTap: () => state.toggle(),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: const EdgeInsets.only(right: 150),
                      child: Image(
                        image: AssetImage(
                          state.isDark ? 'assets/images/theme_light.png' : 'assets/images/theme_dark.png',
                        ),
                        color: state.isDark ? Colors.white : Colors.black,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
