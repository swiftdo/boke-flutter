import 'package:flutter/material.dart';
import 'package:boke/model/spiders.dart';
import 'package:loveli_core/loveli_core.dart';
import 'package:provider/provider.dart';
import '../table/table.dart';
import 'package:oktoast/oktoast.dart';
import 'package:getflutter/getflutter.dart';
import 'state_admin_spider.dart';

class PageAdminSpider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ProviderWidget(
        model: StateAdminSpider(globalUser: Provider.of(context)),
        onModelReady: (StateAdminSpider state) => state.loadTopics(),
        builder: (BuildContext context, StateAdminSpider state, Widget child) {
          if (state.viewState == ViewState.busy) {
            return ViewStateBusyWidget();
          }

          List topics = state.topics.map((e) => e.toMap()).toList();
          return ResponsiveDatable(
            headers: [
              DatableHeader(
                text: '标题',
                value: 'title',
                show: true,
                textAlign: TextAlign.center,
              ),
              DatableHeader(
                text: '来源',
                value: 'source',
                show: true,
                textAlign: TextAlign.center,
              ),
              DatableHeader(
                  text: '操作',
                  textAlign: TextAlign.center,
                  sourceBuilder: (value, raw) {
                    int index = topics.indexOf(raw);
                    SpiderTopic tmpTopic = state.topics[index];

                    if (tmpTopic.isUpload) {
                      return Text('已上传');
                    } else {
                      return Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        children: [
                          GFButton(
                            text: '上传',
                            onPressed: () {
                              sendToServer(tmpTopic, context, state);
                            },
                            shape: GFButtonShape.pills,
                            size: GFSize.SMALL,
                          ),
                        ],
                      );
                    }
                  })
            ],
            source: topics,
            showSelect: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      OutlineButton(
                        child: Text('重新抓取'),
                        onPressed: () async {
                          showToastWidget(
                            Center(
                              child: Container(
                                width: 200,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black45,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      child: CircularProgressIndicator(),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        '加载中...',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            context: context,
                            duration: Duration(seconds: 60),
                          );
                          Map result = await state.refreshSpider();
                          dismissAllToast();
                          state.loadTopics();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Text(
                    '更新数据',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  sendToServer(
    SpiderTopic topic,
    BuildContext context,
    StateAdminSpider spiderState,
  ) {
    spiderState.uploadTopic(topic);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width - 120,
            height: MediaQuery.of(context).size.height - 160,
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '添加 Topic',
                      style: TextStyle(fontSize: 20),
                    ),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Container(
                    child: TextField(
                      controller: TextEditingController(text: topic.title),
                      decoration: InputDecoration(
                        labelText: '输入标题',
                      ),
                      onChanged: (text) => spiderState.title = text,
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: TextEditingController(text: topic.url),
                      decoration: InputDecoration(
                        labelText: '输入URL',
                      ),
                      onChanged: (text) => spiderState.url = text,
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: TextEditingController(text: topic.desc),
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: '输入简介',
                      ),
                      onChanged: (text) => spiderState.remarks = text,
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: TextEditingController(text: topic.detail),
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: '输入详情',
                      ),
                      onChanged: (text) => spiderState.content = text,
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: TextEditingController(text: topic.source),
                      decoration: InputDecoration(
                        labelText: '输入来源',
                      ),
                      onChanged: (text) => spiderState.source = text,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: OutlineButton(
                      child: Text('提交'),
                      onPressed: () async {
                        spiderState.upload(topic, context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddForm(
    BuildContext context,
    StateAdminSpider spiderState,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            '添加 Topic',
            style: TextStyle(fontSize: 20),
          ),
          margin: EdgeInsets.only(bottom: 20),
        ),
      ],
    );
  }
}
