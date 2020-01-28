import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


List<String> dataList;
TextEditingController _control;

void main(){
 runApp(MaterialApp(
   home: Scaffold(
     body: SafeArea(
       child: MyApp(),
     ),
   ),
 ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {

    _control = new TextEditingController();

    dataList = [
      'america',
      'australia',
      'austria',
      'ireland',
      'india',
      'iceland',
      'jordan',
      'japan',

    ];
  }

  List filteredList(String query){
    List<String> filterList = new List();

    for(int i=0; i<dataList.length; i++){
      var item = dataList[i];

      if(item.contains(query)){
        filterList.add(item);
      }
    }
    return filterList;
  }

  /// its working fine thank you thats all
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: TypeAheadFormField(
        textFieldConfiguration:  TextFieldConfiguration(
          controller: _control,
        ),

        suggestionsCallback: (pattern){
          return filteredList(pattern);
        },

        itemBuilder: (context,suggestion){
          return ListTile(
            title: Text(suggestion),
          );
        },
        transitionBuilder: (context,suggestionBox,controller){
          return suggestionBox;
        },
        onSuggestionSelected: (suggestion){
          _control.text = suggestion;
          print(suggestion);

        },
      ),
    );
  }


}







