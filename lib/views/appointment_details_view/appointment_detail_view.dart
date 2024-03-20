import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../consts/consts.dart';
import '../../res/components/custom_textfield.dart';

class AppointmentDetailView extends StatelessWidget {
  final DocumentSnapshot doc;
  const AppointmentDetailView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyle.bold(
            title: doc['appWithName'],
            color: AppColors.whiteColor,
            size: AppSizes.size18),
        backgroundColor: AppColors.blueColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppStyle.bold(title: "Select appointment day"),
          5.heightBox,
          AppStyle.normal(title: doc['appDay']),
          10.heightBox,
          AppStyle.bold(title: "Select appointment time"),
          5.heightBox,
          AppStyle.normal(title: doc['appTime']),
          20.heightBox,
          AppStyle.bold(title: "Mobile Number:"),
          5.heightBox,
          AppStyle.normal(title: doc['appMobile']),
          10.heightBox,
          AppStyle.bold(title: "Full Name:"),
          5.heightBox,
          AppStyle.normal(title: doc['appName']),
          10.heightBox,
          AppStyle.bold(title: "Message:"),
          5.heightBox,
          AppStyle.normal(title: doc['appMsg']),
        ]),
      ),
    );
  }
}
