import 'package:flutter/material.dart';
import 'package:qrlingz_app/pages/feedback/create/create_feedback_viewmodel.dart';
import 'package:qrlingz_app/pages/feedback/create/fragments/category_fragment.dart';
import 'package:qrlingz_app/pages/feedback/create/fragments/intro_fragment.dart';
import 'package:qrlingz_app/pages/feedback/create/fragments/submit_fragment.dart';
import 'package:qrlingz_app/widgets/custom_stepper.dart';

class CreateFeedbackView extends StatefulWidget {
  const CreateFeedbackView({super.key});

  @override
  State<CreateFeedbackView> createState() => _CreateFeedbackViewState();
}

class _CreateFeedbackViewState extends State<CreateFeedbackView> {
  late CreateFeedbackViewModel _viewModel;

  @override
  void initState() {
    _viewModel = CreateFeedbackViewModel();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback QR Code"),
      ),
      body: Column(
        children: [

          ValueListenableBuilder(
            valueListenable: _viewModel.activeStep,
            builder: (_, step, __) {
              return CustomStepper(
                activeIndex: step.toInt(),
                onClick: (index)=> _viewModel.goNext(context, index),
              );
            }
          ),

          Expanded(
            child: PageView(
              controller: _viewModel.pageController,
              children: [
                IntroFragment(vm: _viewModel),
                CategoryFragment(vm: _viewModel),
                SubmitFragment(vm: _viewModel)
              ],
            ),
          )
        ],
      ),
    );
  }
}