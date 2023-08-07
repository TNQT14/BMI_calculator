import 'dart:convert';

import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HISTORY"),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){},
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