import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/app_colors.dart';

class SendFormAppBarWidget extends Container {
  static const double iconSize = 40;
  final BuildContext context;
  final VoidCallback submit;
  final bool isValid;
  SendFormAppBarWidget(
      {Key? key,
      required this.context,
      required this.isValid,
      required this.submit})
      : super(
          key: key,
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 2, color: AppColors.grey))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.close,
                        size: iconSize,
                      ),
                      onPressed: () => Navigator.pop(context)),
                  IconButton(
                    disabledColor: Colors.grey,
                    icon: Icon(
                      Icons.check,
                      size: iconSize,
                    ),
                    onPressed: isValid ? () {
                      submit();
                      Navigator.pop(context);
                    } : null,
                  )
                ]),
          ),
        );
}
