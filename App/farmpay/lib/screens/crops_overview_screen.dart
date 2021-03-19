import '../widgets/crops_grid.dart';
import 'package:flutter/material.dart';

class CropsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FarmPay'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (int selectedValue) {
              print(selectedValue);
            },
            icon: Icon(Icons.more_vert,
          ),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Only Favorites'), value: 0,),
              PopupMenuItem(child: Text('Show All'), value: 1,),
          ],
          ),
        ],
      ),
      body: CropsGrid(),
    );
  }
}

