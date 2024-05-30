import 'package:mymoney/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LinkWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Function()? onclick;
  const LinkWidget({super.key, required this.text, this.onclick, this.style});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: TextWidget(
        text: text,
        style:
            style ?? TextStyle(color: Theme.of(context).colorScheme.tertiary),
      ),
    );
  }
}
