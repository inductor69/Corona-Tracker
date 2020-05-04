import 'package:covid19/model/result.dart';
import 'package:covid19/ui/screens/preventionScreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:covid19/ui/screens/dialog.dart';

class Precaution extends StatefulWidget {
  final List<Result> resList;
  Precaution({@required this.resList}) : assert(resList != null);
  @override
  _PrecautionState createState() => _PrecautionState();
}

class Item {
  String name;
  MaterialColor color;
  Item({@required this.name, @required this.color});
}

class Prevention {
  String title;
  String description;
  Prevention({@required this.description,@required this.title});
}

Item mask = Item(name: 'Mask', color: Colors.red);
Item gloves = Item(name: 'Gloves', color: Colors.orange);
Item alcohol = Item(name: 'Alcohol', color: Colors.blue);
Item soap = Item(name: 'Soap', color: Colors.blueGrey);

Prevention symptoms = Prevention(description: 'Signs identify the risk of infection', title: 'Symptoms');
Prevention prevention = Prevention(description: 'Help you avoid the risk of infection', title: 'Prevention');
Prevention reports = Prevention(description: 'Data related to the disease', title: 'Reports');
Prevention about = Prevention(description: 'Useful information about the infection', title: 'About');

class _PrecautionState extends State<Precaution> {
  List<Item> items = [mask, gloves, alcohol, soap];
  List<Prevention> preventions = [symptoms, prevention, reports, about];
  // _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[          
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              // height: ScreenUtil.screenHeight / 4,
              color: Colors.blue[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: ScreenUtil().setHeight(90),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Prevent COVID - 19', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(50)),),
                      IconButton(
                        icon: Icon(Icons.info, color: Colors.white, size: 30,),
                        onPressed: (){
                          showDialog(
  context: context,
  builder: (BuildContext context) => CustomDialog(
        title: "Developers",
        description:
            "Aditya Kumar \n Pradyumn Rahar",
        buttonText: "Okay",
      ),
);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: Wrap(
                      runAlignment: WrapAlignment.end,
                      spacing: 25,
                      runSpacing: 25,
                      children: preventions.map((p) => InkWell(
                        onTap: () {
                          if(p.title == "Reports") {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => ReportsScreen(resList: widget.resList,)));
                          } else {
                            Navigator.pushNamed(context, '/${p.title.toLowerCase()}');
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: 0.4 * MediaQuery.of(context).size.width,
                          width: 0.4 * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image.asset('img/${p.title.toLowerCase()}.png', height: ScreenUtil().setSp(50), width: ScreenUtil().setSp(50), color: Colors.yellow,),
                              SizedBox(height: 20,),
                              Text(p.title, style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(30), fontWeight: FontWeight.w600),),
                              SizedBox(height: 10,),
                              Text(p.description, style: TextStyle(color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.w500, wordSpacing: 2, fontSize: ScreenUtil().setSp(21)), maxLines: 2, overflow: TextOverflow.ellipsis,)
                            ],
                          ),             
                        ),
                      )).toList(),
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Requirements', style: TextStyle(fontSize: ScreenUtil().setSp(46), fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  Text('Help you prevent viruses better', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.grey, fontWeight: FontWeight.w400),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: items.map((r) => Column(
                      children: <Widget>[
                        Container(
                          width: 0.2 * MediaQuery.of(context).size.width,
                          height: 0.2 * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: r.color.withOpacity(0.15)                          
                          ),
                          child: Center(child: Image.asset('img/${r.name.toLowerCase()}.png', fit: BoxFit.contain, width: ScreenUtil().setWidth(70), color: r.color)),
                        ),
                        SizedBox(height: 10,),
                        Text(r.name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: ScreenUtil().setSp(27)),)
                      ],
                    )).toList(),
                  )
                ],
              ),
            )
          ],
        ),      
      ),
    );
  }
}