import 'package:flutter/material.dart';

import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {

  final Item item;

  const ItemWidget({Key? key,required this.item}) : assert(item!=null),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: ListTile(
        onTap: ()=>{
          print("${item.name} pressed")
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
        textScaleFactor: 1.2,
        style: TextStyle(
          color: Colors.indigoAccent,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
