import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:lazy_loading/cubit/appcubit.dart';
import 'package:lazy_loading/cubit/appstates.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';
List<String> dropdownItems=List.generate(100, (index) =>'items $index ');
var selectedValue ;
class LazyLoadingDropDown extends StatelessWidget {
  const LazyLoadingDropDown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
listener: (context , state) {},

    builder: (context, state){return Scaffold(
      appBar: AppBar(title:  const Text( 'DropDownLazyLoading '),),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dropDown(context: context)



          ],
        ),
      )
    );},
    );
  }
}
Widget dropDown({required context})=>DropdownButtonFormField(
  itemHeight: 50,
  isExpanded: true,
  menuMaxHeight: 100,

  hint: const Text('Choose Your Item'),
  decoration: InputDecoration(
    border: const OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(

      borderSide: const BorderSide(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(5),
    ),


    filled: false,
  ),
  value: selectedValue,
  onChanged: (newValue) {
    AppCubit.get(context).dropDownChange(
        newValue: newValue,
        selectedValue: selectedValue ?? const Text('Click to choose'));
  },
  items: dropdownItems.map((String items) {
    return DropdownMenuItem(
      value: items,
      child: Text(items)

    );
  }).toList(),

);
