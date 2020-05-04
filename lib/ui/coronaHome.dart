import 'dart:async';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:covid19/bloc/corona_bloc.dart';
import 'package:covid19/ui/homeScreen.dart';
import 'package:covid19/ui/precautionScreen.dart';
import 'package:covid19/ui/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './favouriteScreen.dart';
import 'package:firebase_admob/firebase_admob.dart';

class CoronaHome extends StatefulWidget {
  @override
  _CoronaHomeState createState() => _CoronaHomeState();
  
}

class _CoronaHomeState extends State<CoronaHome> {
  Completer<void> _refreshCompleter;
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    BlocProvider.of<CoronaBloc>(context).add(FetchDetails());
    _refreshCompleter = Completer<void>();
    _pageController = PageController();
    super.initState();
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> data = ['Ongoing', 'Recovered', 'Death'];
    return Material(
      child: Center(
        child: BlocConsumer<CoronaBloc, CoronaState>(
          listener: (context, state) {
            if (state is CoronaLoaded) {
              _refreshCompleter?.complete();
              _refreshCompleter = Completer();
            }
          },
          builder: (context, state) {
            if (state is CoronaLoading) {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'img/friends.png',
                          fit: BoxFit.cover,
                        ),
                        CupertinoActivityIndicator(
                          radius: 20,
                        )
                      ],
                    ),
                  ));
            }
            if (state is CoronaLoaded) {
              final resList = state.resList;
              resList.sort((a, b) => b.confirmed.compareTo(a.confirmed));
              Map<String, double> dataMap = state.latest;
              print(dataMap);
              double sum =
                  dataMap['Recovered'] + dataMap['Ongoing'] + dataMap['Death'];
              return Scaffold(
                body: SizedBox.expand(
                  child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() => _currentIndex = index);
                      },
                      children: <Widget>[
                        HomeScreen(
                            dataMap: dataMap,
                            data: data,
                            sum: sum,
                            refreshCompleter: _refreshCompleter),
                        Search(
                          resList: resList,
                        ),
                        FavouriteScreen(resList: resList),
                        Precaution(resList: resList),
                        
                      ]),
                ),
                bottomNavigationBar: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: BottomNavyBar(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    selectedIndex: _currentIndex,
                    showElevation: false,
                    onItemSelected: (index) => setState(() {
                      _currentIndex = index;
                      _pageController.animateToPage(index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                    }),
                    items: [
                      BottomNavyBarItem(
                        textAlign: TextAlign.center,
                        icon: Icon(Icons.apps),
                        title: Text('Home'),
                        activeColor: Colors.blue[900],
                      ),
                      BottomNavyBarItem(
                          textAlign: TextAlign.center,
                          icon: Icon(Icons.search),
                          title: Text('Search'),
                          activeColor: Colors.blue[900]),
                      BottomNavyBarItem(
                          textAlign: TextAlign.center,
                          icon: Icon(Icons.star),
                          title: Text('Watchlist'),
                          activeColor: Colors.blue[900]),                      
                      BottomNavyBarItem(
                          textAlign: TextAlign.center,
                          icon: Icon(Icons.security),
                          title: Text('Prevention'),
                          activeColor: Colors.blue[900]),

                    ],
                  ),
                ),
              );
            }
            if (state is CoronaError) {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'img/home_cinema.png',
                          fit: BoxFit.cover,
                        ),
                        Text('Internet Is Down'),
                        SizedBox(
                          height: 20,
                        ),
                        FloatingActionButton.extended(
                            onPressed: () {
                              BlocProvider.of<CoronaBloc>(context)
                                  .add(FetchDetails());
                              _refreshCompleter.future;
                            },
                            icon: Icon(Icons.refresh),
                            label: Text('Retry')),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
