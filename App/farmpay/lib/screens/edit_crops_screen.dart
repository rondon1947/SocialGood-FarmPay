import 'package:flutter/material.dart';

import '../providers/crop.dart';

class EditCropsScreen extends StatefulWidget {
  static const routeName = '/edit-crop';
  @override
  _EditCropsScreenState createState() => _EditCropsScreenState();
}

class _EditCropsScreenState extends State<EditCropsScreen> {
  final _priceFocusNode = FocusNode();
  final _quantityFocusNode = FocusNode();
  final _imageURLController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedCrop = Crop(cropId: null, cropName: '', cropMSP: 0, sellingPrice: 0, imageURL: '');

  @override
  void dispose(){
    _priceFocusNode.dispose();
    _quantityFocusNode.dispose();
    _imageURLController.dispose();
    super.dispose();
  }


  void _saveForm() {
    _form.currentState.save();
    print(_editedCrop.cropName);
    print(_editedCrop.sellingPrice);

  }

  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Text('Edit and Add Crops'),
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Title'),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_priceFocusNode);
            },
            onSaved: (value) {
              _editedCrop = Crop(cropId: null,
                  cropName: value,
                  cropMSP: _editedCrop.cropMSP,
                  sellingPrice: _editedCrop.sellingPrice,
                  imageURL: _editedCrop.imageURL
              );
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Selling Price'),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            focusNode: _priceFocusNode,
            onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(_quantityFocusNode);
           },
            onSaved: (value) {
              _editedCrop = Crop(cropId: null,
                  cropName: _editedCrop.cropName,
                  cropMSP: double.parse(value),
                  sellingPrice: double.parse(value),
                  imageURL: _editedCrop.imageURL
              );
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Quantity '),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            focusNode: _quantityFocusNode,
           ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top:8, right: 10),
              decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey,),
              ),
              child: _imageURLController.text.isEmpty ?
              Text('Enter a URL'):
              FittedBox(
                child: Image.network(
                    _imageURLController.text,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: TextFormField(decoration: InputDecoration(labelText: 'Image URL'),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                controller: _imageURLController,
                onFieldSubmitted: (_) {
                _saveForm();
                },
                onSaved: (value) {
                  _editedCrop = Crop(cropId: null,
                      cropName: _editedCrop.cropName,
                      cropMSP: _editedCrop.cropMSP,
                      sellingPrice: _editedCrop.sellingPrice,
                      imageURL: value,
                  );
                },
              ),
            ),
          ],
          ),
        ],
        ),
        ),
      ),
    );
  }
}