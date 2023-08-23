import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data_layer/remote_connection/Dio_helper.dart';
import 'package:news_app/Logic_layer/Articals/articals_cubit.dart';
import 'package:news_app/presentation_layer/Screens/Home.dart';

void main() {
  runApp(const MyApp());

  DioHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>ArticalsCubit(),lazy: true,)
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
