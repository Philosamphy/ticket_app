import 'package:flutter/material.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/utils/app_routes.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';


class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Tickets")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children:
            ticketList.map((singleTicket) {
              return GestureDetector(
                onTap: () {
                  var index;
                  index == ticketList.indexOf(singleTicket);
                  print("I am tapped on the ticket $index");

                  Navigator.pushNamed(context, AppRoutes.ticketScreen, arguments: {
                    "index": index
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TicketView(ticket: singleTicket, wholeScreen: true),
                ),
              );
            }).toList(),
      ),
    );
  }
}
