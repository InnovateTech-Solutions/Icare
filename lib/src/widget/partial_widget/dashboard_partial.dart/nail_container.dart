import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:profile_part/src/View/vendor/vendor_page.dart';
import 'package:profile_part/src/constant/color.dart';
import 'package:profile_part/src/getx/dashboard_controller.dart';
import 'package:profile_part/src/model/vendor_model.dart';
import 'package:profile_part/src/widget/Text_Widget/form_text.dart';
import 'package:profile_part/src/widget/constant_widget/sizes/sized_box.dart';
import 'package:profile_part/src/widget/custom_Widget.dart/container_widget.dart';

import '../../custom_Widget.dart/dashboard_title.dart';

class NailWidget extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: controller.getNailVendors(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Container();
        } else {
          final vendors = snapshot.data!;
          return Column(
            children: [
              DashboardTitle("Nail Salons", () {}),
              SizedBox(
                width: 350.w,
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final vendorName = vendors[index]['Name'];
                    final vendorImageURL = vendors[index]['Image'];
                    final vendorDescription = vendors[index]['Description'];
                    //final vendorRate = vendors[index]['averageRating'];

                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  ColorConstants.mainScaffoldBackgroundColor),
                          borderRadius: BorderRadius.circular(10.0.r),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 250.w,
                                  height: 150.h,
                                  child: AppContainer(
                                      imgName: vendorImageURL,
                                      onTap: () {
                                        Get.to(VendorPage(
                                          vendor: VendorModel(
                                              name: vendorName,
                                              description: vendorDescription,
                                              image: vendorImageURL),
                                        ));
                                      })),
                              AppSizes.xsmallHeightSizedBox,
                              Row(
                                children: [
                                  AppSizes.smallWidthSizedBox,
                                  textFieldLabel(
                                    vendorName,
                                  ),
                                ],
                              )

                              // Obx(() =>
                              //     vendors[index]['averageRating'].toString() ==
                              //             'null'
                              //         ? Container()
                              //         : Row(
                              //             children: [
                              //               secondaryConfirmText(
                              //                 vendors[index]['averageRating']
                              //                     .toString(),
                              //               ),
                              //               Icon(
                              //                 Icons.star,
                              //                 color: Colors.yellow,
                              //                 size: 15,
                              //               )
                              //             ],
                              //           ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
