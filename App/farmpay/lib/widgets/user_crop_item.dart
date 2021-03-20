import 'package:flutter/material.dart';

class UserCropItem extends StatelessWidget {

  final String title;
  final String imageURL;

  UserCropItem(this.title, this.imageURL);

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
          IconButton(icon: Icon(Icons.edit), onPressed: () {},
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