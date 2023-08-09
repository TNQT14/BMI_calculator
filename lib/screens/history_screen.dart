import 'dart:convert';

import 'package:bmi_calculator/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  Future<List<String>> getResultData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> saveList = prefs.getStringList('saveList')??[];
    return saveList;
  }

  //Clear all Data
  Future<void> deleteAll () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center( child: Text(context.localize('label_history'))),
        elevation: 0,
        actions: [
          IconButton(onPressed: () async{
            setState(() {
              deleteAll();
            });
          },
           icon: const Icon(Icons.delete_forever),
           ),
        ],
      ),
      body: FutureBuilder(
        future: getResultData(),
        builder: (_, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              List<String> resultList = snapshot.data ?? [];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: resultList.isEmpty ? buildEmptyView() : buidListView(resultList),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      );
  }

  Widget buildEmptyView(){
    return Center(
      child: Text("Empty!",
      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 20)));
  }

  Widget buidListView(List<String> resultList){
    return ListView.separated(
      itemBuilder: (_, index){
        String result = resultList[index];
        var resultItems = jsonDecode(result);
        return Card(
          shadowColor:  const Color(0xFF7776fe),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tileColor: Color(
              int.parse(
                resultItems['statusColor'],
                radix: 16,
              ),
            ).withOpacity(0.3),
            title: Text(resultItems['status']),
            subtitle: Text(resultItems['formatDate']),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            leading: Text(
              resultItems['bmi'],
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color(0xff5e5f61)),
            ),
          ),
        );
      },
      separatorBuilder: (_,index){
        return const SizedBox(height: 18,);
      },
      itemCount: resultList.length
      );
  }
}