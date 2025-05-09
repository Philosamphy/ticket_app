import 'package:flutter/material.dart';
import 'package:ticket_app/screens/ticket/ticket_positioned_circles.dart';

import '../../base/res/media.dart';
import '../../base/res/styles/app_styles.dart';
import '../../base/utils/all_json.dart';
import '../../base/widgets/app_column_text_layout.dart';
import '../../base/widgets/app_layoutBuilder_widget.dart';
import '../../base/widgets/ticket_view.dart';
import '../search/widgets/app_tickets_tab.dart';


class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      ticketIndex = args["index"];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: const Text("Tickets"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            children: [
              const AppTicketsTab(firstTab: "Upcoming", secondTab: "Previous"),
              const SizedBox(height: 20),

              /// Combined ticket container
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(21),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Top ticket view
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(21),
                        topRight: Radius.circular(21),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 16),
                        color: Colors.white,
                        child: TicketView(
                          ticket: ticketList[ticketIndex],
                          isColor: true,
                          onlyTopCorners: false,
                        ),
                      ),
                    ),
                    
                    
                    // Details section
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppColumnTextLayout(
                                topText: "Flutter DB",
                                bottomText: "Passenger",
                                alignment: CrossAxisAlignment.start,
                                isColor: true,
                              ),
                              AppColumnTextLayout(
                                topText: "5221 3689",
                                bottomText: "passport",
                                alignment: CrossAxisAlignment.end,
                                isColor: true,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          AppLayoutbuilderWidget(
                              randomDivider: 15, width: 5, isColor: false),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppColumnTextLayout(
                                topText: "2465 658494046865",
                                bottomText: "Number of E-ticket",
                                alignment: CrossAxisAlignment.start,
                                isColor: true,
                              ),
                              AppColumnTextLayout(
                                topText: "846859",
                                bottomText: "Booking code",
                                alignment: CrossAxisAlignment.end,
                                isColor: true,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          AppLayoutbuilderWidget(
                              randomDivider: 15, width: 5, isColor: false),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(AppMedia.visaCard,
                                          scale: 11),
                                      Text("*** 2462",
                                          style: AppStyles.headlineStyle3),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text("Payment method",
                                      style: AppStyles.headlineStyle4),
                                ],
                              ),
                              AppColumnTextLayout(
                                topText: "\$249.99",
                                bottomText: "Price",
                                alignment: CrossAxisAlignment.end,
                                isColor: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                   
                   SizedBox(height: 1,),
                    // Barcode
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(21),
                          bottomRight: Radius.circular(21),
                        ),
                        /*child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: BarcodeWidget(
                          height: 70,
                          barcode: Barcode.code128(),
                          data: 'https://www.dbestech.com',
                          drawText: false,
                          color: AppStyles.textColor,
                          width: double.infinity,
                            ),
                          ),
                        ),*/
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Additional (bottom) colorful ticket
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(ticket: ticketList[ticketIndex]),
              ),
            ],
          ),

          // Decorative circles
          const TicketPositionedCircles(pos: true),
          const TicketPositionedCircles(pos: null),
        ],
      ),
    );
  }
}
