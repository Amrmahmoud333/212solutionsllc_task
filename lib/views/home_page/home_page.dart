import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_212solutionsllc/data/firebase/weight.dart';
import 'package:task_212solutionsllc/logic/cubit/wieght_cubit/weight_cubit.dart';
import 'package:task_212solutionsllc/views/add_weight/screen/add_weight.dart';
import 'package:task_212solutionsllc/views/home_page/widget/weight_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Tracker'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 221, 59, 116),
        actions: [
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 221, 59, 116),
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('log out')),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: WeightRepo().getWeights(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            } else {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  String date = data['date'].toString();
                  return ListTile(
                    title: Text(date.substring(0, 10)),
                    subtitle: Text(data['weight'].toString()),
                  );
                }).toList(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 221, 59, 116),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => AddWeight())));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
