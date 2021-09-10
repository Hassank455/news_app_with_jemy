import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_jemy/core/models/news_model.dart';
import 'package:news_app_with_jemy/views/health/states/health_states.dart';
import 'package:news_app_with_jemy/widgets/build_news_item.dart';
import 'package:news_app_with_jemy/widgets/divider.dart';

import 'controllers/health_controller.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsModel? newsModelHealth;
    return BlocConsumer<HealthCubit, HealthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          newsModelHealth = HealthCubit.get(context).newsModelHealth;
          // return listItemBuilderHealth(context,newsModelHealth!.articles);
          return newsModelHealth != null
              ? (newsModelHealth!.articles!.length > 0)
                  ? ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildNewsItem(
                        context,
                        newsModelHealth!.articles![index],
                      ),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: newsModelHealth!.articles!.length,
                    )
                  : Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Center(child: CircularProgressIndicator()),
                );
        });
  }
}
