import 'package:erly/color.dart';
import 'package:erly/provider/homenotifier.dart';
import 'package:erly/view/initial_drag_screen.dart';
import 'package:erly/view/second_drag_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context,homenotifier,_)=>Scaffold(
        backgroundColor: AppColor.purple,
        appBar: PreferredSize(
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 2),
                    curve: Curves.ease,
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Icon(
                              SimpleLineIcons.layers,
                              color: AppColor.deeppink,
                              size: 20.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'What to wear',
                              style: GoogleFonts.quicksand(
                                  fontSize: 20.0,
                                  textStyle: TextStyle(
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w500)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 0),
                            curve: Curves.decelerate,
                            height: (homenotifier.state) ? 80 : 100,
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColor.lightpink,
                              borderRadius: (homenotifier.state) ? null : BorderRadius.only(bottomLeft: Radius.circular(40.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                  alignment: (homenotifier.state) ? Alignment.bottomCenter : Alignment.center,
                                  child: Icon(
                                    MaterialCommunityIcons.menu,
                                    color: AppColor.white,
                                  )),
                            ),
                          ),
                        ),
                        (homenotifier.state) ? Expanded(
                          child: Visibility(
                            visible: true,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 2),
                              curve: Curves.ease,
                              height: 80,
                              width: 60,
                              decoration: BoxDecoration(
                                color: AppColor.deeppink,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Center(
                                        child: Text(
                                          'Sat',
                                          style: GoogleFonts.robotoCondensed(
                                              fontSize: 12.0,
                                              textStyle:
                                              TextStyle(color: AppColor.white)),
                                        )),
                                    Center(
                                        child: Text(
                                          '03',
                                          style: GoogleFonts.robotoCondensed(
                                              fontSize: 25.0,
                                              textStyle:
                                              TextStyle(color: AppColor.white)),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ) :  Visibility(
                          visible: false,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 2),
                            curve: Curves.ease,
                            height: 80,
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColor.deeppink,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Center(
                                      child: Text(
                                        'Sat',
                                        style: GoogleFonts.robotoCondensed(
                                            fontSize: 12.0,
                                            textStyle:
                                            TextStyle(color: AppColor.white)),
                                      )),
                                  Center(
                                      child: Text(
                                        '03',
                                        style: GoogleFonts.robotoCondensed(
                                            fontSize: 25.0,
                                            textStyle:
                                            TextStyle(color: AppColor.white)),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            preferredSize: (homenotifier.state) ? Size.fromHeight(140) : Size.fromHeight(90)),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: (homenotifier.state) ? Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '19⁰',
                            style: GoogleFonts.quicksand(
                                fontSize: 80.0,
                                textStyle: TextStyle(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w200)),
                          ),
                          Text(
                            'Feels like 17',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w300,
                                fontSize: 15.0,
                                textStyle: TextStyle(color: AppColor.white)),
                          ),
                          Hero(
                            tag: 'topwea',
                            child: Icon(
                              WeatherIcons.wi_cloudy_windy,
                              color: AppColor.white,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ) : homenotifier.rowtop,
                  ),

                  (homenotifier.state ) ? Visibility(
                    visible: true,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 50.0),
                            child: Image.asset(
                              'images/vector.png',
                              scale: 2.6,
                            ),
                          )
                        ],
                      ),
                    ),
                  )  : Visibility(
                    visible: false,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 50.0),
                            child: Image.asset(
                              'images/vector.png',
                              scale: 2.6,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height / 7.5,
                    left: 15,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              homenotifier.bottomnavvalue(1);
                              homenotifier.datestate(false);
                              homenotifier.addrowtop(Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Row(
                                      children: <Widget>[
                                        //sunrise
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(WeatherIcons.wi_cloud_down,size: 30,color: AppColor.white,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                                          child: Text('04:30', style: GoogleFonts.montserrat(
                                              fontSize: 20.0,
                                              textStyle: TextStyle(color: AppColor.white))),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Row(

                                      children: <Widget>[
                                        //sunset
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(WeatherIcons.wi_cloud_down,size: 30,color: AppColor.white,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                                          child: Text('04:30', style: GoogleFonts.montserrat(
                                              fontSize: 20.0,
                                              textStyle: TextStyle(color: AppColor.white))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));

                            },
                            child: Text(
                              'Naples',
                              style: GoogleFonts.montserrat(
                                  fontSize: 35.0,
                                  textStyle: TextStyle(color: AppColor.white)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            (homenotifier.value == 0)
                ? Align(alignment: Alignment.bottomCenter, child: BottomNav())
                : DragSheetBottomAppBar()
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: (homenotifier.value == 0)
            ? null
            : FloatingActionButton(
          backgroundColor: AppColor.deeppink,
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        bottomNavigationBar: (homenotifier.value==0)?null:AnimatedContainer(
          duration: Duration(seconds: 5),
          curve: Curves.easeInOutQuad,
          child: BottomAppBar(
            //notchMargin: 4.0,
            //shape: CircularNotchedRectangle(),
            elevation: 10.0,
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25.0,bottom: 5.0,top: 5.0),
                  child: IconButton(
                    icon: Icon(MaterialCommunityIcons.home_outline,color: AppColor.deeppink,),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0,bottom: 5.0,top: 5.0),
                  child: IconButton(
                    icon: Icon(MaterialCommunityIcons.calendar_blank_outline,color: AppColor.deeppink,),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




