import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/views/appointment_details_view/appointment_detail_view.dart';

import '../../consts/consts.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppStyle.bold(
              title: "Appointments",
              color: AppColors.whiteColor,
              size: AppSizes.size18),
          backgroundColor: AppColors.blueColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Get.to(() => const AppointmentDetailView());
                  },
                  leading: CircleAvatar(
                    child: Image.asset(AppAssets.imgDoctor),
                  ),
                  title: AppStyle.bold(title: "Doctor Name"),
                  subtitle: AppStyle.normal(
                      title: "Appointment time",
                      color: AppColors.textColor.withOpacity(0.5)),
                );
              }),
        ));
  }
}
