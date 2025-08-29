import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  final String pray;
  final String time;
  final String image;
  const Time({
    super.key, 
    required this.pray, 
    required this.time, 
    required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(pray),
        Spacer(),
        Text(time),
        SizedBox(width: 25,),
        Image.asset('assets/images/img_clock.png')
      ],
    );
  }
}
