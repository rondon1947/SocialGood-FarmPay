import 'package:farming_toolkit/screens/orders_screen.dart';
import 'package:flutter/material.dart';

import '../screens/user_crops_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Drawer( child:  Column(children: <Widget>[
      AppBar(
        title: Text('Hello Friend!'),
        automaticallyImplyLeading: false,
      ),
      Divider(),
      ListTile(leading: Icon(Icons.shop),
      title: Text('Shop'),
        onTap: () {
        Navigator.of(context).pushReplacementNamed('/');
        },
      ),
      Divider(),
      ListTile(leading: Icon(Icons.payment),
        title: Text('Orders'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
        },
      ),
      Divider(),
      ListTile(leading: Icon(Icons.edit),
        title: Text('My Crops'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed(UserCropsScreen.routeName);
        },
      ),
    ],
    ),
    );
  }
}