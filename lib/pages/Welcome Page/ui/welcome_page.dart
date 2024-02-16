import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roaming_radarr/colors/colors.dart';
import 'package:roaming_radarr/pages/RegisterPage/ui/register_page.dart';
import 'package:roaming_radarr/pages/Welcome%20Page/bloc/welcome_page_bloc.dart';
import 'package:roaming_radarr/widgets/app_large_text.dart';
import 'package:roaming_radarr/widgets/app_text.dart';
import 'package:roaming_radarr/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var images = [
    "img/hello-there-2.jpg",
    "img/welcome-one.png",
    "img/welcome-three.png",
    "img/hello-there-4.jpg",

  ];
  @override
  void initState() {
    welcomePageBloc.add(WelcomePageInitialEvent());
    super.initState();
  }

  final WelcomePageBloc welcomePageBloc = WelcomePageBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WelcomePageBloc, WelcomePageState>(
      bloc: welcomePageBloc,
      listenWhen: (previous, current) => current is WelcomePageActionState,
      buildWhen: (previous, current) => current is! WelcomePageActionState,
      listener: (context, state) {
        if (state is MovingToMainPage) {
          print('Hello');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        }
      },
      builder: (context, state) {
        if (state is WelcomePageSucessState) {
          return Scaffold(
            body: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        opacity: .9,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppLargeText(
                                text: 'Trips',
                                color:  Colors.black,
                              ),
                              AppText(text: 'Discover', size: 30.0,color: Colors.black,),
                              SizedBox(height: 20.0),
                              Container(
                                width: MediaQuery.of(context).size.width - 140,
                                child: AppText(
                                    text:
                                        'Mountain hikes give you an incredible sense of freedom along with endurance test.',
                                    color:  Colors.black,
                                    size: 15,
                                ),
                              ),
                              SizedBox(height: 40.0),
                              GestureDetector(
                                onTap: () {
                                  welcomePageBloc.add(MainPageClickEvent());
                                },
                                child: Container(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      ResponsiveButton(width: 120),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: List.generate(4, (indexDots) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 3),
                                width: 8,
                                height: index == indexDots ? 25 : 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),

                                  color: index == indexDots
                                      ? AppColors.mainColor
                                      : AppColors.mainColor.withOpacity(.7),
                                ),
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
