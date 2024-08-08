import 'package:chanzel_app/forger_pass_p.dart';
import 'package:chanzel_app/forgetcubit_cubit.dart';
import 'package:chanzel_app/required_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPass1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetcubitCubit>(
      create: (context) => ForgetcubitCubit(),
      child: BlocBuilder<ForgetcubitCubit, ForgetcubitState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  "confirm email   ",
                  style: TextStyle(
                    color: Color.fromARGB(254, 244, 241, 241),
                  ),
                ),
                backgroundColor: const Color.fromARGB(255, 85, 64, 203),
              ),
              body: Column(children: [
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 10),
                    child: RequiredWidget(
                      controller: ForgetcubitCubit(),
                    )),
                FilledButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(230, 176, 22, 181)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Forgetpassword2()),
                    );
                  },
                  child: const Text(
                    "continue",
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 248, 239, 239)),
                  ),
                ),
              ]));
        },
      ),
    );
  }
}
