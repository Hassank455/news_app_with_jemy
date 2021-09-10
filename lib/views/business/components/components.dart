import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_with_jemy/core/models/news_model.dart';
import 'package:news_app_with_jemy/widgets/build_news_item.dart';
import 'package:news_app_with_jemy/widgets/divider.dart';

Widget listItemBuilderBusiness(context, list) {
  return (list.length > 0)
      ? ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildNewsItem(
            context,
            list[index],
          ),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: 10,
        )
      : Center(child: CircularProgressIndicator());
}
