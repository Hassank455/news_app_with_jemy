import 'package:flutter/material.dart';
import 'package:news_app_with_jemy/core/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  Article? article;

  DetailsScreen({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(article!.title!.substring(0, 15)),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${article!.urlToImage}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article!.title ?? 'title',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 30),
                  Text(
                    article!.title ?? 'title',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 30),
                  Text("${article!.publishedAt ?? 'publishedAt'}"),
                  SizedBox(height: 30),
                  Text(article!.description ?? 'description'),
                  SizedBox(height: 30),
                  Text(article!.content ?? 'content'),
                  SizedBox(height: 30),
                  GestureDetector(
                      onTap: ()async {
                        if(await canLaunch(article!.url!)){
                          await launch(article!.url!);
                        }else{
                          throw 'Could not launch url';
                        }
                      }, child: Text('More Details here',style: TextStyle(color: Colors.blue),),),
                ],
              ),
            ),
          ],
        ));
  }
}
