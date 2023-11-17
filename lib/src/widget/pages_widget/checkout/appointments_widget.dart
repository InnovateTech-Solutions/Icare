import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_part/src/View/checkout/confirm_page.dart';
import 'package:profile_part/src/constant/color.dart';
import 'package:profile_part/src/getx/booking_controller.dart';
import 'package:profile_part/src/getx/user_controller.dart';
import 'package:profile_part/src/model/vendor_model.dart';
import 'package:profile_part/src/repository/service_repository/service_data.dart';
import 'package:profile_part/src/widget/pages_widget/Forms_widgets/pastlogin_widget.dart';

class AppointmentsWidget extends StatefulWidget {
  const AppointmentsWidget({required this.vendorModel, super.key});
  final VendorModel vendorModel;
  @override
  State<AppointmentsWidget> createState() => _AppointmentsWidgetState();
}

class _AppointmentsWidgetState extends State<AppointmentsWidget> {
  final firebaseServices = Get.put(FirebaseService());
  final bookingController = Get.put(BookingController());
  final userController = Get.put(UserController());
  @override
  void initState() {
    super.initState();
    RxString defaultDate = (DateTime.now()).toString().obs;
    List<String> parts = defaultDate.value.split(' ');
    String datePart = parts[0];

    bookingController.generateTimeList(
        "12:00 - 22:00", datePart, widget.vendorModel.name);
  }

  @override
  Widget build(BuildContext context) {
    RxString selectedDate = (DateTime.now()).toString().obs;
    DateTime parsingDate = DateTime.parse(selectedDate.value);
    List<String> parts = selectedDate.value.split(' ');
    String datePart = parts[0];
    RxString seletedTimeStamp = ''.obs;
    return Column(
      children: [
        TimelineCalendar(
          calendarType: CalendarType.GREGORIAN,
          calendarLanguage: "en",
          calendarOptions: CalendarOptions(
            viewType: ViewType.DAILY,
            toggleViewType: true,
            headerMonthElevation: 10,
            headerMonthShadowColor: Colors.black26,
            headerMonthBackColor: Colors.transparent,
          ),
          dayOptions: DayOptions(
              selectedBackgroundColor: ColorConstants.mainTextColor,
              compactMode: true,
              weekDaySelectedColor: ColorConstants.mainTextColor,
              disableDaysBeforeNow: true),
          headerOptions: HeaderOptions(
              weekDayStringType: WeekDayStringTypes.SHORT,
              monthStringType: MonthStringTypes.FULL,
              backgroundColor: ColorConstants.mainScaffoldBackgroundColor,
              headerTextColor: ColorConstants.mainTextColor,
              resetDateColor: ColorConstants.mainTextColor,
              calendarIconColor: ColorConstants.mainTextColor,
              navigationColor: ColorConstants.mainTextColor),
          onChangeDateTime: (datetime) {
//            print(datetime.getDate());
            RxString selectedDate1 = (datetime.getDate()).toString().obs;
            List<String> parts1 = selectedDate1.value.split(' ');
            datePart = parts1[0];
            print(datePart);

            bookingController.timeList.clear();
            bookingController.bookedTimelist.clear();
            bookingController.generateTimeList(
                "12:00 - 22:00", datePart, widget.vendorModel.name);
          },
        ),
        Obx(() => bookingController.timeList.isEmpty
            ? Container(
                child: Center(
                  child: Text('All Day is booked selecet another day'),
                ),
              )
            : Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          indent: 20.0,
                          endIndent: 10.0,
                          thickness: 1,
                          color: ColorConstants.textFiledmColor,
                        ),
                    itemCount: bookingController.timeList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            GestureDetector(
                              onTap: () => {
                                userController.isLoggedIn.value
                                    ? Get.to(Get.to(ConfirmPage(
                                        vendorModel: widget.vendorModel,
                                        confirmDate: datePart,
                                        confirmTime:
                                            bookingController.timeList[index],
                                      )))
                                    : pastLoginDialoge(
                                        datePart,
                                        bookingController.timeList[index],
                                        widget.vendorModel,
                                        context,
                                      ),
                                //  print(selectedDate.value),
                                // print(AppConst.timeList[index]),
                                // bookAppointment(
                                //  selectedDate.value, AppConst.timeList[index]),

                                print(seletedTimeStamp.value =
                                    '${selectedDate.value}  ${bookingController.timeList[index]}'),
                                //  addTimestampToDatabase(DateTime.parse(
                                //    '${selectedDate.value}${AppConst.timeList[index]}'))
                                print(parsingDate),
                              },
                              child: Text(bookingController.timeList[index],
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              ColorConstants.mainTextColor))),
                            )
                          ],
                        ),
                      );
                    })))
      ],
    );
  }
}
