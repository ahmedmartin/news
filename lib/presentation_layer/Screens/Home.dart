import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Constants/EndPoint.dart';
import 'package:news_app/Core/Constants/Text.dart';
import 'package:news_app/Logic_layer/Articals/articals_cubit.dart';
import 'package:news_app/presentation_layer/Screens_widget/Home/Artical_list_item.dart';
import 'package:news_app/presentation_layer/Screens_widget/Home/Drawer_layout.dart';
import 'package:news_app/presentation_layer/Shared_widgets.dart/Error_try_again.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  late ArticalsCubit articalsCubit;

  @override
  void initState() {
    articalsCubit = BlocProvider.of<ArticalsCubit>(context);
    articalsCubit.getArticals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(appBarTitle),
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          Image.asset(
            'assets/listing/search.png',
            width: 20,
            height: 20,
          )
        ],
      ),
      drawer: DrawerLayout(),
      body: BlocBuilder<ArticalsCubit, ArticalsState>(
        bloc: articalsCubit,
        builder: (context, state) {
          if (state is ArticalsLoaded) {
            return ListView.builder(
              itemCount: state.articals.length,
              itemBuilder: (context, index) {
                return ArticalListItem(
                  article: state.articals[index],
                );
              },
            );
          } else if (state is ArticalsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ArticalsError) {
            return ErrorTryAgain(
              errorMessage: state.message,
              onTap: () {
                articalsCubit.getArticals();
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
