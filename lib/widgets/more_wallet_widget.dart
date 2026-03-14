import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class MoreWallet extends StatelessWidget {
  const MoreWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(10),
          color: Colors.black,
          strokeWidth: 2,
          dashPattern: [9, 9],
        ),
        child: Center(child: Icon(Icons.add)),
      ),
    );
  }
}
