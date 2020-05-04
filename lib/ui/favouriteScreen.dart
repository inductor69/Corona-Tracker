import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/result.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Result> resList;
  FavouriteScreen({@required this.resList}) : assert(resList != null);
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<String> favs = ["india", "usa"];
  List<Result> favr = List<Result>();
  void addFav(resList) {
    for (int i = 0; i < resList.length; i++) {
      if (resList[i].country.toLowerCase()=="india" &&
          !favr.contains(resList[i])) {
        favr.add(resList[i]);
      }
    }

    for (int i = 0; i < resList.length; i++) {
      if (favs.contains(resList[i].country.toLowerCase()) &&
          !favr.contains(resList[i])) {
        favr.add(resList[i]);
      }
    }
  }

  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    addFav(widget.resList);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Watchlist',
          style:
              TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(40)),
        ),
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: favr.length,
          itemBuilder: (context, i) {
            return Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blue[900])),
              height: ScreenUtil().setHeight(550),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            favr[i].country,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(54),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Active Cases : ${favr[i].active}",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: ScreenUtil().setSp(28))),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Confirmed',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: ScreenUtil().setSp(32))),
                          Text(
                              "+${((favr[i].todayCases / favr[i].confirmed) * 100).toStringAsFixed(1)}%",
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(favr[i].confirmed.toString(),
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(46),
                                  fontWeight: FontWeight.w600)),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text("+${favr[i].todayCases}",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(46),
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue[900])),
                              Text(
                                ' cases in last 12h',
                                style: TextStyle(color: Colors.blue[900]),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Recovered',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: ScreenUtil().setSp(32))),
                          Text(favr[i].recovered.toString(),
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(46),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('Critical',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: ScreenUtil().setSp(32))),
                          Text(favr[i].critical.toString(),
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(46),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Deaths',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: ScreenUtil().setSp(32))),
                          Text(
                              "+${((favr[i].todayDeaths / favr[i].deaths) * 100).toStringAsFixed(1)}%",
                              style: TextStyle(
                                  color: Colors.red[400],
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(favr[i].deaths.toString(),
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(46),
                                  fontWeight: FontWeight.w600)),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text("+${favr[i].todayDeaths}",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(46),
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red[400])),
                              Text(
                                ' deaths in last 12h',
                                style: TextStyle(color: Colors.red[400]),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
