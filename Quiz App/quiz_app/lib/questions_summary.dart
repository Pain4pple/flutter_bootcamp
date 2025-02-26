import 'dart:ffi';

import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomIndex(((data['question_index'] as int) + 1).toString(), data['user_answer'] == data['correct_answer'] ? true : false),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(data['question'] as String, const Color.fromARGB(255, 255, 243, 255), 14),
                        CustomTextWidget(data['user_answer'] as String, const Color.fromARGB(255, 161, 8, 167), 12),
                        CustomTextWidget(data['correct_answer'] as String, const Color.fromARGB(255, 101, 10, 205), 12)
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(this.customText, this.customColor, this.customSize, {super.key});

  final String customText;
  final Color customColor;
  final double? customSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      customText,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: customColor,
        fontSize: customSize,
      ),
    );
  }
}

class CustomIndex extends StatelessWidget {
  const CustomIndex(this.customText, this.answerValue, {super.key});

  final String customText;
  final bool answerValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: answerValue == true ? const Color.fromARGB(255, 136, 207, 242) : const Color.fromARGB(255, 223, 103, 241),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        customText,
        style: TextStyle(
          color: answerValue == true ? const Color.fromARGB(255, 43, 99, 127) : const Color.fromARGB(255, 127, 34, 141),
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
