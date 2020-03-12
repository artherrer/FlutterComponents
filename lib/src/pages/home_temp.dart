import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {


  final opciones = ['Uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes Temp'),),
      body: ListView(
        children: _itemsShort()
      ),
    );
  }


  // List<Widget>  _items() {

  //   List<Widget> items = new List<Widget>();

  //   for (String item in opciones) {
  //     final tempWidget = ListTile(title: Text(item),);
  //     items..add(tempWidget)
  //          ..add(Divider());

  //   }

  //   return items;
  // }


  List<Widget>  _itemsShort() {
    return opciones.map((element) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(element), 
            subtitle: Text('Chido'),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}