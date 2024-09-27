import 'package:wedding_invitation/common_widgets/common_text.dart';
import 'package:wedding_invitation/constants/color_constants.dart';
import 'package:wedding_invitation/constants/icon_constants.dart';
import 'package:wedding_invitation/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      top: 10,
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
                width: MediaQuery.of(context).size.width / 2.5,
              ),
              const SizedBox(height: 16),
              const HeaderText(text: 'NOVEMBER 17, 2024'),
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
              const SizedBox(height: 16),
              const Divider(color: ColorConstants.dividerColor),
              const SizedBox(height: 24),
              const HeaderText(text: 'SCHEDULE'),
              const SizedBox(height: 24),
              const SubTitleText(
                text: '16 November 2024',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 24),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 80,
                runSpacing: 24,
                children: [
                  scheduleSection(
                      image: ImageConstants.mameru,
                      functionName: 'MAMERU',
                      date: '16 November 2024',
                      time: '10:00 AM'),
                  scheduleSection(
                      image: ImageConstants.lunch,
                      functionName: 'LUNCH',
                      date: '16 November 2024',
                      time: '11:00 AM'),
                  scheduleSection(
                      image: ImageConstants.haldi,
                      functionName: 'HALDI FUNCTION',
                      date: '16 November 2024',
                      time: '04:00 PM'),
                  scheduleSection(
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
              directionButton(),
              const SizedBox(height: 16),
              const Divider(color: ColorConstants.dividerColor),
              const SizedBox(height: 16),
              const SubTitleText(
                text: '17 November 2024',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 24),
              scheduleSection(
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
              directionButton(),
              const SizedBox(height: 24),
              Container(
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                width: MediaQuery.of(context).size.width / 2,
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubTitleText(
                            text: "Jay\'s Wedding",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          SubTitleText(
                            text:
                            "Sunday November 17, 2024 | 11:00 AM - 06:00 PM",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          SubTitleText(
                            text: "Mahakali Society, Kheralu",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        scheduleEvent(weddingDate: '2024-11-16T00:00:00');
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
                    )
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

  Widget directionButton() {
    return ElevatedButton(
      onPressed: () {},
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

  Widget scheduleSection(
      {required String image,
        required String functionName,
        required String date,
        required String time}) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 250,
          height: 250,
        ),
        HeaderText(
          text: functionName,
          fontWeight: FontWeight.normal,
        ),
        const SizedBox(height: 8),
        SubTitleText(
          text: 'Time: $time',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ],
    );
  }

  void scheduleEvent({required String weddingDate}) {
    final reminderDate =
    DateTime.parse(weddingDate).subtract(const Duration(days: 1));
    final url = Uri.encodeFull(
        'https://www.google.com/calendar/render?action=TEMPLATE'
            '&text=Jay & Rashmi wedding reminder'
            '&dates=${reminderDate.toIso8601String().replaceAll('-', '').replaceAll(':', '')}/$weddingDate'
            '&details=Don\'t forget the wedding!');

    launchUrl(Uri.parse(url));
  }
}
