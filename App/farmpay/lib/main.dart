import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/crops_overview_screen.dart';
import 'screens/crop_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'providers/crops.dart';
import 'providers/cart.dart';
import 'providers/orders.dart';
import 'screens/orders_screen.dart';
import 'screens/user_crops_screen.dart';
import 'screens/edit_crops_screen.dart';

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
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
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
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserCropsScreen.routeName: (ctx) => UserCropsScreen(),
          EditCropsScreen.routeName: (ctx) => EditCropsScreen(),
        },
      ),
    );
  }
}