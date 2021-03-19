import 'package:flutter/foundation.dart';

class Crop with ChangeNotifier {
  final String cropId;
  final String cropName;
  final double cropMSP;
  final double sellingPrice;
  bool isFavorite;

  Crop({
    @required this.cropId,
    @required this.cropName,
    @required this.cropMSP,
    @required this.sellingPrice,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

}
