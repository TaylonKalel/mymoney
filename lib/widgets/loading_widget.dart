import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
      child: Center(
        child: SizedBox(
            width: 10.w,
            height: 10.w,
            child: const CircularProgressIndicator()),
      ),
    );
  }
}
