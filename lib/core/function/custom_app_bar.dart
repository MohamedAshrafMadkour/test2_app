import 'package:flutter/material.dart';
import 'package:test2_app/features/home/data/models/laptops_model.dart';

AppBar customAppBar(BuildContext context, LaptopsModel laptop) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_outlined),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(
      laptop.name ?? '',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.greenAccent,
      ),
    ),
    centerTitle: true,
  );
}
