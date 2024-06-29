import 'package:flutter/material.dart';

class TSectionWidget extends StatelessWidget {
  const TSectionWidget({
    super.key,
    this.textColor,
    this.showActionbutton = true,
    required this.title,
    this.buttonTitle = 'view all',
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionbutton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionbutton)
          TextButton(onPressed: () {}, child: Text(buttonTitle))
      ],
    );
  }
}