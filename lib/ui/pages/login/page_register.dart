import 'package:boke/routing/route_names.dart';
import 'package:boke/services/service_navigation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loveli_core/loveli_core.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../locator.dart';
import 'state_register.dart';

class PageRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ProviderWidget<StateRegister>(
        model: StateRegister(),
        builder: (context, state, _) {
          return Scaffold(
            body: SingleChildScrollView(
              child: ScreenTypeLayout(
                mobile: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      width: width * 0.8,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            '注册',
                            style: TextStyle(fontSize: 30),
                          ),
                          TextField(
                            onChanged: (text) {
                              state.setName(text);
                            },
                            decoration: InputDecoration(
                              labelText: '输入名字',
                            ),
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (text) {
                              state.setEmail(text);
                            },
                            decoration: InputDecoration(
                              labelText: '输入邮箱',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: '输入密码',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            onChanged: (text) {
                              state.setPassword(text);
                            },
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: '确认密码',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            onChanged: (text) {
                              state.setAgaPwd(text);
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          RaisedButton(
                            padding: EdgeInsets.symmetric(horizontal: 80),
                            onPressed: () async {
                              await register(state, context);
                            },
                            child: Text('注册'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                desktop: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      margin: EdgeInsets.only(top: 80),
                      width: 450,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            '注册',
                            style: TextStyle(fontSize: 50),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          TextField(
                            onChanged: (text) {
                              state.setName(text);
                            },
                            decoration: InputDecoration(
                              labelText: '输入名字',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (text) {
                              state.setEmail(text);
                            },
                            decoration: InputDecoration(
                              labelText: '输入邮箱',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            obscureText: true,
                            onChanged: (text) {
                              state.setPassword(text);
                            },
                            decoration: InputDecoration(
                              labelText: '输入密码',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: '再次输入密码',
                            ),
                            onChanged: (text) {
                              state.setAgaPwd(text);
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(text: '已有账号，'),
                                  TextSpan(
                                    text: '进行登录',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        locator<ServiceNavigation>().goBack();
                                      },
                                  )
                                ]),
                              ),
                              RaisedButton(
                                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                                onPressed: () async {
                                  await register(state, context);
                                },
                                child: Text('注册'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  register(StateRegister state, BuildContext context) async {
    var result = await state.register(context: context);
    if (result != null) {
      locator<ServiceNavigation>().navigateTo(RouteLogin);
    }
  }
}
