import 'dart:async';

import 'package:covid19/bloc/corona_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
    @required this.dataMap,
    @required this.data,
    @required this.sum,
    @required this.refreshCompleter,
  }): super(key: key);

  final Map < String, double > dataMap;
  final List < String > data;
  final double sum;
  final Completer refreshCompleter;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool expanded = true;
  AnimationController controller;

  @override
  void initState() { 
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3300),
      reverseDuration: Duration(milliseconds: 10),
    );
    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      color: Colors.white,
      child: ListView(
        children: < Widget > [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: < Widget > [
                  SizedBox(width: ScreenUtil().setWidth(350), child: Text("Today's Report", style: TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(44), fontWeight: FontWeight.w600), )),
                  SizedBox(
                    width: ScreenUtil().setWidth(210),
                    height: ScreenUtil().setHeight(65),
                    child: FloatingActionButton.extended(
                      elevation: 0,
                      // icon: AnimatedIcon(
                      //   icon: AnimatedIcons.play_pause,
                      //   progress: controller,
                      //   semanticLabel: 'Show menu',
                      // ),
                      icon: RotationTransition(
                        child: Icon(Icons.refresh, size: ScreenUtil().setSp(36),),
                        turns: new Tween(begin: 0.0, end: 3.0).animate(controller),
                      ),
                      backgroundColor: Colors.blue[900],
                      label: Text('Refresh', style: TextStyle(fontSize: ScreenUtil().setSp(26)),),
                      onPressed: () {
                        BlocProvider.of < CoronaBloc > (context).add(RefreshDetails());
                        setState(() {
                          controller.forward().then((_) {
                            controller.reverse();
                          });
                        });
                        return widget.refreshCompleter.future;
                      },
                    ),
                  ),
                ],
              ),
          ),
          SizedBox(height: 30, ),
          Center(child: Text('COVID-19 Global Cases', style: TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.w500), )),
          SizedBox(height: 30, ),
          Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: < Widget > [
              PieChart(
                dataMap: widget.dataMap,
                chartType: ChartType.disc,
                chartRadius: ScreenUtil().setWidth(350),
                //showChartValuesOutside: true,
                chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.transparent,
                ),
                showLegends: false,
                showChartValues: false,
                colorList: [
                  Colors.red,
                  Colors.blue[700],
                  Colors.green,
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.data.map((d) => Container(
                  child: Row(
                    children: < Widget > [
                      Container(
                        decoration: BoxDecoration(
                          color: d == 'Death' ? Colors.red : d == 'Recovered' ? Colors.green : Colors.blue[700],
                          borderRadius: BorderRadius.circular(30)
                        ),
                        width: ScreenUtil().setWidth(45), height: ScreenUtil().setHeight(15), ),
                      SizedBox(width: 20, ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: < Widget > [
                          SizedBox(height: 15, ),
                          Text(d, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(24))),
                          Text((widget.dataMap[d] / widget.sum * 100).toStringAsFixed(0) + '%', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(24)), )
                        ],
                      )
                    ],
                  ),
                )).toList()
              )
            ],
          )),
          SizedBox(height: 30, ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 20,
                  children: < Widget > [
                    Container(
                      width: 0.45 * MediaQuery.of(context).size.width,
                      height: ScreenUtil().setHeight(180),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey[500]
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: < Widget > [
                          Row(
                            children: < Widget > [
                              ClipRRect(borderRadius: BorderRadius.circular(20), child: Container(color: Colors.blue[700], width: 10, height: 10, )),
                              SizedBox(width: 5, ),
                              Text('Confirmed', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                            ]
                          ),
                          SizedBox(height: 10, ),
                          Text((widget.dataMap['Ongoing'] + widget.dataMap['Recovered']).toStringAsFixed(0), style: TextStyle(fontSize: ScreenUtil().setSp(64), fontWeight: FontWeight.w500), )
                        ]
                      )
                    ),
                    Container(
                      width: 0.45 * MediaQuery.of(context).size.width,
                      height: ScreenUtil().setHeight(180),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey[500],
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: < Widget > [
                          Row(
                            children: < Widget > [
                              ClipRRect(borderRadius: BorderRadius.circular(20), child: Container(color: Colors.green, width: 10, height: 10, )),
                              SizedBox(width: 5, ),
                              Text('Recovered', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
                            ]
                          ),
                          SizedBox(height: 10, ),
                          Text(widget.dataMap['Recovered'].toStringAsFixed(0), style: TextStyle(fontSize: ScreenUtil().setSp(64), fontWeight: FontWeight.w500), )
                        ]
                      )
                    ),
                    Container(
                      width: 0.45 * MediaQuery.of(context).size.width,
                      height: ScreenUtil().setHeight(180),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey[500],
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: < Widget > [
                          Row(
                            children: < Widget > [
                              ClipRRect(borderRadius: BorderRadius.circular(20), child: Container(color: Colors.red, width: 10, height: 10, )),
                              SizedBox(width: 5, ),
                              Text('Death', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
                            ]
                          ),
                          SizedBox(height: 10, ),
                          Text(widget.dataMap['Death'].toStringAsFixed(0), style: TextStyle(fontSize: ScreenUtil().setSp(64), fontWeight: FontWeight.w500), )
                        ]
                      )
                    ),
                    Container(
                      width: 0.45 * MediaQuery.of(context).size.width,
                      height: ScreenUtil().setHeight(180),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey[500],
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: < Widget > [
                          Row(
                            children: < Widget > [
                              ClipRRect(borderRadius: BorderRadius.circular(20), child: Container(color: Colors.blue[900], width: 10, height: 10, )),
                              SizedBox(width: 5, ),
                              Text('Ongoing', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
                            ]
                          ),
                          SizedBox(height: 10, ),
                          Text((widget.dataMap['Ongoing']).toStringAsFixed(0), style: TextStyle(fontSize: ScreenUtil().setSp(64), fontWeight: FontWeight.w500), )
                        ]
                      )
                    )
                  ],
                ),
            )
          ),
          
          
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 20, ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: < Widget > [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: < Widget > [
                    Text('Stay Strong', style: TextStyle(fontSize: ScreenUtil().setSp(48), fontWeight: FontWeight.bold, color: Colors.black87), ),
                    SizedBox(height: 10, ),
                    Text('Let fight this together', style: TextStyle(color: Colors.grey[400], fontSize: ScreenUtil().setSp(24), fontWeight: FontWeight.w600), ),
                    SizedBox(height: 10, ),
                    Text('#letsDefeatCorona', style: TextStyle(color: Colors.blue[900], fontSize: ScreenUtil().setSp(24), letterSpacing: 1, fontWeight: FontWeight.w600), )
                  ],
                ),
                Image.asset('img/worldIsMine.png', fit: BoxFit.cover, height: ScreenUtil().setHeight(330), ),
              ],
            )
          )
        ],
      ),
    );
  }
}