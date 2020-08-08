import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutterappnews/models/parser.dart';
import 'package:webfeed/webfeed.dart';
import 'chargement.dart';
import 'liste.dart';
import 'grille.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  RssFeed feed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parse();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  feed = null;
                  parse();
                });
              })
        ],
      ),
      body: choixDuBody(),
    );
  }

  Widget choixDuBody() {
    if (feed == null) {
      return new Chargement();
    } else {
      Orientation orientation = MediaQuery.of(context).orientation;
      if (orientation == Orientation.portrait) {
        //Liste
        return new Liste(feed);
      } else {
        //Grille
        return new Grille(feed);
      }
    }
  }

  Future<Null> parse() async {
    RssFeed recu = await Parser().chargerRSS();
    if (recu != null) {
      setState(() {
        feed = recu;
        print(feed.items.length);
        feed.items.forEach((feedItem) {
          RssItem item = feedItem;
          print(item.title);
          print(item.description);
          print(item.pubDate);
          print(item.enclosure.url);
        });
      });
    }
  }
}