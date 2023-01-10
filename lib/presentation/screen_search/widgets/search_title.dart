import 'package:flutter/material.dart';

class SearchTitle extends StatelessWidget {
  const SearchTitle(
    this.title, {
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
