import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/upload_provider/upload_provider.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UploadProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder(
              stream: provider.recipess.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong',style: TextStyle(color: Colors.grey),));
                }
    
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(color: Colors.red,));
                }
    
                if (snapshot.data!.size == 0) {
                  return const Center(child: Text("No records found",style: TextStyle(color: Colors.grey),));
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          "${index + 1} ${snapshot.data!.docs[index]['fav_songs']}",style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                      
                    );
                  },
                );
              }),
        ),
    );
  }
}
