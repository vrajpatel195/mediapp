import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/res/components/custom_textfield.dart';

import '../../consts/consts.dart';
import '../../controllers/appointment_controller.dart';
import '../../res/components/custom_button.dart';

class BookAppointmentView extends StatelessWidget {
  final String docId;
  final String docName;
  const BookAppointmentView(
      {super.key, required this.docId, required this.docName});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        title: AppStyle.bold(
            title: docName, color: AppColors.whiteColor, size: AppSizes.size18),
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
              CustomTextField(
                hint: "Select day",
                textController: controller.appDayController,
              ),
              10.heightBox,
              AppStyle.bold(title: "Select appointment time"),
              5.heightBox,
              CustomTextField(
                hint: "Select time",
                textController: controller.appTimeController,
              ),
              20.heightBox,
              AppStyle.bold(title: "Mobile Number:"),
              5.heightBox,
              CustomTextField(
                hint: "Enter your mobile number",
                textController: controller.appMobileController,
              ),
              10.heightBox,
              AppStyle.bold(title: "Full Name:"),
              5.heightBox,
              CustomTextField(
                hint: "Enter your name",
                textController: controller.appNameController,
              ),
              10.heightBox,
              AppStyle.bold(title: "Message"),
              5.heightBox,
              CustomTextField(
                hint: "Enter your message",
                textController: controller.appMessageController,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10.0),
          child: controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CustomButton(
                  buttonText: "Book an appointment",
                  onTap: () async {
                    await controller.bookAppointment(docId, docName, context);
                  }),
        ),
      ),
    );
  }
}
