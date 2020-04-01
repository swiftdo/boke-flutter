import 'package:flutter/material.dart';
import 'package:flutter_web/locator.dart';
import 'package:flutter_web/routing/route_names.dart';
import 'package:flutter_web/services/navigation_service.dart';
import 'package:flutter_web/widgets/widgets.dart';

class HomeContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ArticleDetails(),
        ),
        Container(
          margin: EdgeInsets.only(left: 100, right: 100),
          child: Center(
            child: CallToAction(
              onPressed: () =>
                  locator<NavigationService>().navigateTo(ArticlesRoute),
              title: '进入阅读',
            ),
          ),
        )
      ],
    );
  }
}
