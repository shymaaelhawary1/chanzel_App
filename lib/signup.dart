import 'package:chanzel_app/button_wid.dart';
import 'package:chanzel_app/login_cubit.dart';
import 'package:chanzel_app/sigup_cubit.dart';
import 'package:chanzel_app/widgetsignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key, required this.controller});
  final SigupCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SigupCubit>(
      create: (context) => SigupCubit(),
      child: BlocBuilder<SigupCubit, SigupState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "CHANZEL \n sign up  ",
                style: TextStyle(
                  color: Color.fromARGB(254, 244, 241, 241),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 85, 64, 203),
            ),
            body: ListView(children: [
              RequireWidget(
                controller: controller,
              ),
              ButtonWidget(
                controller: LoginCubit(),
                controller2: SigupCubit(),
              ),
            ]),
            //bottomNavigationBar: ButtonWidget(
            // controller: controller,
            // ),
          );
        },
      ),
    );
  }
}
