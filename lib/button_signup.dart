import 'package:chanzel_app/login_cubit.dart';
import 'package:chanzel_app/login_page.dart';
import 'package:chanzel_app/sigup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required this.controller, required this.controller2});
  final SigupCubit controller;
  final LoginCubit controller2;
  //TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: controller,
        child: BlocBuilder<SigupCubit, SigupState>(builder: (context, state) {
          return Form(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(183, 213, 39, 178),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // width: double.infinity,
                      height: 30,
                      child: Center(
                        child: FilledButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(31, 136, 25, 140)),
                          ),
                          onPressed: () {
                            controller.onPressedConfirmPassword;
                          },
                          child: const Text(
                            "SIGN UP NOW ",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                    child: Row(children: [
                      const Text(
                        "Do you have an account ?   ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(223, 70, 39, 111),
                        ),
                      ),
                      FilledButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(31, 136, 25, 140)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmailPage(
                                      controller: LoginCubit(),
                                      controller2: SigupCubit(),
                                    )),
                          );
                        },
                        child: const Text(
                          "LOGIN NOW ",
                          style: TextStyle(fontSize: 15, color: Colors.black38),
                        ),
                      )
                    ]))
              ],
            ),
          );
        }));
  }
}
