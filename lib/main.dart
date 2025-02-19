import 'package:app_store/core/viewmodels/catgories_vm.dart';
import 'package:app_store/core/viewmodels/products_vm.dart';
import 'package:app_store/core/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helpers/routes_generate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context)=> ProductVm()..getProductsFromServer()),
        ChangeNotifierProvider(create: (context)=> CategoriesVm()..getCategoriesFromServer()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: RoutesGeneraited.generateRoutes,
        theme: ThemeData(
                 useMaterial3: false),
        initialRoute: '/home_view',



      ),
    );
  }
}


