import 'package:chanzel_app/login_cubit.dart';
import 'package:chanzel_app/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailField extends StatelessWidget {
  EmailField({super.key, required this.controller});
  TextEditingController nameController = TextEditingController();
  final LoginCubit controller;

  @override
  Widget build(BuildContext context) {
    return Column(
        
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
            child: Text(
              "LOGIN   ",
              style: TextStyle(
                color: Color.fromARGB(223, 9, 9, 9),
                fontSize: 43,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            child: Text(
              "email ",
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
                  controller: controller.emailController1,
                  keyboardType: TextInputType.name,
                  validator: MyValidation().validateEmail,
                  
                  decoration: decoration.copyWith())),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            child: Text(
              "password  ",
              style: TextStyle(
                color: Color.fromARGB(137, 225, 11, 139),
                fontSize: 19,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller.passwordController3,
              keyboardType: TextInputType.name,
              validator: MyValidation().validatePassword,
              
              decoration: decoration.copyWith(
                hintText: 'enter your password ',
                suffixIcon: const Icon(Icons.lock),
              ),
              obscureText: true,
              obscuringCharacter: '*',
            ),
          ),
        ]);
  }

  InputDecoration decoration = InputDecoration(
    suffixIcon: const Icon(Icons.email),
    hintText: 'xxxx@gmail.com',
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
