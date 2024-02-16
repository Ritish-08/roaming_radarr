import 'package:flutter/material.dart';
import 'package:roaming_radarr/colors/colors.dart';
import 'package:roaming_radarr/widgets/app_text.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({super.key, this.width, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor),
        child: Padding(
          padding:
              isResponsive == true ? EdgeInsets.all(20.0) : EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                  text: isResponsive == true ? "Book Trip Now" : '',
                  color: Colors.white),
              if (isResponsive == true) SizedBox(width: 40),
              Image.asset('img/button-one.png'),
            ],
          ),
        ),
      ),
    );
  }
}
