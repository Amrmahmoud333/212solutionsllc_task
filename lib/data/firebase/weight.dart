import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_212solutionsllc/data/models/weight_model.dart';

class WeightRepo {
  Future<void> registerNewWeight(double weightValue) async {
    CollectionReference weights =
        FirebaseFirestore.instance.collection('weights');

    String createAt = DateTime.now().toIso8601String();

    final weight = WeightModel(value: weightValue, date: createAt);
    weights.add(weight.toJson());
  }

  Stream<QuerySnapshot> getWeights() {
    return FirebaseFirestore.instance.collection('weights').snapshots();
  }
}
