import 'package:flutter/material.dart';
import 'package:boke/locator.dart';
import 'package:boke/services/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBarLogo extends StatelessWidget {
  final String navigationPath;

  NavBarLogo({this.navigationPath});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        double sizeWH = sizeInfo.isMobile ? 30 : 40;
        double radius = sizeInfo.isMobile ? 15 : 4;

        return GestureDetector(
          onTap: () {
            locator<ServiceNavigation>().navigateTo(navigationPath);
          },
          child: Padding(
            padding: sizeInfo.isMobile ? EdgeInsets.only(right: 10) : EdgeInsets.only(left: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: SizedBox(
                height: sizeWH,
                width: sizeWH,
                child: Image.asset('assets/images/logo.jpg'),
              ),
            ),
          ),
        );
      },
    );
  }
}
