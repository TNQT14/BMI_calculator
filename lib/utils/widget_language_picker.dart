
import 'package:bmi_calculator/localization/app_localization.dart';
import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../main.dart';
import '../routes/routes.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  List<String> getLang(String code){
    return ['vi', 'VN'];
  }

  @override
  State<LanguageWidget> createState() => _LanguageWidget();
}
class _LanguageWidget extends State<LanguageWidget> {
  
  List<String> getLang(String code){
    switch(code){
      case 'English':
        return ['en', 'EN']; 
      case 'Tiếng Việt':
        return ['vi', 'VI'];
      default:
        return ['vi', 'VI'];
    }
  }

  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final locale = Localizations.localeOf(context);
    List<String> pickerLang = ['Tiếng Việt', 'English'];
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localize('label_lang')),
      ),
      body: ListView.builder(
        itemCount: pickerLang.length,
        itemBuilder: (context, index){
          return Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:  AppColors.appButtonColor,
            ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Text(pickerLang[index],
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255))
                    ),
                    ),
                    const SizedBox(height: 40,),
                ],
              ),
              onPressed: (){
                setState(() {
                  List<String> newLang = getLang(pickerLang[index]);
                  print(getLang(pickerLang[index]));
                });

              },
            ),
          );
        }
        ),
    );
  }
  
}