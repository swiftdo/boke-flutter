import 'package:flutter/material.dart';
import 'package:loveli_core/loveli_core.dart';
import 'state_forget_pwd.dart';

class PageForgetPwd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<StateForgetPwd>(
        model: StateForgetPwd(),
        builder: (context, state, _) {
          return Container();
        });
  }
}
