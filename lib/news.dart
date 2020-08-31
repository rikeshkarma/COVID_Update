import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool nloading = true;
  var data;
  var news;

  _launchURL(String website) async{
    var url = '$website';
    if (await canLaunch(url)){
      await launch(url);
    } else {
      throw 'could not launch $url';
    }
  }

  //for getting news

  Future getLatestNews() async{
    String url ="https://nepalcorona.info/api/v1/news";
    var response = await http.get(Uri.encodeFull(url),headers:{'Accept':'application/json'});
    var jsonData = json.decode(response.body);

    setState(() {
      news = jsonData['data'];
      nloading =false;
      print(data);

    });
  }

  @override
  void initState() {
        super.initState();
    getLatestNews();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Latest Corona News In Nepal"),) ,
      body: nloading == true ? Center(child: CircularProgressIndicator(),):SingleChildScrollView(
        child: Column(
            children: <Widget>[

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: news.length,
                itemBuilder: (context,index){
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(news[index]['image_url']),
                        ListTile(
                          title: Text(news[index]['title'],style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(news[index]['summary']),
                              OutlineButton(
                                onPressed: () async {
                                  _launchURL(news[index]['url']);
                                },
                                child: Text('Read More'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )

              ]
        ),
      ),
    );
     }
}
