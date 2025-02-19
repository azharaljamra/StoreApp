import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/views/screens/cart_scren.dart';
import '../core/views/screens/home_screen.dart';

class RoutesGeneraited
{


  static Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case 'cart_view':
        return MaterialPageRoute(builder: (ctx) {
          return CartScreen();
        });
      case 'home_view':
        return MaterialPageRoute(builder: (ctx) {

          return HomeScreen();
        });
      default:
        return null;



    }
  }
  }