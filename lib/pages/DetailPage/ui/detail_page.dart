import 'package:flutter/material.dart';
import 'package:roaming_radarr/model/data_model.dart';

import '../../../colors/colors.dart';
import '../../../widgets/app_buttons.dart';
import '../../../widgets/app_large_text.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.product});
  final DataModel product;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:NetworkImage('http://mark.bslmeiyu.com/uploads/'+widget.product.img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 50,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                   Navigator.pop(context);
                  },
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, size: 25,),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            top: 320,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 30, top: 30),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                // adjust according to screen
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .background,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: widget.product.name,
                          size: 25,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.8),
                        ),
                        AppLargeText(
                          text: '\$ 300',
                          size: 25,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        AppText(
                            text: widget.product.location,
                            color: AppColors.textColor1),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: index < widget.product.stars
                                    ? AppColors.starColor
                                    : AppColors.textColor2);
                          }),
                        ),
                        SizedBox(width: 10.0),
                        AppText(
                          text: '(${widget.product.stars}.0)',
                          color: AppColors.textColor2,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    AppLargeText(
                        text: 'People',
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.8),
                        size: 20.0),
                    SizedBox(height: 5.0),
                    AppText(
                      text: 'Number of people in your group',
                      color: AppColors.mainTextColor,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            child: AppButtons(
                              size: 50,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              text: '${index + 1}',
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20),
                    AppLargeText(
                      text: 'Description',
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary
                          .withOpacity(.8),
                    ),
                    SizedBox(height: 5),
                    AppText(text: widget.product.description,
                      size: 14,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        AppButtons(size: 60,
                            color: AppColors.textColor1,
                            backgroundColor: Colors.white,
                            borderColor: AppColors.textColor1,
                            isIcon: true,
                            icon: Icons.favorite_border),
                        SizedBox(width: 20),
                        ResponsiveButton(
                          isResponsive: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
