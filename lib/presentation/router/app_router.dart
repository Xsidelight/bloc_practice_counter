import 'package:bloc_practice_counter/presentation/screens/home_screen.dart';
import 'package:bloc_practice_counter/presentation/screens/second_screen.dart';
import 'package:bloc_practice_counter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
              HomeScreen(title: 'Home Screen', color: Colors.blue),
        );
      case '/second_screen':
        return MaterialPageRoute(
          builder: (_) =>
              SecondScreen(
                  title: 'Second Screen', color: Colors.purple),
        );
      case '/third_screen':
        return MaterialPageRoute(
          builder: (_) =>
              ThirdScreen(title: 'Third Screen', color: Colors.green),
        );
      default:
        return null;
    }
  }
}
