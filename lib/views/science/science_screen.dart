import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_jemy/core/models/news_model.dart';
import 'package:news_app_with_jemy/views/science/states/science_states.dart';
import 'package:news_app_with_jemy/widgets/build_news_item.dart';
import 'package:news_app_with_jemy/widgets/divider.dart';

import 'controllers/science_controller.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsModel? newsModelScience;
    return BlocConsumer<ScienceCubit, ScienceStates>(
        listener: (context, state) {},
        builder: (context, state) {
          newsModelScience = ScienceCubit.get(context).newsModelScience;
          // return listItemBuilderScience(context,newsModelScience!.articles);
          return newsModelScience != null
              ? (newsModelScience!.articles!.length > 0)
                  ? ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildNewsItem(
                        context,
                        newsModelScience!.articles![index],
                      ),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: newsModelScience!.articles!.length,
                    )
                  : Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Center(child: CircularProgressIndicator()),
                );
        });
  }
}
