import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/app/app_theme.dart';

import '../../app/app_locator.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Custom",
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontWeight: FontWeight.w600, color: locator.get<AppTheme>().genericBlackColor),
          ),
          TextSpan(
            text: "Todo",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
