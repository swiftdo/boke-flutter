import 'package:boke/states/state_theme.dart';
import 'package:flutter/material.dart';
import 'package:loveli_core/loveli_core.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'state_article_detail.dart';

class PageArticleDetail extends StatelessWidget {
  final String topicId;

  PageArticleDetail({@required this.topicId});
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<StateArticleDetail>(
      model: StateArticleDetail(topicId: topicId),
      onModelReady: (model) => model.loadTopic(),
      builder: (context, model, child) {
        if (model.viewState == ViewState.busy) {
          return ViewStateBusyWidget();
        }
        bool isDark = Provider.of<StateTheme>(context, listen: false).isDark;
        return Container(
          child: MarkdownWidget(
            data: model.topic.showContent,
            childMargin: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            styleConfig: StyleConfig(
              markdownTheme: isDark ? MarkdownTheme.darkTheme : MarkdownTheme.lightTheme,
              ulConfig: UlConfig(
                textStyle: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
                crossAxisAlignment: CrossAxisAlignment.start,
                dotSize: 8,
                dotMargin: EdgeInsets.only(
                  top: 9,
                  right: 8,
                ),
              ),
              pConfig: PConfig(
                  linkStyle: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Color(0xffEF543C),
                  ),
                  textStyle: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                  onLinkTap: (url) {
                    launch(url);
                  }),
            ),
          ),
        );
      },
    );
  }
}
