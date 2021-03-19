import 'package:flutter/material.dart';

class CropDetailScreen extends StatelessWidget {
  // final String title;
  //
  // CropDetailScreen(this.title);
  static const routeName = '/crop-detail';

  @override
  Widget build(BuildContext context) {
    final cropId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(cropId),
      ),

    );
  }
}