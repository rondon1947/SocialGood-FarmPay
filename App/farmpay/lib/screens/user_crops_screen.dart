import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/crops.dart';
import '../widgets/user_crop_item.dart';
import '../widgets/app_drawer.dart';
import './edit_crops_screen.dart';

class UserCropsScreen extends StatelessWidget{
  static const routeName = '/user-crops';

  @override
  Widget build(BuildContext context) {
    final cropsData= Provider.of<Crops>(context);
    return  Scaffold(appBar: AppBar(
      title: const Text('Your Crops'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),onPressed: () {
            Navigator.of(context).pushNamed(EditCropsScreen.routeName);
        },),
      ],
    ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount:cropsData.items.length,
            itemBuilder: (_, i) => Column(
                children: [
                  UserCropItem(
                    cropsData.items[i].cropId,
                cropsData.items[i].cropName,
                cropsData.items[i].imageURL,
            ),
            Divider(),
                ],
        ),
      ),
        ),
    );
  }
}