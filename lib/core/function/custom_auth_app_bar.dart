import 'package:flutter/material.dart';

AppBar customAuthAppBar({required String title}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
  );
}
