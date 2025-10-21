import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_app/core/helper/get_it_setup.dart';
import 'package:test2_app/core/service/bloc_observe.dart';
import 'package:test2_app/features/home/presentation/views/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getItSetup();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Test2App());
}

class Test2App extends StatelessWidget {
  const Test2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laptop App',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const MainView(),
    );
  }
}
