import 'package:flutter/material.dart';

homeAppBar() => AppBar(
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 40,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Just News',
            style: TextStyle(
              fontFamily: 'Ubuntu',
            ),
          ),
        ],
      ),
    );
