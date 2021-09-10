import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_jemy/core/models/news_model.dart';
import 'package:news_app_with_jemy/views/business/controllers/business_controller.dart';
import 'package:news_app_with_jemy/views/business/states/business_states.dart';
import 'package:news_app_with_jemy/widgets/build_news_item.dart';
import 'package:news_app_with_jemy/widgets/divider.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsModel? newsModelBusiness;
    return BlocConsumer<BusinessCubit, BusinessStates>(
        listener: (context, state) {},
        builder: (context, state) {
          newsModelBusiness = BusinessCubit.get(context).newsModelBusiness;
          // return listItemBuilderBusiness(context,newsModelBusiness!.articles);
          return newsModelBusiness != null
              ? (newsModelBusiness!.articles!.length > 0)
                  ? ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildNewsItem(
                        context,
                        newsModelBusiness!.articles![index],
                      ),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: newsModelBusiness!.articles!.length,
                    )
                  : Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Center(child: CircularProgressIndicator()),
                );
        });
  }
}
