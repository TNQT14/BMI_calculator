
import 'package:bmi_calculator/localization/app_localization.dart';
import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  static String getLang(String code){
    switch(code){
      case 'en':
        return 'EN';
      case 'vi':
        return 'VI';
      default:
        return 'VI';
    }
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
          return ElevatedButton(
          //   color:  AppColors.appButtonColor,
          //   elevation: 0,
          //   shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(0),
          // ),
          style: ElevatedButton.styleFrom(
            backgroundColor:  AppColors.appButtonColor,
          ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Text(pickerLang[index],
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255))
                  ),
                  ),
                  const SizedBox(height: 40,),
              ],
            ),
            onPressed: (){},
          );
          
        }
        ),
    );
  }
}