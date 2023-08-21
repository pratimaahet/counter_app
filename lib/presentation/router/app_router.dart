import 'package:counter_app/presentation/screens/counter_screen.dart';
import 'package:counter_app/presentation/screens/second_screen.dart';
import 'package:counter_app/presentation/screens/third_screen.dart';
import 'package:counter_app/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  MaterialPageRoute? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CounterScreen());

        break;

      case '/second':
        return MaterialPageRoute(builder: (_) => SecondScreen());

        break;

      case '/third':
        return MaterialPageRoute(builder: (_) => ThirdScreen());

        break;
      default:
        return null;
    }
  }
}
