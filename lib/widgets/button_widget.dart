import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonWidget extends StatefulWidget {
  final VoidCallback? onclick;
  final String title;
  final double? width;
  final double? height;

  const ButtonWidget(
      {super.key, required this.title, this.onclick, this.width, this.height});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor:
          Theme.of(context).colorScheme.primary, // surfaceTintColor: ,
      minimumSize: Size(15.w, 5.h),
      maximumSize: Size(15.w, 5.h),
      padding: const EdgeInsets.symmetric(horizontal: 16),
    );

    if (Device.screenType == ScreenType.mobile) {
      style = ElevatedButton.styleFrom(
        minimumSize: Size(80.w, 5.h),
        maximumSize: Size(80.w, 5.h),
        backgroundColor:
            Theme.of(context).colorScheme.primary, // surfaceTintColor: ,

        padding: const EdgeInsets.symmetric(horizontal: 16),
      );
    }

    return ElevatedButton(
      style: style,
      onPressed: widget.onclick,
      child: Text(
        widget.title,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
