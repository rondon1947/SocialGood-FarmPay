import '../providers/crops.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CropDetailScreen extends StatelessWidget {
  // final String title;
  //
  // CropDetailScreen(this.title);
  static const routeName = '/crop-detail';

  @override
  Widget build(BuildContext context) {
    final cropId = ModalRoute.of(context).settings.arguments as String;
    final loadedCrop = Provider.of<Crops>(context, listen: false,).findById(cropId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedCrop.cropName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 300,
              width: double.infinity,
              child: Image.network(
                loadedCrop.imageURL,
                fit: BoxFit.cover,
            ),
            ),
            SizedBox(height: 10),
            Text('Rs ${loadedCrop.sellingPrice}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            Text('Minimum Selling Price: ${loadedCrop.cropMSP.toString()}')

          ],
        ),
      ),

    );
  }
}