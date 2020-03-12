import 'package:flutter/material.dart';
import 'dart:math';


class AnimatedPage extends StatefulWidget {
  AnimatedPage({Key key}) : super(key: key);

  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {


  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.blue;
  BorderRadius _borderRadius = BorderRadius.circular(8.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Page'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(
            milliseconds: 1000
          ),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _heigth,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _changeShape,
      ),
    );
  }

  void _changeShape() {

    final random = Random();

    setState(() {
      _width = random.nextInt(300).toDouble();      
      _heigth = random.nextInt(300).toDouble();        

      _color = Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255), 
        1);

      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());  
    });
  }
}