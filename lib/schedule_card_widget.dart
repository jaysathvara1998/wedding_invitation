import 'package:flutter/material.dart';
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
    return Card(
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
    );
  }
}
