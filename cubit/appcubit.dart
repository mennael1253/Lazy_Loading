

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_loading/cubit/appstates.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);



  //drop down change
  dropDownChange({required selectedValue  ,required newValue}){



    selectedValue = newValue!;
    emit(DropDownChangeState());

  }

  //load more
  bool isLoading = false;
  final int increment = 10;
  List<int> numData = [];
  Future loadMore() async {

    isLoading = true;
    emit(IsLoadingTrueSate());


    numData.addAll(
        List.generate(increment, (index) => numData.length + index));


    isLoading = false;
    emit(IsLoadingFalseSate());

  }



}


