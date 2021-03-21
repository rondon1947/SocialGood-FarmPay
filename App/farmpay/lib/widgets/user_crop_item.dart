import 'package:farming_toolkit/screens/edit_crops_screen.dart';
import 'package:flutter/material.dart';
import '../screens/edit_crops_screen.dart';

class UserCropItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageURL;

  UserCropItem(this.id, this.title, this.imageURL);

  @override
  Widget build(BuildContext context){
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageURL),
      ),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(icon: Icon(Icons.edit), onPressed: () {
            Navigator.of(context).pushNamed(EditCropsScreen.routeName, arguments: id);
          },
          color: Theme.of(context).primaryColor,
          ),
          IconButton(icon: Icon(Icons.delete), onPressed: () {},
          color: Theme.of(context).errorColor,
          ),
        ],
        ),
      ),
    );
  }
}