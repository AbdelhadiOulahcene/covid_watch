import 'package:covidwatch/bloc/bloc_navigation/navigation_bloc.dart';
import 'package:covidwatch/news%20articles.dart';
import 'package:covidwatch/newsDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: PageView.builder(
        itemCount: articles.length,
        controller: PageController(viewportFraction: 0.7),
        scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
          return InkWell(
            highlightColor: Colors.white,
            onTap: (){
              Navigator.push(context, PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 1000),
                pageBuilder: (context,_,__)=>NewsDetails(article: articles[index],)
              ));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: NewsArticle(articles: articles,index: index,),
            ),
          );
          }
      ),
    );
  }
}
class NewsArticle extends StatelessWidget {
  final List<Articleab> articles;
  final int index;

  const NewsArticle({Key key, this.articles, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      width: MediaQuery.of(context).size.width*0.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset(articles[index].imagePath,fit: BoxFit.fill,height: MediaQuery.of(context).size.height*0.4,),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white,width: 0.2),
                borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.04),
            Text(articles[index].title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.left,),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            Text(articles[index].core,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.white),)
          ],
        ),
      ),
    );
  }
}


