import 'package:contapp/config/app_routes.dart';
import 'package:contapp/config/providers/user_provider.dart';
import 'package:contapp/pages/all_transactions.dart';
import 'package:contapp/pages/home_page.dart';
import 'package:contapp/pages/login_page.dart';
import 'package:contapp/pages/new_page.dart';
import 'package:contapp/pages/sigin_page.dart';
import 'package:flutter/material.dart';
import 'package:contapp/design/themes.dart';

import 'models/user.dart';

class ContaApp extends StatelessWidget {
  const ContaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      userData: User(''),
      child: MaterialApp(
        theme: SysifosThemes.defaultTheme,
        // routes: {
        //   AppRoutes.home: (context) => const HomePage(),
        //   AppRoutes.newPage: (context) => const Newpage(),
        // },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AppRoutes.home:
              return MaterialPageRoute(
                  builder: (context) =>
                     const HomePage());
            case AppRoutes.newPage:
              return MaterialPageRoute(builder: (context) => const Newpage());
            case AppRoutes.siginPage:
              return MaterialPageRoute(builder: (context) => const SigInPage());
            case AppRoutes.allTransactions:
              return MaterialPageRoute(
                  builder: (context) => const AllTransactions());
            default:
              return MaterialPageRoute(builder: (context) => const LogInPage());
          }
        },
      ),
    );
  }
}
