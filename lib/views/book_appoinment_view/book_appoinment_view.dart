import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/res/components/custom_textfield.dart';

import '../../consts/consts.dart';
import '../../res/components/custom_button.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppStyle.bold(
            title: "Doctor Name",
            color: AppColors.whiteColor,
            size: AppSizes.size18),
        backgroundColor: AppColors.blueColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyle.bold(title: "Select appointment day"),
              5.heightBox,
              const CustomTextField(hint: "Select day"),
              10.heightBox,
              AppStyle.bold(title: "Select appointment time"),
              5.heightBox,
              const CustomTextField(hint: "Select time"),
              20.heightBox,
              AppStyle.bold(title: "Mobile Number:"),
              5.heightBox,
              const CustomTextField(hint: "Enter your mobile number"),
              10.heightBox,
              AppStyle.bold(title: "Full Name:"),
              5.heightBox,
              const CustomTextField(hint: "Enter your name"),
              10.heightBox,
              AppStyle.bold(title: "Message"),
              5.heightBox,
              const CustomTextField(hint: "Enter your message")
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(buttonText: "Book an appointment", onTap: () {}),
      ),
    );
  }
}
