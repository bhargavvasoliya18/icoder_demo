import 'package:bhargav_practicle/src/Style/color.dart';
import 'package:bhargav_practicle/src/Style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

customCalender({Function(DateTime, DateTime)? onTapDateSelect}){
  return showDialog(
      context: Get.context!,
      useSafeArea: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: EdgeInsets.zero,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppBgColors.whiteBg,),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: TableCalendar(
                        calendarFormat: CalendarFormat.month,
                        onDaySelected: (selectedDay, focusedDay) {
                          onTapDateSelect?.call(selectedDay, focusedDay);
                        },
                        daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: TextStyleTheme.customTextStyle(AppTextColors.black, 12, FontWeight.w400)
                        ),
                        focusedDay: DateTime.now(),
                        weekendDays: const [],
                        firstDay: DateTime.now(),
                        lastDay: DateTime(2050),
                        calendarStyle: CalendarStyle(
                          todayDecoration: const BoxDecoration(color: Colors.transparent),
                          selectedDecoration: const BoxDecoration(color: Colors.transparent),
                          selectedTextStyle: TextStyleTheme.customTextStyle(AppTextColors.black, 15, FontWeight.w400),
                          todayTextStyle: TextStyleTheme.customTextStyle(AppTextColors.black, 15, FontWeight.w400),
                          defaultTextStyle: TextStyleTheme.customTextStyle(AppTextColors.black, 15, FontWeight.w400),
                          disabledTextStyle: TextStyleTheme.customTextStyle(AppTextColors.grey, 15, FontWeight.w400),
                        ),
                        headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            titleTextStyle: TextStyleTheme.customTextStyle(AppTextColors.black, 16, FontWeight.w700)
                        ),
                        startingDayOfWeek: StartingDayOfWeek.monday,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}