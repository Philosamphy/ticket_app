import 'package:flutter/material.dart';

class TicketPositionedCircles extends StatelessWidget {
  final bool? pos;
  const TicketPositionedCircles({super.key, this.pos});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: pos==true?22:null,
      right: pos==true?null:22,
      top: 250,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Color(0xFFFFFFFF)),
        ),
        child: CircleAvatar(maxRadius: 4, backgroundColor: Color(0xFFFFFFFF)),
      ),
    );
  }
}
