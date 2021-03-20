import 'dart:math';

import 'package:farming_toolkit/providers/crop.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context){
    return Card(margin: EdgeInsets.all(10), child: Column(children: <Widget>[
      ListTile(
        title: Text('Rs ${widget.order.amount}'),
        subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
        ),
        trailing: IconButton(
          icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          } ,
        ),
      ),
      if(_expanded)
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          height: min(widget.order.crops.length*20.0 +10 , 180),
        child: ListView(children: widget.order.crops.map((crop) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(crop.title, style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold,
            ),
            ),
            Text('${crop.quantity}x Rs ${crop.price}',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
              ),
            ),
          ],
        )).toList(),
        ),
        )
    ],
    ),
    );
  }
}