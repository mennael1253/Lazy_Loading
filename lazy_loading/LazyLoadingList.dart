import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:lazy_loading/cubit/appcubit.dart';
import 'package:lazy_loading/cubit/appstates.dart';
//lazy load in list view


class LazyLoadingList extends StatelessWidget {
  const LazyLoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit ,AppStates>(
      builder: (context , state){ return Scaffold(
        appBar: AppBar(),
        body: LazyLoadScrollView(
          isLoading: AppCubit.get(context).isLoading,
          onEndOfPage: () => AppCubit.get(context).loadMore(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 50,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: AppCubit.get(context).numData.length,
                        itemBuilder: (context, index) {
                          return Center(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Item ${index+1}'),
                          ));
                        })),
                if(state is IsLoadingTrueSate)
                LinearProgressIndicator(),
              ],
            ),
          ),
        ),

      );},
      listener: (context , state){},

    );
  }
}

