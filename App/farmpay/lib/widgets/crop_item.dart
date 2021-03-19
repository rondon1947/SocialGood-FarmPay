import 'package:farming_toolkit/providers/crop.dart';

import '../screens/crop_detail_screen.dart';
import 'package:flutter/material.dart';
import '../providers/crops.dart';
import 'package:provider/provider.dart';

class CropItem extends StatelessWidget {
//  final String cropId;
//  final String cropName;
//  final double cropMSP;
//  final double sellingPrice;

  final Map<String, String> urlMap = {
    'Rice':
        'https://assets.epicurious.com/photos/568eb0bf7dc604b44b5355ee/5:4/w_1609,h_1287,c_limit/rice.jpg',
    'Wheat':
        'https://www.veganfriendly.org.uk/wp-content/uploads/2020/01/wheat-grains.jpg',
    'Sugarcane':
        'https://www.gardeningknowhow.com/wp-content/uploads/2018/07/sugarcane-variety.jpg',
    'Cotton':
        'https://economictimes.indiatimes.com/thumb/msid-71688591,width-1200,height-900,resizemode-4,imgsize-150603/cotton.jpg?from=mdr',
    'Jute':
        'https://5.imimg.com/data5/RT/SO/MY-25065022/jute-fiber-500x500.jpg',
  };

//  CropItem(this.cropId, this.cropName, this.cropMSP, this.sellingPrice);

  @override
  Widget build(BuildContext context) {
    final crop = Provider.of<Crop>(context);
    String imageURL = urlMap[crop.cropName];
    return Consumer<Crop>(
      builder: (ctx, crop, child) => ClipRRect(
        borderRadius: BorderRadius.circular(35.0),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                CropDetailScreen.routeName,
                arguments: crop.cropId,
              );
            },
            child: Image.network(
              imageURL,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(crop.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                crop.toggleFavoriteStatus();
              },
            ),
            title: Text(
              crop.cropName + '\nRs.(per KG) = ' + crop.cropMSP.toString(),
              style: new TextStyle(
                fontSize: 24.0,
              ),
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
