import 'package:farming_toolkit/widgets/crop_item.dart';
import 'package:flutter/material.dart';
import './crop.dart';

class Crops with ChangeNotifier {
  List<Crop> _items = [
    Crop(
      cropId: 'c1',
      cropName: 'Rice',
      cropMSP: 11.00,
      sellingPrice: 15.00,
      imageURL: 'https://assets.epicurious.com/photos/568eb0bf7dc604b44b5355ee/5:4/w_1609,h_1287,c_limit/rice.jpg',
    ),
    Crop(
      cropId: 'c2',
      cropName: 'Wheat',
      cropMSP: 11.00,
      sellingPrice: 15.00,
      imageURL:'https://www.veganfriendly.org.uk/wp-content/uploads/2020/01/wheat-grains.jpg',
    ),
    Crop(
      cropId: 'c3',
      cropName: 'Sugarcane',
      cropMSP: 3.00,
      sellingPrice: 5.00,
      imageURL: 'https://www.gardeningknowhow.com/wp-content/uploads/2018/07/sugarcane-variety.jpg',
    ),
    Crop(
      cropId: 'c4',
      cropName: 'Cotton',
      cropMSP: 59.00,
      sellingPrice: 65.00,
      imageURL: 'https://economictimes.indiatimes.com/thumb/msid-71688591,width-1200,height-900,resizemode-4,imgsize-150603/cotton.jpg?from=mdr',
    ),
    Crop(
      cropId: 'c5',
      cropName: 'Jute',
      cropMSP: 43.00,
      sellingPrice: 45.00,
      imageURL: 'https://5.imimg.com/data5/RT/SO/MY-25065022/jute-fiber-500x500.jpg',
    ),
  ];

//  var _showFavoritesOnly = false;

  List<Crop> get items {
//    if(_showFavoritesOnly)
//      {
//        return _items.where((CropItem) => CropItem.isFavorite).toList();
//      }
    return [..._items];
  }

  List<Crop> get favoriteItems {
    return _items.where((CropItem) => CropItem.isFavorite).toList();
  }


  Crop findById(String id) {
    return _items.firstWhere((Crop) => Crop.cropId == id);
  }

//  void showFavoritesOnly() {
//    _showFavoritesOnly = true;
//    notifyListeners();
//  }
//
//  void showAll() {
//    _showFavoritesOnly = false;
//    notifyListeners();
//  }

  addCrop() {
    // _items.add(value);
    notifyListeners();
  }
}
