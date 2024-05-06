import 'package:flutter/material.dart';
import 'package:weatherapp/utils/routes/routes_name.dart';
import 'package:weatherapp/view/home_view.dart';
import 'package:weatherapp/view/profile_view.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (con) => HomeView());
    case ProfileViewRoute:
      return MaterialPageRoute(builder: (con) => ProfileView());
    default:
      return MaterialPageRoute(builder: (con) => HomeView());
  }
}
