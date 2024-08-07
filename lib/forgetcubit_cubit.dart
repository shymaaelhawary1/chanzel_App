import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'forgetcubit_state.dart';

class ForgetcubitCubit extends Cubit<ForgetcubitState> {
  ForgetcubitCubit() : super(ForgetcubitInitial());
  TextEditingController emailControllerfor = TextEditingController();

  TextEditingController passwordControllerfor1 = TextEditingController();
  TextEditingController passwordControllercon = TextEditingController();
}
