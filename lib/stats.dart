import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  bool loading = true;
  var data;
  var wdata;
  //Total data of Nepal
  Future getLatestUpdate() async{
    String url = "https://nepalcorona.info/api/v1/data/nepal";
    var response = await http.get(url);
    var jsonData = json.decode(response.body);

    setState(() {
      data = jsonData;
      loading = false;
      print(data);
    });
  }

  //World Data
  Future getWorldLatestUpdate() async{
    String url = "https://data.nepalcorona.info/api/v1/world";
    var response = await http.get(url);
    var jsonData = json.decode(response.body);

    setState(() {
      wdata = jsonData;
      print(data);
    });
  }

  @override
  void initState() {
    super.initState();
    getLatestUpdate();
    getWorldLatestUpdate();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("THE LATEST CORONA UPDATE"),),
          body: loading == true ? Center(child: CircularProgressIndicator(),):SingleChildScrollView(
          child: Column(
                children: <Widget>[
                  ListTile(
                title: Text("Nepal Information"),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: Colors.blue.shade100,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text("Total Positive"),
                          Text(data['tested_positive'].toString())

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: Colors.green.shade100,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text("Total Recovered"),
                          Text(data['recovered'].toString())

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: Colors.red.shade100,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text("Total Dead"),
                          Text(data['deaths'].toString())

                        ],
                      ),
                    ),
                  ),
                ],
              ),

              //Second Row
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: Colors.blue.shade100,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text("Total isolation"),
                          Text(data['in_isolation'].toString())

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: Colors.green.shade100,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text("Total Quarantined"),
                          Text(data['quarantined'].toString())

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: Colors.red.shade100,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text("Total Tested"),
                          Text(data['tested_total'].toString())

                        ],
                      ),
                    ),
                  ),
                ],
              ),

              ListTile(
                title: Text('World Information'),
              ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(2),
                          color: Colors.blue.shade100,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text("Total cases"),
                              Text(wdata['cases'].toString())

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(2),
                          color: Colors.green.shade100,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text("Today cases"),
                              Text(wdata['todayCases'].toString())

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(2),
                          color: Colors.red.shade100,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text("Total Deaths"),
                              Text(wdata['deaths'].toString())

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Second Row
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(2),
                          color: Colors.blue.shade100,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text("Total recovered"),
                              Text(wdata['recovered'].toString())

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(2),
                          color: Colors.green.shade100,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text("Total active"),
                              Text(wdata['active'].toString())

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(2),
                          color: Colors.red.shade100,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text("Total Countries"),
                              Text(wdata['affectedCountries'].toString())

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
    ),
    ),
    );
  }
}
