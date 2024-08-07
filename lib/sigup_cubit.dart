import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sigup_state.dart';

class SigupCubit extends Cubit<SigupState> {
  SigupCubit() : super(SigupInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void onPressedConfirmPassword(BuildContext context) {
    if (formkey.currentState!.validate()) {
      Navigator.push(context, 'RegesterationPage' as Route<Object?>);
    } else {
      print("invalid inputs");
    }
  }
}
