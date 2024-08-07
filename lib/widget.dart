import 'package:chanzel_app/verification_cubit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RequirdWidget extends StatelessWidget {
  RequirdWidget({super.key, required this.controller});
  // TextEditingController nameController = TextEditingController();
  final VerificationCubit controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller.verificationcontroller,
          keyboardType: TextInputType.number,
          maxLength: 4,
          decoration: decoration,
        )
      ],
    );
  }

  InputDecoration decoration = InputDecoration(
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
