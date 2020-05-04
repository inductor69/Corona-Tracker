import 'package:covid19/model/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatefulWidget {
  final List < Result > resList;
  Search({
    @required this.resList
  }): assert(resList != null);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State < Search > {
  List < Result > results = List < Result > ();
  List < Result > _searchResult = [];

  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    _onSearchTextChanged(String text) async {
      _searchResult.clear();
      if (text.isEmpty) {
        setState(() {});
        return;
      }

      widget.resList.forEach((result) {
        if (result.country.toLowerCase().contains(text.toLowerCase())) {
          print(result.country);
          _searchResult.add(result);
        }
      });

      setState(() {});
    }

    results = widget.resList;

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        title: new Text('Coronavirus Report', style: TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(40)), ),
        elevation: 0.0,
      ),
      body: new Column(
        children: < Widget > [
          new Container(
            color: Colors.transparent,
            child: new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: < Widget > [
                    new Card(
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      elevation: 0,
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      child: new ListTile(
                        title: new TextField(
                          autofocus: false,
                          focusNode: FocusNode(canRequestFocus: false, skipTraversal: true),
                          controller: controller,
                          decoration: new InputDecoration(
                            hintText: 'Search country',
                            border: InputBorder.none
                          ),
                          onChanged: (String value) {
                            print(value);
                            _onSearchTextChanged(value);
                          }
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 5,
                      bottom: 5,
                      child: SizedBox(
                        width: 66,
                        height: 66,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          padding: EdgeInsets.all(0),
                          color: Colors.blue[900],
                          onPressed: () {
                            controller.clear();
                            _onSearchTextChanged('');
                          },
                          child: Icon(Icons.clear, color: Colors.white, size: 30, ),
                        ),
                      ),
                    )
                  ],
                ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: < Widget > [
                    Text('Country'.toUpperCase(), style: TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(30), fontWeight: FontWeight.w600), ),
                    Text('Confirmed'.toUpperCase(), style: TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(30), fontWeight: FontWeight.w600), )
                  ],
                ),
            ),
          ),
          new Expanded(
            child:
            (_searchResult.length != 0 || controller.text.isNotEmpty) ?
            new ListView.builder(
              itemCount: _searchResult.length,
              itemBuilder: (context, i) {
                return new ListTile(
                  onTap: () {
                    showMoreDetails(context, i, 0);
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  },
                  title: Text(_searchResult[i].country, style: TextStyle(fontSize: ScreenUtil().setSp(42), fontWeight: FontWeight.w600), ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: < Widget > [
                      Row(
                        children: < Widget > [
                          Text("${_searchResult[i].deaths} ", style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(28)), ),
                          Text(_searchResult[i].todayDeaths == 0 ? " " :  "(+${_searchResult[i].todayDeaths})", style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.w500, fontSize: ScreenUtil().setSp(24)), )
                        ],
                      )
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: < Widget > [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: < Widget > [
                          Text("${_searchResult[i].confirmed}", style: TextStyle(fontSize: ScreenUtil().setSp(48), fontWeight: FontWeight.bold, color: Colors.blue[900]), ),
                          Text(_searchResult[i].todayCases == 0 ? " " : "(+${_searchResult[i].todayCases})", style: TextStyle(fontWeight: FontWeight.w500, fontSize: ScreenUtil().setSp(25), color: _searchResult[i].todayCases == 0 ? Colors.grey[400] : Colors.blue[900]), ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ) :
            new ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, i) {
                return new ListTile(
                  onTap: () {
                    showMoreDetails(context, i, 1);
                  },
                  title: Text(results[i].country, style: TextStyle(fontSize: ScreenUtil().setSp(42) ,fontWeight: FontWeight.w600), ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: < Widget > [
                      Row(
                        children: < Widget > [
                          Text("${results[i].deaths} ", style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(28)), ),
                          Text(results[i].todayDeaths == 0 ? " " : "(+${results[i].todayDeaths})", style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.w500, fontSize: ScreenUtil().setSp(24)), )
                        ],
                      )
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: < Widget > [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: < Widget > [
                          Text("${results[i].confirmed}", style: TextStyle(fontSize: ScreenUtil().setSp(48), fontWeight: FontWeight.bold, color: Colors.blue[900]), ),
                          Text("(+${results[i].todayCases})", style: TextStyle(fontWeight: FontWeight.w500, fontSize: ScreenUtil().setSp(25), color: results[i].todayCases == 0 ? Colors.grey[400] : Colors.blue[900]), ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future showMoreDetails(BuildContext context, int i, int from) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25)
        )
      ),
      context: context, builder: (BuildContext context) {
        return Container(
          height: ScreenUtil().setHeight(550),
          padding: EdgeInsets.only(left: 20, right: 20, ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: < Widget > [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: < Widget > [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(from == 0 ? _searchResult[i].country : results[i].country, style: TextStyle(fontSize: ScreenUtil().setSp(54), fontWeight: FontWeight.bold), ),
                      SizedBox(height: 5,),
                      Text("Active Cases : ${from == 0 ? _searchResult[i].active : results[i].active}", style: TextStyle(color: Colors.grey[600], fontSize: ScreenUtil().setSp(28))),
                    ],
                  ),
                  IconButton(icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 35,), onPressed: () => Navigator.pop(context), )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: < Widget > [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: < Widget > [
                      Text('Confirmed', style: TextStyle(color: Colors.grey[600], fontSize: ScreenUtil().setSp(32))),
                      Text("+${((from == 0 ? _searchResult[i].todayCases/_searchResult[i].confirmed : results[i].todayCases/results[i].confirmed)*100).toStringAsFixed(1)}%", style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: < Widget > [
                      Text(from == 0 ? _searchResult[i].confirmed.toString() : results[i].confirmed.toString(), style: TextStyle(fontSize: ScreenUtil().setSp(46), fontWeight: FontWeight.w600)),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: < Widget > [
                          Text("+${from == 0 ? _searchResult[i].todayCases : results[i].todayCases}", style: TextStyle(fontSize: ScreenUtil().setSp(46), fontWeight: FontWeight.w600, color: Colors.blue[900])),
                          Text(' cases in last 12h', style: TextStyle(color: Colors.blue[900]), )
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
                    children: < Widget > [
                      Text('Recovered', style: TextStyle(color: Colors.grey[600], fontSize: ScreenUtil().setSp(32))),
                      Text(from == 0 ? _searchResult[i].recovered.toString() : results[i].recovered.toString(), style: TextStyle(fontSize: ScreenUtil().setSp(46), fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: < Widget > [
                      Text('Critical', style: TextStyle(color: Colors.grey[600], fontSize: ScreenUtil().setSp(32))),
                      Text(from == 0 ? _searchResult[i].critical.toString() : results[i].critical.toString(), style: TextStyle(fontSize: ScreenUtil().setSp(46), fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: < Widget > [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: < Widget > [
                      Text('Deaths', style: TextStyle(color: Colors.grey[600], fontSize: ScreenUtil().setSp(32))),
                      Text("+${((from == 0 ? _searchResult[i].todayDeaths/_searchResult[i].deaths : results[i].todayDeaths/results[i].deaths)*100).toStringAsFixed(1)}%", style: TextStyle(color: Colors.red[400], fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: < Widget > [
                      Text(from == 0 ? _searchResult[i].deaths.toString() : results[i].deaths.toString(), style: TextStyle(fontSize: ScreenUtil().setSp(46), fontWeight: FontWeight.w600)),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: < Widget > [
                          Text("+${from == 0 ? _searchResult[i].todayDeaths : results[i].todayDeaths}", style: TextStyle(fontSize: ScreenUtil().setSp(46), fontWeight: FontWeight.w600, color: Colors.red[400])),
                          Text(' deaths in last 12h', style: TextStyle(color: Colors.red[400]), )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      });
  }
}