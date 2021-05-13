import 'package:bloc_practice_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_practice_counter/presentation/screens/home_screen.dart';
import 'package:bloc_practice_counter/presentation/screens/second_screen.dart';
import 'package:bloc_practice_counter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
              HomeScreen(title: 'Home Screen', color: Colors.blue),
        );
        break;
      case '/second_screen':
        return MaterialPageRoute(
          builder: (_) =>
              SecondScreen(
                  title: 'Second Screen', color: Colors.purple),
        );
        break;
      case '/third_screen':
        return MaterialPageRoute(
          builder: (_) =>
              ThirdScreen(title: 'Third Screen', color: Colors.green),
        );
        break;
      default:
        return null;
    }
  }
}
