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

  List<Crop> get items {
    return [..._items];
  }

  addCrop() {
    // _items.add(value);
    notifyListeners();
  }
}
