import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_loading/cubit/appcubit.dart';
import 'package:lazy_loading/lazy_loading/lazy_loading.dart';
import 'package:lazy_loading/LazyLoadingList.dart';

import 'cubit/bloc_observer.dart';


void main()  {



  BlocOverrides.runZoned(
        () {



          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..loadMore(),
      child: const MaterialApp(

debugShowCheckedModeBanner: false,
        home:
        //LazyLoadingDropDown(),
       LazyLoadingList()   , ),
    );
  }
}



