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
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.title,
                style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 24),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Text(item.showTime),
                    Container(
                      child: Wrap(
                        children: item.tags.map((e) => Text(e.name)).toList(),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                color: Colors.black.withOpacity(0.12),
                height: 1,
              ),
            ],
          ),
        ),
        tablet: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 30, left: 150, right: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.title,
                style: Theme.of(context).textTheme.headline4,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Text(
                      item.showTime,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.grey[400]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Wrap(
                        spacing: 5,
                        children: item.tags
                            .map((e) => Text(
                                  '#${e.name}',
                                  style: Theme.of(context).textTheme.subtitle2.copyWith(color: Color(0xffEB5757)),
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                color: Colors.black.withOpacity(0.12),
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
