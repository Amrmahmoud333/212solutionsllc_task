import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:task_212solutionsllc/data/firebase/authentication.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  Authentication authentication;
  AuthenticationCubit({required this.authentication})
      : super(AuthenticationInitial());

  Future signIn({required String email, required String password}) async {
    emit(SignInLoadingState());
    try {
      final response =
          await authentication.signIn(email: email, password: password);
      emit(SignInSccuessState());
    } on FirebaseAuthException {
      emit(SignInErrorState());
    } catch (error) {
      print(error);
    }
  }
}
