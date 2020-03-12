import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardOne(),
          SizedBox(height: 30.0,),
          _cardTwo(),
          SizedBox(height: 30.0,),
          _cardOne(),
          SizedBox(height: 30.0,),
          _cardTwo(),
          SizedBox(height: 30.0,),
          _cardOne(),
          SizedBox(height: 30.0,),
          _cardTwo(),
          SizedBox(height: 30.0,),
          _cardOne(),
          SizedBox(height: 30.0,),
          _cardTwo(),
          SizedBox(height: 30.0,),
          _cardOne(),
          SizedBox(height: 30.0,),
          _cardTwo(),
          SizedBox(height: 30.0,),
          _cardOne(),
          SizedBox(height: 30.0,),
          _cardTwo(),
          SizedBox(height: 30.0,),
          _cardOne(),
          SizedBox(height: 30.0,),
          _cardTwo(),
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }

  Widget _cardOne() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Titulo'),
            subtitle: Text('Lorem'  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          )
        ],
      )
    );
  }

  Widget _cardTwo() {

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://miro.medium.com/max/4320/0*QNdQhs_T3ffa6B0m.jpeg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(
              milliseconds: 200
            ),
            height: 300.0,
            fit: BoxFit.cover
          ),
          // Image(
          //   image: NetworkImage('https://miro.medium.com/max/4320/0*QNdQhs_T3ffa6B0m.jpeg'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Hola')
          )
        ],
      ),
    );

  }
}