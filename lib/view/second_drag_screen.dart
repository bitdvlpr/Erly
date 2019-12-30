import 'package:erly/provider/homenotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../color.dart';

class DragSheetBottomAppBar extends StatefulWidget {

  @override
  _DragSheetBottomAppBarState createState() => _DragSheetBottomAppBarState();
}

class _DragSheetBottomAppBarState extends State<DragSheetBottomAppBar> {

  @override
  void dispose() {
    // TODO: implement dispose
    //_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: NotificationListener<DraggableScrollableNotification>(
        onNotification: (DraggableScrollableNotification draggableScrollableNotification){
          if(draggableScrollableNotification.extent>=0.8){

            Provider.of<HomeNotifier>(context, listen: false).datestate(false);
            //widget.datecontain = false;
            //hide date container
          }else if(draggableScrollableNotification.extent<=0.3){
            //show date container
            Provider.of<HomeNotifier>(context, listen: false).datestate(true);

            Provider.of<HomeNotifier>(context,listen: false).bottomnavvalue(0);

            Provider.of<HomeNotifier>(context,listen: false).addrowtop( Row(children: <Widget>[
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
                      SizedBox(height: 10.0,),
                      Text(
                        '19⁰',
                        style: GoogleFonts.quicksand(
                            fontSize: 35.0,
                            textStyle: TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
              )
            ],));

            //widget.datecontain = true;
          }

          return  Provider.of<HomeNotifier>(context, listen: false).state;
        },
        child: DraggableScrollableSheet(
            initialChildSize: 0.85,
            minChildSize: 0.0,
            maxChildSize: 0.85,
            builder: (context, controller) => ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0)),
              child: AnimatedContainer(
                duration: Duration(seconds: 5),
                curve: Curves.easeInOutQuad,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.white,
                ),
                //Fetch data using streambuilder
                child: ListView.builder(
                  controller: controller,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return DragBottomAppBarListTile(place: 'Naples' ,degree: '25',time: '1:00',current: WeatherIcons.wi_day_haze ,);

                    /*ListTile(
                            title: Text(
                          'BFAB $index ${controller.offset.floor()}',
                          style: TextStyle(color: Colors.black54),
                        ));*/
                  },
                ),
              ),
            )),
      ),
    );


  }
}


class DragBottomAppBarListTile extends StatelessWidget {

  final place;
  final degree;
  final time;
  final IconData current;


  DragBottomAppBarListTile({@required this.place,@required this.degree,@required this.time,@required this.current});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 5),
      curve: Curves.easeInOutQuad,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text( place ?? 'Naples',style: GoogleFonts.quicksand(fontSize: 25,fontWeight: FontWeight.w400)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text( degree ?? '22⁰',style: GoogleFonts.quicksand(fontSize: 40,fontWeight: FontWeight.w400)),
                      Text(time ?? '11:25',style: GoogleFonts.quicksand(fontSize: 15,fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Icon(current ?? WeatherIcons.wi_cloud_refresh,size: 50,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

