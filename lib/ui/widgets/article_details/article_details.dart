import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({Key key}) : super(key: key);

  final String title = 'OldBird\n共享编程知识';
  final String info =
      '以优质编程技术资源共享为核心，以交流学习为目的搭建的在线平台。我们共享一些优质的资源出来，供同行业的同胞交流与学习，让彼此之间在自身的技术上得到提升，本站主要提供程序方面的资源给大家，像 iOS，Flutter，Vapor，设计模式，算法等等方面的资源，本站计划将在后期会不断完善，建设更多类目的资源，希望能得到更多同行的支持！';

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.headline2.copyWith(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              info,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 16,
                    height: 1.8,
                    fontWeight: FontWeight.normal,
                  ),
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
      tablet: Container(
        padding: EdgeInsets.only(
          left: 150,
          top: 80,
          bottom: 20,
          right: 150,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.headline2.copyWith(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              info,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 20,
                    height: 1.8,
                    fontWeight: FontWeight.normal,
                  ),
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
      desktop: Container(
        padding: EdgeInsets.only(
          left: 150,
          top: 80,
          bottom: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.headline2.copyWith(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              info,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 20,
                    height: 1.8,
                    fontWeight: FontWeight.normal,
                  ),
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }
}
