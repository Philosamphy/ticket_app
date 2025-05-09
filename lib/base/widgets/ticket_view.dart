import 'package:flutter/material.dart';
import 'package:ticket_app/base/widgets/test_style_third.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import '../res/styles/app_styles.dart';
import 'app_column_text_layout.dart';
import 'big_circle.dart';
import 'big_dot.dart';
import 'dashed_divider.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  final bool onlyTopCorners;

  const TicketView({
    super.key,
    required this.ticket,
    this.wholeScreen = false,
    this.isColor,
    this.onlyTopCorners = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.85,
      height: 210,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen == true ? 0 : 16),
        child: Column(
          children: [
            // Top Blue Section
            Container(
              decoration: BoxDecoration(
                color: isColor == null ? AppStyles.ticketBlue : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextStyleThird(
                        text: ticket["from"]["code"],
                        isColor: isColor,
                      ),
                      const Spacer(),
                      BigDot(isColor: isColor),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 24,
                              child: DashedDivider(
                                dashWidth: 6,
                                dashHeight: 1.2,
                                color:
                                    isColor == null
                                        ? Colors.white
                                        : Colors.grey,
                              ),
                            ),
                            Transform.rotate(
                              angle: 1.57,
                              child: Icon(
                                Icons.local_airport_rounded,
                                color:
                                    isColor == null
                                        ? Colors.white
                                        : AppStyles.planeSecondColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      BigDot(isColor: isColor),
                      const Spacer(),
                      TextStyleThird(
                        text: ticket["to"]["code"],
                        isColor: isColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                          text: ticket["from"]["name"],
                          isColor: isColor,
                        ),
                      ),
                      const Spacer(),
                      TextStyleFourth(
                        text: ticket["flying_time"],
                        isColor: isColor,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                          text: ticket["to"]["name"],
                          align: TextAlign.end,
                          isColor: isColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Bottom Orange Section (with embedded dashed line)
            Container(
              decoration: BoxDecoration(
                color: isColor == null ? AppStyles.ticketOrange : Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                  bottomRight: Radius.circular(isColor == null ? 21 : 0),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        const BigCircle(isRight: false),
                        Expanded(child: DashedDivider(color: Colors.white)),
                        const BigCircle(isRight: true),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: ticket["date"],
                          bottomText: "DATE",
                          alignment: CrossAxisAlignment.start,
                          isColor: isColor,
                        ),
                        AppColumnTextLayout(
                          topText: ticket["departure_time"],
                          bottomText: "Departure time",
                          alignment: CrossAxisAlignment.center,
                          isColor: isColor,
                        ),
                        AppColumnTextLayout(
                          topText: ticket["number"].toString(),
                          bottomText: "Number",
                          alignment: CrossAxisAlignment.end,
                          isColor: isColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
