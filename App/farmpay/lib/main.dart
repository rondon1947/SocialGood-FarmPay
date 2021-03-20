import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/crops_overview_screen.dart';
import 'screens/crop_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'providers/crops.dart';
import 'providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (ctx) => Crops(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Farming Toolkit',
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: CropsOverviewScreen(),
        routes: {
          CropDetailScreen.routeName: (ctx) => CropDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}