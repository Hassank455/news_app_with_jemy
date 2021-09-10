import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_with_jemy/core/models/news_model.dart';
import 'package:news_app_with_jemy/widgets/divider.dart';

Widget buildItemBusiness(context, Article? article) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            image: DecorationImage(
              image: NetworkImage('${article!.urlToImage}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article.title}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article.publishedAt}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
      ],
    ),
  );
}

Widget listItemBuilderBusiness(context, list) {
  return (list.length > 0)
      ? ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildItemBusiness(
            context,
            list[index],
          ),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: 10,
        )
      : Center(child: CircularProgressIndicator());
}
