import 'package:chanzel_app/forget_pass_e.dart';
import 'package:chanzel_app/home.dart';
import 'package:chanzel_app/login_cubit.dart';
import 'package:chanzel_app/login_page.dart';
import 'package:chanzel_app/signup.dart';
import 'package:chanzel_app/sigup_cubit.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, required this.controller, required this.controller2});
  final LoginCubit controller;
  final SigupCubit controller2;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(31, 136, 25, 140)),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgetPass1()));
                },
                child: const Text(
                  "forget password ?",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 19,
                      color: Color.fromARGB(207, 21, 19, 19)),
                ),
              )
            ],
          )),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(183, 213, 39, 178),
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
            height: 30,
            child: Center(
              child: FilledButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(31, 136, 25, 140)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen()
                            ),
                  );
                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          )),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 3),
          child: Row(children: [
            const Text(
              "Don't  have an account ?   ",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(223, 70, 39, 111),
              ),
            ),
            FilledButton(
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(245, 225, 54, 231)),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SignPage(controller: controller2)));
              },
              child: const Text(
                "SIGN UP now ",
                style: TextStyle(fontSize: 22, color: Colors.black45),
              ),
            ),
          ]))
    ]);
  }
}
