import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_jemy/core/models/news_model.dart';
import 'package:news_app_with_jemy/views/sports/states/sports_states.dart';
import 'package:news_app_with_jemy/widgets/build_news_item.dart';
import 'package:news_app_with_jemy/widgets/divider.dart';

import 'controllers/sports_controller.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsModel? newsModelSports;
    return BlocConsumer<SportsCubit, SportsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          newsModelSports = SportsCubit.get(context).newsModelSports;
          // return listItemBuilderSports(context,newsModelSports!.articles);
          return newsModelSports != null
              ? (newsModelSports!.articles!.length > 0)
                  ? ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildNewsItem(
                        context,
                        newsModelSports!.articles![index],
                      ),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: 10,
                    )
                  : Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Center(child: CircularProgressIndicator()),
                );
        });
  }
}
