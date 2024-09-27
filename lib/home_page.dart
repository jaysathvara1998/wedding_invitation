import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding_invitation/common_widgets/common_text.dart';
import 'package:wedding_invitation/constants/color_constants.dart';
import 'package:wedding_invitation/constants/icon_constants.dart';
import 'package:wedding_invitation/constants/image_constants.dart';
import 'package:wedding_invitation/constants/utils.dart';
import 'package:wedding_invitation/schedule_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      IconConstants.titleIcon,
                      width: 350,
                    ),
                    const Positioned(
                      left: 0,
                      right: 0,
                      bottom: 160,
                      // top: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HeaderText(text: 'Jay'),
                          HeaderText(text: '+'),
                          HeaderText(text: 'Rashmi'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                ImageConstants.couple,
                width: width <= 750 ? width / 1.5 : width / 2.5,
              ),
              const SizedBox(height: 16),
              const HeaderText(text: '17 NOVEMBER, 2024'),
              const SizedBox(height: 8),
              const HeaderText(
                  text: 'VISNAGAR, GUJARAT',
                  fontSize: 28,
                  fontWeight: FontWeight.normal),
              const SizedBox(height: 8),
              const SubTitleText(
                text: '#JRWEDDING',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(IconConstants.flowerIcon1, width: 70),
                  const SizedBox(width: 16),
                  const HeaderText(text: 'SCHEDULE'),
                  const SizedBox(width: 16),
                  SvgPicture.asset(IconConstants.flowerIcon2, width: 70),
                ],
              ),
              const SizedBox(height: 24),
              titleDividerWidget(context, title: '16 November 2024'),
              const SizedBox(height: 24),
              const Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                spacing: 80,
                runSpacing: 24,
                children: [
                  ScheduleCardWidget(
                      image: ImageConstants.mameru,
                      functionName: 'MAMERU',
                      date: '16 November 2024',
                      time: '10:00 AM'),
                  ScheduleCardWidget(
                      image: ImageConstants.lunch,
                      functionName: 'LUNCH',
                      date: '16 November 2024',
                      time: '11:00 AM'),
                  ScheduleCardWidget(
                      image: ImageConstants.haldi,
                      functionName: 'HALDI FUNCTION',
                      date: '16 November 2024',
                      time: '04:00 PM'),
                  ScheduleCardWidget(
                      image: ImageConstants.garba,
                      functionName: 'GARBA',
                      date: '16 November 2024',
                      time: '10:00 PM'),
                ],
              ),
              const SizedBox(height: 16),
              const SubTitleText(
                text: 'Venue: Parimal society, Mehsana cross road, Visnagar',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              const SizedBox(height: 8),
              directionButton(
                redirection: () {
                Utils.navigateToDestination(lat: 23.691993, long: 72.542521);
              }),
              const SizedBox(height: 24),
              titleDividerWidget(context, title: '17 November 2024'),
              const SizedBox(height: 24),
              const ScheduleCardWidget(
                  image: ImageConstants.weddingCouple,
                  functionName: 'WEDDING CEREMONY',
                  date: '17 November 2024',
                  time: '11:00 AM'),
              const SizedBox(height: 16),
              const SubTitleText(
                text: 'Venue: Mahakali society, Behind High school, Kheralu',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              const SizedBox(height: 8),
              directionButton(
                redirection: () {
                Utils.navigateToDestination(lat: 23.8847074, long: 72.6227296);
              }),
              const SizedBox(height: 24),
              Container(
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                width: width < 1100 ? width / 1.5 : width / 2,
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: width <= 750
                    ? Column(
                        children: [
                          weddingTimeAndAddress(
                              alignment: CrossAxisAlignment.center),
                          const SizedBox(height: 16),
                          scheduleReminderButton(),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: weddingTimeAndAddress(
                                alignment: CrossAxisAlignment.start),
                          ),
                          scheduleReminderButton(),
                        ],
                      ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleDividerWidget(BuildContext context, {required String title}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: Divider(color: ColorConstants.dividerColor)),
          const SizedBox(width: 16),
          SubTitleText(
            text: title,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(width: 16),
          const Expanded(child: Divider(color: ColorConstants.dividerColor)),
        ],
      ),
    );
  }

  Widget scheduleReminderButton() {
    return ElevatedButton(
      onPressed: () {
        Utils.scheduleEventOnCalender(weddingDate: '2024-11-16T00:00:00');
      },
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: Colors.black),
      child: const SubTitleText(
        text: 'SCHEDULE REMINDER',
        fontColor: Colors.white,
        fontSize: 14,
      ),
    );
  }

  Widget weddingTimeAndAddress(
      {CrossAxisAlignment alignment = CrossAxisAlignment.center}) {
    return Column(
      crossAxisAlignment: alignment,
      children: const [
        SubTitleText(
          text: "Jay's Wedding",
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        SizedBox(height: 8),
        SubTitleText(
          text: "Sunday November 17, 2024 | 11:00 AM - 06:00 PM",
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        SizedBox(height: 8),
        SubTitleText(
          text: "Mahakali Society, Kheralu",
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ],
    );
  }

  Widget directionButton({required Function() redirection}) {
    return ElevatedButton(
      onPressed: redirection,
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: ColorConstants.buttonColor),
      child: const SubTitleText(
        text: 'GET DIRECTIONS',
        fontColor: Colors.white,
        fontSize: 18,
      ),
    );
  }
}
