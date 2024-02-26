import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/consts/consts.dart';
import 'package:mediapp/consts/lists.dart';
import 'package:mediapp/views/category_detail_view/category_detail_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.0,
          title: AppStyle.bold(
              title: AppStrings.category,
              size: AppSizes.size18,
              color: AppColors.whiteColor),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 200,
              ),
              itemCount: iconsList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => const CategoryDetailView());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.blueColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(iconsList[index],
                              width: 60, color: AppColors.whiteColor),
                        ),
                        30.heightBox,
                        AppStyle.bold(
                          title: iconsTitleList[index],
                          color: AppColors.whiteColor,
                          size: AppSizes.size16,
                        ),
                        10.heightBox,
                        AppStyle.normal(
                          title: "13 Specialists",
                          color: AppColors.whiteColor.withOpacity(0.5),
                          size: AppSizes.size12,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
