import 'package:flutter/material.dart';
import 'package:boke/locator.dart';
import 'package:boke/routing/route_names.dart';
import 'package:boke/services/services.dart';
import '../../widgets/widgets.dart';

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
              onPressed: () => locator<ServiceNavigation>().navigateTo(RouteArticles),
              title: '进入阅读',
            ),
          ),
        )
      ],
    );
  }
}
