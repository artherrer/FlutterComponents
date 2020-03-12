import 'dart:async';

import 'package:flutter/material.dart';


class ListviewPage extends StatefulWidget {
  ListviewPage({Key key}) : super(key: key);

  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = [];
  int _lastItem = 0;
  bool _loading = false;


  @override
  void initState() {
    super.initState();

    _add();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //_add();
        fetchData();
      }
    });
  }


  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose(); //Fuga de memoria
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading()
        ],
      ),
    );
  }


  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getFromStart,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, int index) {

          final indexImage = _listNumbers[index];

          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://i.picsum.photos/id/$indexImage/500/300.jpg'),
          );
        },
      ),
    );
  }


  Future<Null> getFromStart() async {

    final duration = Duration(seconds: 2);

    new Timer(duration, () {
      _listNumbers.clear();
      _add();
    });

    return Future.delayed(duration);
  }



  void _add({quantity: 5}) {
    for (var i = 0; i < quantity; i++) {
      _lastItem++;
      _listNumbers.add(_lastItem);
    }

    setState(() {});
  }

  Future<Null> fetchData() async {

    _loading = true;

    setState(() {});

    return new Timer(Duration(seconds: 2), respuestaHttp);

  }

  void respuestaHttp() {
    _loading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );

    _add();
  }

  Widget _createLoading() {
    if (_loading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    }

    return Container();
  }
}