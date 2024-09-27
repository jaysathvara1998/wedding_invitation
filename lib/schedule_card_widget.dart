import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:wedding_invitation/common_widgets/common_text.dart';

class ScheduleCardWidget extends StatefulWidget {
  final String image;
  final String functionName;
  final String date;
  final String time;

  const ScheduleCardWidget(
      {super.key,
      required this.image,
      required this.functionName,
      required this.date,
      required this.time});

  @override
  State<ScheduleCardWidget> createState() => _ScheduleCardWidgetState();
}

class _ScheduleCardWidgetState extends State<ScheduleCardWidget>
    with SingleTickerProviderStateMixin {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.functionName), // Key to uniquely identify widget
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.1) {
          setState(() {
            isVisible = true;
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.identity()
          ..translate(isVisible ? 0.0 : 50.0)
          ..scale(isVisible ? 1.0 : 0.9),
        curve: Curves.easeOut,

        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset(
                  widget.image,
                  width: 250,
                  height: 250,
                ),
                SubTitleText(
                    text: widget.functionName, fontWeight: FontWeight.bold),
                const SizedBox(height: 8),
                SubTitleText(
                  text: 'Time: ${widget.time}',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
