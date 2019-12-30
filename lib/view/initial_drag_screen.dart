import 'package:erly/provider/homenotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../color.dart';

class BottomNav extends StatefulWidget {

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (DraggableScrollableNotification draggableScrollableNotification ){
        if(draggableScrollableNotification.extent>=0.8){

          Provider.of<HomeNotifier>(context, listen: false).datestate(false);
          //widget.datecontain = false;
          //hide date container
        }else if(draggableScrollableNotification.extent<=0.5){
          //show date container
          Provider.of<HomeNotifier>(context, listen: false).datestate(true);

          //widget.datecontain = true;
        }
        return  Provider.of<HomeNotifier>(context, listen: false).state;
      },
      child: DraggableScrollableSheet(
          initialChildSize: 0.14,
          minChildSize: 0.14,
          maxChildSize: 0.85,
          builder: (context, controller) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0)),
              child: AnimatedContainer(
                duration: Duration(seconds: 5),
                curve: Curves.easeInOutQuad,
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.white,
                ),
                child: ListView(
                  controller: controller,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(
                                        Icons.access_time,
                                        color: AppColor.lightyellow,
                                        size: 20,
                                      ),
                                      onPressed: null),
                                  Text(
                                    'Today\'s Changes',
                                    style: GoogleFonts.robotoCondensed(
                                        fontSize: 18.0,
                                        textStyle: TextStyle(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                              (Provider.of<HomeNotifier>(context, listen: false).state) ? Visibility(
                                visible: true,
                                child: IconButton(
                                    icon: Icon(
                                        MaterialCommunityIcons.calendar_blank_outline,
                                        color: AppColor.deeppink,
                                        size: 20),
                                    onPressed: null),
                              ) : Visibility(
                                visible: false,
                                child: IconButton(
                                    icon: Icon(
                                        MaterialCommunityIcons.calendar_blank_outline,
                                        color: AppColor.deeppink,
                                        size: 20),
                                    onPressed: null),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(WeatherIcons.wi_day_rain_wind,size: 25,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                                    child: Wrap(children:<Widget>[ Text('Erly',style: TextStyle(fontSize: 18),)]),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(WeatherIcons.wi_day_lightning,size: 25,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                                    child: Wrap(children:<Widget>[ Text('Erly',style: TextStyle(fontSize: 18),)]),
                                  )
                                ],
                              )

                            ],
                          ),
                        ),
                      ],


                    ),
                    //Fetch data using streambuilder
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      //controller: controller,
                      itemCount: 25,
                      itemBuilder: (BuildContext context, int index) {
                        return  BottomWeather();

                        /*ListTile(
                            title: Text(
                              'Dish $index',
                              style: TextStyle(color: Colors.black54),
                            ));*/
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class BottomWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: <Widget>[
                    Text('9:00'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                //child: Image.asset(''),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(WeatherIcons.wi_cloud_refresh,size: 20,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                      child: Text('18⁰',style: TextStyle(fontSize: 15)),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
