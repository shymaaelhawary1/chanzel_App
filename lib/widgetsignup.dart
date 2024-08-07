import 'package:chanzel_app/sigup_cubit.dart';
import 'package:chanzel_app/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RequireWidget extends StatelessWidget {
  RequireWidget({super.key, required this.controller});
  final SigupCubit controller;
  //TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<SigupCubit, SigupState>(
        builder: (context, state) {
          return Column(children: [
            Form(
                key: controller.formkey,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 2),
                      child: Text(
                        "FullName ",
                        style: TextStyle(
                          color: Color.fromARGB(137, 225, 11, 139),
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 10),
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: controller.nameController,
                            keyboardType: TextInputType.name,
                            validator: MyValidation().validateName,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$'))
                            ],
                            decoration: decoration.copyWith(
                              hintText: "enter your full name ",
                            ))),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                      child: Text(
                        "Email ",
                        style: TextStyle(
                          color: Color.fromARGB(137, 225, 11, 139),
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 10),
                      child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.emailController,
                          keyboardType: TextInputType.name,
                          validator: MyValidation().validateEmail,
                          /* inputFormatters: [
                           FilteringTextInputFormatter.allow(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')),
                         // FilteringTextInputFormatter.deny(RegExp(r'(A-Z)'))
                          ],*/
                          decoration: decoration.copyWith(
                            suffixIcon: const Icon(Icons.email),
                            hintText: 'xxxx@gmail.com',
                          )),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                      child: Text(
                        "Phone  ",
                        style: TextStyle(
                          color: Color.fromARGB(137, 225, 11, 139),
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 10),
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: controller.phoneController,
                            keyboardType: TextInputType.phone,
                            validator: MyValidation().validatePhoneNumber,
                            /* inputFormatters: [
                           FilteringTextInputFormatter.allow(RegExp(r'^(\+20|015|011|010)\d{9}$')),
                         // FilteringTextInputFormatter.deny(RegExp(r'(A-Z)'))
                          ],*/
                            decoration: decoration.copyWith(
                              suffixIcon: const Icon(Icons.phone),
                              hintText: "20/010/011/012",
                            ))),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                      child: Text(
                        "PassWord  ",
                        style: TextStyle(
                          color: Color.fromARGB(137, 225, 11, 139),
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 10),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.passwordController,
                        keyboardType: TextInputType.name,
                        validator: MyValidation().validatePassword,
                        /* inputFormatters: [
                           FilteringTextInputFormatter.allow(RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$'),),
                         // FilteringTextInputFormatter.deny(RegExp(r'(A-Z)'))
                          ],*/
                        decoration: decoration.copyWith(
                          hintText: 'enter your password ',
                          suffixIcon: const Icon(Icons.lock),
                        ),
                        obscureText: true,
                        obscuringCharacter: '#',
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                      child: Text(
                        "Confirm Password   ",
                        style: TextStyle(
                          color: Color.fromARGB(137, 225, 11, 139),
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 10),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.passwordController2,
                          keyboardType: TextInputType.name,
                          validator: MyValidation().validatePassword,
                          /* inputFormatters: [
                           FilteringTextInputFormatter.allow(RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$'),),
                         // FilteringTextInputFormatter.deny(RegExp(r'(A-Z)'))
                          ],*/
                          decoration: decoration.copyWith(
                            hintText: 'enter your confirmed password  ',
                            suffixIcon: const Icon(Icons.lock),
                          ),
                          obscureText: true,
                          obscuringCharacter: '*',
                        )),
                  ],
                ))
          ]);
        },
      ),
    );
  }

  InputDecoration decoration = InputDecoration(
    //suffixIcon: const Icon(Icons.phone),
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
