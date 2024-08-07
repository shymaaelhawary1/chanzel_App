import 'package:chanzel_app/forgetcubit_cubit.dart';
import 'package:chanzel_app/validation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RequiredWidgwtPass extends StatelessWidget {
  RequiredWidgwtPass({super.key, required this.controller});

  final ForgetcubitCubit controller;
  // TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        child: Text(
          "PassWord  ",
          style: TextStyle(
            color: Color.fromARGB(137, 225, 11, 139),
            fontSize: 19,
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.passwordControllerfor1,
            keyboardType: TextInputType.name,
            validator: MyValidation().validatePassword,
            /* inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(
                    r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$'),
              ),
              // FilteringTextInputFormatter.deny(RegExp(r'(A-Z)'))
            ],*/
            decoration: decoration.copyWith(
                suffixIcon: const Icon(Icons.lock),
                hintText: "enter your password "),
            obscureText: true,
            obscuringCharacter: '*',
          )),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        child: Text(
          "Confirm Password   ",
          style: TextStyle(
            color: Color.fromARGB(137, 225, 11, 139),
            fontSize: 19,
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.passwordControllercon,
            keyboardType: TextInputType.name,
            validator: MyValidation().validatePassword,
            /* inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(
                    r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$'),
              ),
              // FilteringTextInputFormatter.deny(RegExp(r'(A-Z)'))
            ],*/
            decoration: decoration.copyWith(
                suffixIcon: const Icon(Icons.lock),
                hintText: "enter your confirmed password "),
            obscureText: true,
            obscuringCharacter: '*',
          ))
    ]);
  }

  InputDecoration decoration = InputDecoration(
    suffixIcon: const Icon(Icons.email),
    hintText: '**********',
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color.fromARGB(183, 31, 48, 110))),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color.fromARGB(221, 19, 21, 29))),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color.fromARGB(183, 244, 70, 17))),
  );
}
