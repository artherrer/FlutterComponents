import 'package:flutter/material.dart';

import 'package:components/src/pages/animated_page.dart';
import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/card_page.dart';
import 'package:components/src/pages/input_page.dart';
import 'package:components/src/pages/slider_page.dart';
import 'package:components/src/pages/listview_page.dart';



Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
    '/'     : (BuildContext context) => HomePage(),
    AlertPage.pageName : (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animated': (BuildContext context) => AnimatedPage(),
    'input': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'listview': (BuildContext context) => ListviewPage(),
  };
        

}