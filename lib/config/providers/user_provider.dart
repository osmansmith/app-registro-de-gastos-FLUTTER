import 'package:flutter/material.dart';

import '../../models/user.dart';

class UserProvider extends InheritedWidget {
  final User userData;
  const UserProvider({super.key, required super.child, required this.userData});

  static UserProvider of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<UserProvider>()!;
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) =>
      oldWidget.userData.name != userData.name ? true : false;
}
