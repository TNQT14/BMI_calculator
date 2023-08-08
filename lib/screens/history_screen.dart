import 'dart:convert';

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
        title: const Text("HISTORY"),
        elevation: 0,
        actions: [
          IconButton(onPressed: () async{
            deleteAll();
          },
           icon: const Icon(Icons.delete_forever),
           ),
        ],
      ),
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
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
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