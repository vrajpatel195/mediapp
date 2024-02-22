import 'package:flutter/material.dart';
import 'package:mediapp/consts/consts.dart';
import 'package:mediapp/consts/lists.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.0,
          title:
              AppStyle.bold(title: AppStrings.category, size: AppSizes.size18),
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
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.bgDarkColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(iconsList[index],
                            width: 60, color: Vx.randomPrimaryColor),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      20.heightBox,
                      AppStyle.bold(
                        title: iconsTitleList[index],
                        color: AppColors.textColor,
                        size: AppSizes.size16,
                      ),
                      10.heightBox,
                      AppStyle.normal(
                        title: "13 Specialists",
                        color: AppColors.textColor.withOpacity(0.5),
                        size: AppSizes.size12,
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
