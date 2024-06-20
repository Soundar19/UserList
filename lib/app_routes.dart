import 'package:flutter/material.dart';
import 'package:routing/routing.dart';
import 'package:untitled/list_View/list_view.dart';
import 'package:untitled/user_view/user_view.dart';

enum AppRoutes {
  ListView("/", "list"),

  userView("/user/:id", "user");

  final String routePath;
  final String routeName;

  const AppRoutes(this.routePath, this.routeName);
}

var appScreenList = [
  AppScreen(AppRoutes.ListView.routeName, AppRoutes.ListView.routePath,
      (context, state) {
    return MaterialPage(key: state.pageKey, child: const UserListView());
  }),
  AppScreen(AppRoutes.userView.routeName, AppRoutes.userView.routePath,
      (context, state) {
    return MaterialPage(
        key: state.pageKey,
        child: UserViewWidget(
          id: int.parse(state.params['id'] ?? '0'),
        ));
  }),
];

var appRedirection = (context, state) {};
