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
    ),
    Crop(
      cropId: 'c2',
      cropName: 'Wheat',
      cropMSP: 11.00,
      sellingPrice: 15.00,
    ),
    Crop(
      cropId: 'c3',
      cropName: 'Sugarcane',
      cropMSP: 3.00,
      sellingPrice: 5.00,
    ),
    Crop(
      cropId: 'c4',
      cropName: 'Cotton',
      cropMSP: 59.00,
      sellingPrice: 65.00,
    ),
    Crop(
      cropId: 'c5',
      cropName: 'Jute',
      cropMSP: 43.00,
      sellingPrice: 45.00,
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
