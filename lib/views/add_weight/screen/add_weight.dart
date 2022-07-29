import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_212solutionsllc/logic/cubit/wieght_cubit/weight_cubit.dart';
import 'package:task_212solutionsllc/views/shared/custom_button.dart';
import 'package:task_212solutionsllc/views/sign_in/widgets/input_field.dart';

class AddWeight extends StatelessWidget {
  AddWeight({Key? key}) : super(key: key);
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InputField(
              label: 'Add your current weight',
              obscureText: false,
              controller: weightController,
              sizeoflabel: 50,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            label: 'submit',
            ontap: () async {
              await context.read<WeightCubit>().registerNewWeight(
                  newWeight: double.parse(weightController.text));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
