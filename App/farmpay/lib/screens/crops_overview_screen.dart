import '../widgets/crops_grid.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import '../providers/crops.dart';

enum FilterOptions {
  Favorites,
  All,
}

class CropsOverviewScreen extends StatefulWidget {
  @override
  _CropsOverviewScreenState createState() => _CropsOverviewScreenState();
}

class _CropsOverviewScreenState extends State<CropsOverviewScreen> {

  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
//    final cropsContainer = Provider.of<Crops>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('FarmPay'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if(selectedValue == FilterOptions.Favorites) {
//                cropsContainer.showFavoritesOnly();
                  _showOnlyFavorites = true;
                }
                else {
//                cropsContainer.showAll();
                  _showOnlyFavorites =  false;
                }
              });
            },
            icon: Icon(Icons.more_vert,
          ),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Only Favorites'), value: FilterOptions.Favorites,),
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All,),
          ],
          ),
        ],
      ),
      body: CropsGrid(_showOnlyFavorites),
    );
  }
}

