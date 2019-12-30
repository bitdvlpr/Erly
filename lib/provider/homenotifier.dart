
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color.dart';

class HomeNotifier with ChangeNotifier{
  bool _state = true;
  int _value = 0;
  static String _degree;
  Widget _rowtop = Row(children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: <Widget>[
            Hero(
              tag: 'topwea',
              child: Icon(
                WeatherIcons.wi_cloudy_windy,
                color: AppColor.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10.0),
              child: Text(
                _degree ?? '19⁰',
                style: GoogleFonts.quicksand(
                    fontSize: 35.0,
                    textStyle: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    )
  ],);


  bool get state => _state;

   datestate(bool value) {
    _state = value;
    notifyListeners();
  }

  int get value => _value;

  bottomnavvalue(int value) {
    _value = value;
    notifyListeners();
  }

  Widget get rowtop => _rowtop;

  addrowtop(Widget value) {
    _rowtop = value;
    notifyListeners();
  }

  static String get degree => _degree;

  static set degree(String value) {
    _degree = value;
  }


}