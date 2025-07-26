import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightSized extends StatelessWidget {
  const WeightSized({super.key, required this.weight});

  final double weight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: weight.w);
  }
}