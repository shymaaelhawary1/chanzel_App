
import 'package:chanzel_app/button_wid.dart';
import 'package:chanzel_app/email_wid.dart';
import 'package:chanzel_app/login_cubit.dart';
import 'package:chanzel_app/sigup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailPage extends StatelessWidget {
  const EmailPage(
      {super.key, required this.controller2, required this.controller});
  final SigupCubit controller2;
  final LoginCubit controller;
  // final RegerstrationCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "EMAIL LOGIN  ",
                style: TextStyle(
                  color: Color.fromARGB(254, 244, 241, 241),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 85, 64, 203),
            ),
            body: ListView(
              //mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmailField(
                  controller: LoginCubit(),
                ),
                ButtonWidget(
                  //controller: controller,
                  controller2: controller2, controller: controller,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
