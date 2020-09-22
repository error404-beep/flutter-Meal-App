import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    //This const is required as property can't be changed after they have been created.
    @required this.id,
    this.color = Colors.orange,
    @required this.title,
  });
}
