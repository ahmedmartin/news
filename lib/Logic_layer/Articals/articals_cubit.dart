import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Core/Constants/EndPoint.dart';
import 'package:news_app/Core/Constants/Errors.dart';
import 'package:news_app/Data_layer/Models/NewsModel.dart';
import 'package:news_app/Data_layer/remote_connection/Dio_helper.dart';

part 'articals_state.dart';

class ArticalsCubit extends Cubit<ArticalsState> {
  ArticalsCubit() : super(ArticalsInitial());

  getArticals() async {
    emit(ArticalsLoading());

    if(await _hasNetwork())
{
    var responses = await Future.wait([
      DioHelper.getData(url: GetArticals1).onError((error, stackTrace) {}),
      DioHelper.getData(url: GetArticals2).onError((error, stackTrace) {}),
    ]);
    List<Articles> articals = <Articles>[
      if (responses[0] != null)
        ...NewsModel.fromJson(responses[0]?.data).articles!,
      if (responses[1] != null)
        ...NewsModel.fromJson(responses[1]?.data).articles!,
    ];

    

    if (responses[0] != null||responses[1] != null) {
      emit(ArticalsLoaded(articals: articals));
    } else {
      emit(ArticalsError(message: serverError));
    }
    
    }else{
      emit(ArticalsError(message: networkError));
    }

  }

  Future<bool> _hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}
}
