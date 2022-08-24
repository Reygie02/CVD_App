// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:devcvd/src/shared/dialogs/policy_dialog.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        textAlign: TextAlign.center,

        //terms and condition
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyText1,
          children: [
            TextSpan(
              text: "Terms & Conditions ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return PolicyDialog(
                        mdFileName: 'terms_and_condition.md',
                      );
                    },
                  );
                },
            ),
            TextSpan(
              text: "and ",
              style: TextStyle(color: Colors.white),
            ),

            //privacy policy
            TextSpan(
              text: "Privacy Policy! ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return PolicyDialog(
                        mdFileName: 'privacy_policy.md',
                      );
                    },
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
