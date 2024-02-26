import 'package:flutter/material.dart';

import '../../consts/consts.dart';

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppStyle.bold(
            title: "Category Name",
            color: AppColors.whiteColor,
            size: AppSizes.size18),
        backgroundColor: AppColors.blueColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 170,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: AppColors.bgDarkColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(right: 8),
                width: 150,
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: AppColors.blueColor,
                      child: Image.asset(
                        AppAssets.imgDoctor,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    5.heightBox,
                    AppStyle.normal(title: "Doctor Name"),
                    VxRating(
                      selectionColor: AppColors.yellowColor,
                      onRatingUpdate: (value) {},
                      maxRating: 5,
                      count: 5,
                      value: 4,
                      stepInt: true,
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
