import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:todo/core/app/app_theme.dart";
import "package:todo/core/presentation/widgets/button.dart";
import "package:todo/core/presentation/widgets/todo_textfield.dart";
import "package:todo/core/utils/helper_functions.dart";
import "package:todo/features/home/tasks/screens/tasks.dart";
import "package:todo/features/onboarding/auth/state/signup_event.dart";
import "package:todo/features/onboarding/auth/state/signup_state.dart";

import "../../../../core/app/app_assets.dart";
import "../../../../core/app/app_locator.dart";
import "../state/signup_bloc.dart";

class EmailSignup extends StatelessWidget {
  const EmailSignup({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.h,
            width: double.infinity,
            child: SvgPicture.asset(locator.get<Assets>().signup_svg),
          ),
          SizedBox(height: 30.h),
          TodoTextField(
            controller: context.read<SignupBloc>().emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "enter email address",
          ),
          SizedBox(height: 10.h),
          TodoTextField(
            controller: context.read<SignupBloc>().passwordController,
            keyboardType: TextInputType.emailAddress,
            hintText: "enter password",
            borderRadius: 15,
          ),
          BlocConsumer<SignupBloc, SignupState>(
            listener: (_, state) {
              if (state is SignupStateError) {
                showToast(state.message);
              }
              if (state is SignupStateSuccessfulState) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const TasksScreen()),
                  (route) => false,
                );
              }
            },
            builder: (_, state) {
              if (state is SignupLoading) {
                return const CupertinoActivityIndicator();
              } else {
                return TodoButton(
                    height: 60.h,
                    onPressed: () {
                      final password = context.read<SignupBloc>().passwordController;
                      final email = context.read<SignupBloc>().emailController;

                      if (password.text.isEmpty || email.text.isEmpty) {
                        showToast("Enter email or password");
                        return;
                      } else {
                        context.read<SignupBloc>().add(SignupWithPasswordEvent());
                      }
                    },
                    buttonStyle: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(theme.colorScheme.onPrimary),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: locator.get<AppTheme>().genericWhiteColor,
                      ),
                    ));
              }
            },
          )
        ],
      ),
    ));
  }
}
