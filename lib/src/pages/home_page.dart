import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icono_string_util.dart';
//import 'package:components/src/pages/alert_page.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    //print(menuProvider.options);
    //menuProvider.dataLoad()
    return FutureBuilder(
      future: menuProvider.dataLoad(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems( snapshot.data, context ),
        );
      },
    );
   

    
  }


  List <Widget> _listItems(List<dynamic> menuItems, BuildContext context) {

    final List<Widget> widgetList = [];

    menuItems.forEach((data) {
      final widget = ListTile(
        title: Text(data['text']),
        leading: getIcon(data['icon']),
        trailing: Icon( Icons.keyboard_arrow_right ),
        onTap: () {

          Navigator.pushNamed(context, data['route']);
          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage()
          // );

          // Navigator.push(context, route);
        },
      );

      widgetList..add(widget)
                ..add(Divider());
    });

    return widgetList;

  }
  
}