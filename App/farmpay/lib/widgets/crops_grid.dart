import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'crop_item.dart';
import '../providers/crops.dart';

class CropsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cropsData = Provider.of<Crops>(context);
    final crops = cropsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: crops.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value:crops[i],
        child: CropItem(
//        crops[i].cropId,
//        crops[i].cropName,
//        crops[i].cropMSP,
//        crops[i].sellingPrice,
      ),
      ) ,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
