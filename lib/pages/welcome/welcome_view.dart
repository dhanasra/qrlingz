import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(

            ),
          ),
          Container(
            margin: const EdgeInsets.all(32),
            child: StyledButton(
              w: 200,
              rounded: true,
              text: "Get Started", 
              onClick: ()=>context.goto(Routes.home)
            )
          )
        ],
      ),
    );
  }
}