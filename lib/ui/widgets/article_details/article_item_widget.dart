import 'package:flutter/material.dart';
import 'package:boke/model/model.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ArticleItemWidget extends StatelessWidget {
  final Topic item;
  final GestureTapCallback onTap;

  ArticleItemWidget(this.item, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: ScreenTypeLayout(
        mobile: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        tablet: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 60, left: 150, right: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.title,
                style: Theme.of(context).textTheme.headline4,
              ),
              Divider(
                color: Color(0xffEB5757),
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
