import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:boke/locator.dart';
import 'package:boke/routing/route_names.dart';
import 'package:boke/services/service_navigation.dart';
import 'state_login.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:provider/provider.dart';
import 'package:loveli_core/loveli_core.dart';

class PageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ProviderWidget<StateLogin>(
      model: StateLogin(globalUserState: Provider.of(context)),
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
                          '登录',
                          style: TextStyle(fontSize: 30),
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
                        SizedBox(
                          height: 30,
                        ),
                        RaisedButton(
                          padding: EdgeInsets.symmetric(horizontal: 80),
                          onPressed: () async {
                            await login(state, context);
                          },
                          child: Text('登录'),
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
                          '登录',
                          style: TextStyle(fontSize: 50),
                        ),
                        SizedBox(
                          height: 50,
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
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Text(
                                '忘记密码?',
                              ),
                              onTap: () {
                                locator<ServiceNavigation>().navigateTo(RouteForgetPwd);
                              },
                            ),
                            RaisedButton(
                              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                              onPressed: () async {
                                await login(state, context);
                              },
                              child: Text('登录'),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(text: '还没有账号，点击这里 '),
                          TextSpan(
                            text: '注册一个',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                locator<ServiceNavigation>().navigateTo(RouteRegister);
                              },
                          )
                        ]))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future login(StateLogin state, BuildContext context) async {
    var result = await state.login(context: context);
    if (result != null) {
      locator<ServiceNavigation>().navigateTo(RouteHome);
    }
  }
}
