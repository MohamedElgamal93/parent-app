import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';


class DropDownSearch<T> extends StatelessWidget {
  String? hint;
 bool? showUnbderLine;
  List<T> items;
  final ValueChanged<T?>? voidCallback;

  DropDownSearch(
      {Key? key, required this.hint, required this.items,this.showUnbderLine,    required this.voidCallback,
})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
     
          DropdownSearch<T>(
              mode: Mode.MENU,
           
              items: items,
              hint: hint,
              popupElevation:3,
              showSearchBox: true,
      dropdownSearchDecoration: const InputDecoration(
        hintStyle: TextStyle(fontSize: 11),
      
                border: OutlineInputBorder(
                  borderSide:BorderSide.none
                  ),
              ),
               onChanged: voidCallback,

             
            
          ),
          showUnbderLine==true ?
          const Divider(thickness:1.0,color:Colors.grey):const SizedBox()

        ],
      ),
    );
  }
}
