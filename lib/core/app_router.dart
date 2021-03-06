import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_example_app/features/track_details/details_screen.dart';
import 'package:flutter_example_app/features/track_list/tracks_screen.dart';

class Routes {
  static const tracksScreen = '/';
  static const detailsScreen = '/details';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.tracksScreen:
        return MaterialPageRoute(builder: (_) => TracksScreen());
      case Routes.detailsScreen:
        var arg = settings.arguments as DetailsScreenArg;
        return MaterialPageRoute(builder: (_) => DetailsScreen(arg));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
