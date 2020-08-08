import 'package:flutter/material.dart';
import 'texteCodabee.dart';
import 'package:flutterappnews/models/date_convertisseur.dart';
import 'package:webfeed/webfeed.dart';
import 'page_detail.dart';

class Grille extends StatefulWidget {
  RssFeed feed;

  Grille(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _GrilleState createState() => new _GrilleState();


}

class _GrilleState extends State<Grille>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GridView.builder(
        itemCount: widget.feed.items.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          RssItem item = widget.feed.items[i];
          return new InkWell(
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                  return new PageDetail(item);
                }));
              },
              child: new Card(
                elevation: 10.0,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new TexteCodabee(item.author),
                        new TexteCodabee(DateConvertisseur().convertirDate(item.pubDate), color: Colors.red,)
                      ],
                    ),
                    new TexteCodabee(item.title),
                    new Card(
                      elevation: 7.5,
                      child: new Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: new Image.network(item.enclosure.url, fit:  BoxFit.fill,),
                      ),
                    )

                  ],
                ),
              )
          );

        });
  }
}