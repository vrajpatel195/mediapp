import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/consts/consts.dart';
import 'package:mediapp/consts/lists.dart';
import 'package:mediapp/controllers/home_controller.dart';
import 'package:mediapp/res/components/custom_textfield.dart';
import 'package:mediapp/views/category_detail_view/category_detail_view.dart';
import 'package:mediapp/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:mediapp/views/search_view/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blue,
          title: AppStyle.bold(
              title: "${AppStrings.welcome} User",
              color: AppColors.whiteColor,
              size: AppSizes.size18)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              color: AppColors.blueColor,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      textController: controller.searchQueryController,
                      hint: AppStrings.search,
                      borderColor: AppColors.whiteColor,
                      textColor: AppColors.whiteColor,
                      inputColor: AppColors.whiteColor,
                    ),
                  ),
                  10.widthBox,
                  IconButton(
                      onPressed: () {
                        Get.to(() => SearchView(
                              searchQuery:
                                  controller.searchQueryController.text,
                            ));
                      },
                      icon: Icon(
                        Icons.search,
                        color: AppColors.whiteColor,
                      ))
                ],
              ),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => CategoryDetailView(
                                  catName: iconsTitleList[index]));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.blueColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(right: 8),
                              child: Column(children: [
                                Image.asset(
                                  iconsList[index],
                                  width: 30,
                                  color: AppColors.whiteColor,
                                ),
                                5.heightBox,
                                AppStyle.normal(
                                    title: iconsTitleList[index],
                                    color: AppColors.whiteColor),
                              ]),
                            ),
                          );
                        }),
                  ),
                  20.heightBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppStyle.bold(
                      title: "Popular Doctors",
                      color: AppColors.blueColor,
                      size: AppSizes.size18,
                    ),
                  ),
                  10.heightBox,
                  FutureBuilder<QuerySnapshot>(
                      future: controller.getDoctorList(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          var data = snapshot.data?.docs;
                          return SizedBox(
                            height: 150,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: data?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(() => DoctorProfileView(
                                            doc: data[index],
                                          ));
                                    },
                                    child: Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        color: AppColors.bgDarkColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      margin: const EdgeInsets.only(right: 8),
                                      width: 150,
                                      height: 150,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 150,
                                            alignment: Alignment.center,
                                            color: AppColors.blueColor,
                                            child: Image.asset(
                                              AppAssets.imgDoctor,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          5.heightBox,
                                          AppStyle.normal(
                                              title: data![index]['docName']),
                                          5.heightBox,
                                          AppStyle.normal(
                                              title: data[index]['docCategory'],
                                              color: Colors.black54),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }
                      }),
                  5.heightBox,
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AppStyle.normal(
                          title: "View All", color: AppColors.blueColor),
                    ),
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        4,
                        (index) => Container(
                              decoration: BoxDecoration(
                                color: AppColors.blueColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Image.asset(AppAssets.icBody,
                                      width: 25, color: AppColors.whiteColor),
                                  5.heightBox,
                                  AppStyle.normal(
                                      title: "Lab Test",
                                      color: AppColors.whiteColor),
                                ],
                              ),
                            )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
