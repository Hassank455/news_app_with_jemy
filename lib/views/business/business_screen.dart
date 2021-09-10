import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_jemy/views/business/controllers/controllers.dart';
import 'package:news_app_with_jemy/views/business/states/states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessCubit, BusinessStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(child: Text('Business Screen'));
        });
  }
}
