import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_212solutionsllc/views/add_weight/screen/add_weight.dart';
import 'package:task_212solutionsllc/views/home_page/widget/weight_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
// ElevatedButton.icon(
    //     onPressed: () => FirebaseAuth.instance.signOut(),
    //     icon: const Icon(Icons.arrow_back),
    //     label: const Text('log out')),
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Tracker'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 221, 59, 116),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return const WeightListItem();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 5,
      ),
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
