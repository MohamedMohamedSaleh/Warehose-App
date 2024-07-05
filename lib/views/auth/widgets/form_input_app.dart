import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/views/auth/login/bloc/login_bloc.dart';
import '../../../core/widgets/custom_filled_button.dart';
import 'custom_textfield.dart';

class FormInputApp extends StatefulWidget {
  const FormInputApp({super.key});

  @override
  State<FormInputApp> createState() => _FormInputAppState();
}

class _FormInputAppState extends State<FormInputApp> {
  final bloc = KiwiContainer().resolve<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: bloc.formKey,
      autovalidateMode: bloc.autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            labelText: "Enter your username",
            prefixIcon: Icons.account_circle_rounded,
            controller: bloc.userNameController,
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextField(
            labelText: "Enter your Password",
            prefixIcon: Icons.lock,
            isPassword: true,
            controller: bloc.passwordController,
          ),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            height: 180.h,
          ),
          BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: state is LoginLoadingState
                    ? const Center(
                        child: SizedBox(child: CircularProgressIndicator()),
                      )
                    : CustomFilledButton(
                        title: "Login",
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          bloc.add(LoginEvent());
                        },
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
