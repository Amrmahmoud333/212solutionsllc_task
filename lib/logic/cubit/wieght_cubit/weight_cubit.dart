import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:task_212solutionsllc/data/firebase/weight.dart';

part 'weight_state.dart';

class WeightCubit extends Cubit<WeightState> {
  WeightRepo weightRepo;
  WeightCubit({required this.weightRepo}) : super(WeightInitial());

  Future<void> registerNewWeight({required double newWeight}) async {
    emit(RegisterNewWeightLoadingState());
    try {
      final response = await weightRepo.registerNewWeight(newWeight);
      emit(RegisterNewWeightSccuessState());
    } on FirebaseAuthException {
      emit(RegisterNewWeightErrorState());
    } catch (error) {
      print('error');
    }
  }
}
