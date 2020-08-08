import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'texteCodabee.dart';
import 'package:flutterappnews/models/date_convertisseur.dart';
import 'page_detail.dart';

class Liste extends StatefulWidget {
  RssFeed feed;

  Liste(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _ListeState createState() => new _ListeState();


}

class _ListeState extends State<Liste> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final taille = MediaQuery.of(context).size.width / 2.5;
    return new ListView.builder(
        itemCount: widget.feed.items.length,
        itemBuilder: (context, i) {
          RssItem item = widget.feed.items[i];
          return new Container(
            child: new Card(
                elevation: 10.0,
                child: new InkWell(
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                      return new PageDetail(item);
                    }));
                  },
                  child: new Column(
                    children: <Widget>[
                      padding(),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new TexteCodabee(item.author),
                          new TexteCodabee(new DateConvertisseur().convertirDate(item.pubDate), color: Colors.red,)
                        ],
                      ),
                      padding(),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Card(
                            elevation: 7.5,
                            child: new Container(
                              width: taille,
                              child: new Image.network(item.enclosure.url, fit: BoxFit.fill,),
                            ),
                          ),
                          new Container(
                            width: taille,
                            child: new TexteCodabee(item.title),
                          )
                        ],

                      ),
                      padding(),
                    ],
                  ),
                )


            ),
            padding: EdgeInsets.only(right: 7.5, left: 7.5),
          );
        });
  }

  Padding padding() {
    return new Padding(padding: EdgeInsets.only(top: 10.0));
  }
}