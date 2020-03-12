import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 1.0;
  bool   _disabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 50.0
        ),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(
              child: _loadImage()
            )
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.blueAccent,
      inactiveColor: Colors.blueGrey,
      label: 'Zoom',
      min: 1.0,
      max: 400.0,
      value: _sliderValue,
      //divisions: 10,
      onChanged: (newValue) {
        if(_disabled) {
          return null;
        }

        print(newValue);
        setState(() {
          _sliderValue = newValue;
        });
      },
    );
  }

  Widget _createCheckbox() {
    // return Checkbox(
    //   value: _disabled,
    //   onChanged: (newValue) {
    //     setState(() {
    //       _disabled = newValue;
    //     });
    //   },
    // );

    return CheckboxListTile(
      title: Text('Inhabilitar slider'),
      value: _disabled,
      onChanged: (newValue) {
        setState(() {
          _disabled = newValue;
        });
      },
    );
  }


  Widget _loadImage() {
    return Image(
      image: NetworkImage('https://purepng.com/public/uploads/large/purepng.com-harley-quinn-arkham-knightharley-quinnharleyquinnharleenfrancesquinzelsupervillaincomicdc-comicscharacterharlequin-17015286104372oa47.png'),
      width: _sliderValue,
      fit: BoxFit.contain
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Inhabilitar slider'),
      value: _disabled,
      onChanged: (newValue) {
        setState(() {
          _disabled = newValue;
        });
      },
    ); 
  }

}