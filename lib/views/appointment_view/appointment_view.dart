import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/controllers/appointment_controller.dart';
import 'package:mediapp/controllers/auth_controller.dart';
import 'package:mediapp/views/appointment_details_view/appointment_detail_view.dart';

import '../../consts/consts.dart';

class AppointmentView extends StatelessWidget {
  final bool isDoctor;
  const AppointmentView({super.key, this.isDoctor = false});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
        appBar: AppBar(
          title: AppStyle.bold(
              title: "Appointments",
              color: AppColors.whiteColor,
              size: AppSizes.size18),
          backgroundColor: AppColors.blueColor,
          actions: [
            IconButton(
                onPressed: () {
                  AuthController().signOut();
                },
                icon: Icon(
                  Icons.power_settings_new_rounded,
                  color: Colors.white,
                ))
          ],
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: controller.getAppointments(isDoctor),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                var data = snapshot.data?.docs;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                      itemCount: data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            Get.to(() => AppointmentDetailView(
                                  doc: data[index],
                                ));
                          },
                          leading: CircleAvatar(
                            child: Image.asset(AppAssets.imgDoctor),
                          ),
                          title: AppStyle.bold(
                              title: data![index]
                                  [!isDoctor ? 'appWithName' : 'appName']),
                          subtitle: AppStyle.normal(
                              title:
                                  "${data[index]['appDay']} - ${data[index]['appTime']}",
                              color: AppColors.textColor.withOpacity(0.5)),
                        );
                      }),
                );
              }
            }));
  }
}
