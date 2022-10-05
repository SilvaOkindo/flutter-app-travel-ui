import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png"
  ];

  List texts = [
    "Mountains",
    "Valley",
    "Water Falls"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "img/" + images[index]
                  ),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trips",),
                        AppText(text: texts[index], size: 30,),
                        const SizedBox(height: 20,),
                        Container(
                          width: 250,
                          child: AppText(
                            text: "Mountain hikes gives you an incredible sense of freedom along with endurance test.",
                            color: AppColors.textColor2,
                            size: 16,
                        )
                        ),
                        const SizedBox(height: 40,),
                        ResponsiveButton()
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots){
                          return Container(
                            height: index == indexDots ? 25 : 8,
                            width: 8,
                            margin: const EdgeInsets.only(bottom: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3)
                            ),
                          );
                        }),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
