import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'verification_cubit.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationCubit(),
      child: BlocBuilder<VerificationCubit, VerificationState>(
        builder: (context, state) {
          final cubit = context.read<VerificationCubit>();

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Verification Page'),
              backgroundColor: const Color.fromARGB(197, 57, 122, 213),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                      child: Text(
                        "Verification",
                        style: TextStyle(
                          color: Color.fromARGB(223, 9, 9, 9),
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                      child: Text(
                        "Enter the verification code",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(233, 204, 16, 192),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                      child: PinCodeFields(
                        length: 5,
                        fieldHeight: 60,
                        fieldWidth: 50,
                        borderWidth: 1,
                        // activeColor: Colors.black,
                        // inactiveColor: Colors.grey,
                        // selectedColor: Colors.black,
                        borderRadius: BorderRadius.circular(18),
                        controller: cubit.pinCodeController,
                        onComplete: (value) {
                          debugPrint("Completed: $value");
                        },
                        // onChanged: (value) {
                        //   debugPrint("Changed: $value");
                        // },
                        // errorText: "Code must be 5 digits",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                      child: ElevatedButton(
                        onPressed: cubit.onTapConfirm,
                        child: const Text(
                          "Confirm",
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          // primary: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
