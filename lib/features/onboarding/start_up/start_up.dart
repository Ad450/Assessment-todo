import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:todo/core/app/app_constants.dart";
import "package:todo/core/app/app_locator.dart";
import "package:todo/core/app/app_providers.dart";
import "package:todo/core/app/app_theme.dart";
import "package:todo/core/presentation/widgets/button.dart";
import "package:todo/core/utils/helper_functions.dart";
import "package:todo/features/home/tasks/data/datasources/tasks_local_datasource.dart";
import "package:todo/features/home/tasks/screens/tasks.dart";
import "package:todo/features/onboarding/auth/screens/email_signup.dart";
import "package:todo/features/onboarding/auth/state/auth_bloc.dart";
import "package:todo/features/onboarding/auth/state/auth_state.dart";
import "package:todo/features/onboarding/auth/state/signup_event.dart";
import "package:todo/features/onboarding/auth/state/signup_state.dart";

import "../../../core/app/app_assets.dart";
import "../../../core/presentation/widgets/app_title.dart";
import "../auth/state/signup_bloc.dart";

class Todo extends StatelessWidget {
  const Todo({super.key});
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    // locator.get<TasksLocalDatasource>().deleteDummy();

    return MultiBlocProvider(
      providers: [signupBloc, authBloc, taskBloc],
      child: ScreenUtilInit(
        designSize: appDesignSize,
        child: MaterialApp(
          title: 'Todo',
          theme: locator.get<AppTheme>().getTheme(brightness),
          home: const _TodoStartup(),
        ),
      ),
    );
  }
}

class _TodoStartup extends StatelessWidget {
  const _TodoStartup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (_, state) {
      if (state is AuthErrorState) {
        showToast(state.error);
      }
    }, builder: (_, state) {
      switch (state.runtimeType) {
        case UnauthenticatedState:
          return const _StartUpAuth();
        case AuthenticatedState:
          return const TasksScreen();
        case AuthErrorState:
          return const _StartUpAuth();
        default:
          return const _StartUpAuth();
      }
    });
  }
}

class _StartUpAuth extends StatelessWidget {
  const _StartUpAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: BlocConsumer<SignupBloc, SignupState>(
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
        builder: (_, state) => IgnorePointer(
          ignoring: state is SignupLoading,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 80.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const AppTitle(),
                SizedBox(
                  height: 200.h,
                  width: double.infinity,
                  child: SvgPicture.asset(locator.get<Assets>().onboardingSvg),
                ),
                state is SignupLoading
                    ? const CupertinoActivityIndicator()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContinueWithGoogleButton(
                            theme,
                            context,
                            () {
                              debugPrint("inside google");
                              context.read<SignupBloc>().add(SignupWithGoogleEvent());
                            },
                          ),
                          SizedBox(height: 20.h),
                          _buildContinueWithEmailButton(theme, context)
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TodoButton _buildContinueWithEmailButton(ThemeData theme, BuildContext context) {
    return TodoButton(
      onPressed: () {
        debugPrint("email pushed");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const EmailSignup(),
            ),
            (route) => false);
      },
      paddingTop: 10,
      paddingBottom: 10,
      buttonStyle: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(theme.colorScheme.primary),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.phone_android, color: theme.colorScheme.background),
          SizedBox(height: 12.h),
          RichText(
            text: TextSpan(
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.background,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "Continue with ",
                  style: theme.textTheme.labelLarge?.copyWith(color: locator.get<AppTheme>().genericWhiteColor),
                ),
                TextSpan(
                  text: "Email.",
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.background,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContinueWithGoogleButton(ThemeData theme, BuildContext context, VoidCallback callback) {
    return TodoButton(
      onPressed: callback,
      paddingTop: 10,
      paddingBottom: 10,
      buttonStyle: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(theme.colorScheme.background),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 30,
            width: 30,
            child: SizedBox(
              height: 50.h,
              width: 50.w,
              child: SvgPicture.asset(locator.get<Assets>().google_logo),
            ),
          ),
          SizedBox(width: 12.w),
          RichText(
            text: TextSpan(
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.background,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "Continue with ",
                  style: theme.textTheme.labelLarge?.copyWith(color: locator.get<AppTheme>().blackShade54),
                ),
                TextSpan(
                  text: "Google",
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: locator.get<AppTheme>().blackShade87,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
