
import 'package:covidwatch/news%20articles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  final Article article;

  const NewsDetails({Key key, this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(article.imagePath),
                SizedBox(height: MediaQuery.of(context).size.height*0.12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Text(article.details,style: TextStyle(color: Colors.white,fontSize: 18),),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromRGBO(47,79,79,1)
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("APS",style: TextStyle(color: Colors.red),),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(article.title,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("December 12,2019",style: TextStyle(color: Colors.white.withOpacity(0.5)),),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
