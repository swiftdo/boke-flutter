import 'package:flutter/material.dart';
import 'package:loveli_core/loveli_core.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'config/config.dart';
import 'locator.dart';
import 'routing/routing.dart';
import 'services/services.dart';
import 'states/states.dart';

void main(ConfigEnv env) async {
  setupLocator(env);
  await SpUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: RefreshConfiguration(
        hideFooterWhenNotFull: true,
        child: Consumer<StateTheme>(
          builder: (ctx, themeState, child) {
            return MaterialApp(
              title: 'OldBird',
              debugShowCheckedModeBanner: false,
              theme: themeState.theme,
              navigatorKey: locator<ServiceNavigation>().navigatorKey,
              onGenerateRoute: generateRoute,
              initialRoute: RouteHome,
            );
          },
        ),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  final Widget child;
  Wrapper({this.child});
  @override
  Widget build(BuildContext context) {
    return OKToast(
      dismissOtherOnShow: true,
      textPadding: EdgeInsets.all(20),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => StateTheme(),
          ),
          ChangeNotifierProvider(
            create: (_) => GlobalUserState(),
          ),
        ],
        child: child,
      ),
    );
  }
}
