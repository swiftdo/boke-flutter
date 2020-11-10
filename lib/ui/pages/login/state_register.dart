import 'package:boke/locator.dart';
import 'package:boke/services/net/web_repository.dart';
import 'package:flutter/material.dart';
import 'package:loveli_core/loveli_core.dart';
import 'package:oktoast/oktoast.dart';

class StateRegister extends ViewStateModel {
  String _email;
  String _pwd;
  String _name;
  String _agaPwd;

  final repository = locator<WebRepository>();

  bool get sending => viewState == ViewState.busy;

  setEmail(String email) {
    _email = email;
  }

  setName(String name) {
    _name = name;
  }

  setAgaPwd(String agaPwd) {
    _agaPwd = agaPwd;
  }

  setPassword(String pwd) {
    _pwd = pwd;
  }

  register({BuildContext context}) async {
    if (sending) {
      return null;
    }
    if (_name == null || _name.length == 0) {
      showToast("请输入名字");
      return null;
    }

    if (!RegexUtil.isEmail(_email)) {
      showToast("请输入正确的邮箱");
      return null;
    }
    if (_pwd == null || _pwd.length < 6) {
      showToast("请输入 6 位以上密码");
      return null;
    }

    if (_agaPwd == null || _pwd != _agaPwd) {
      showToast("两次密码不一样");
      return null;
    }

    setBusy();
    try {
      final result = await repository.register(email: _email, pwd: _pwd, name: _name);
      setIdle();
      return result;
    } catch (e, s) {
      setError(e, s);
      showErrorMessage(context, message: viewStateError.message);
      return null;
    }
  }
}
