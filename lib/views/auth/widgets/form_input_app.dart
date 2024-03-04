import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          Text(
            "Username",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextField(
            labelText: "Enter your username",
            prefixIcon: Icons.account_circle_rounded,
            controller: bloc.userNameController,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Password",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
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
          const SizedBox(
            width: double.infinity,
            child: Text(
              "Forget Password?",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue),
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: state is LoginLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(),
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
