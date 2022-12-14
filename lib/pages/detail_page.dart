import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';

import '../widgets/app_text.dart';
import '../widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  int gottenStar = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "img/mountain.jpeg"
                          ),
                          fit: BoxFit.cover,
                      ),
                  ),
                )
            ),
            Positioned(
              left: 8,
                top: 50,
                right: 20,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: ()=>{},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 30,)
                    ),
                    const SizedBox(width: 300,),
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                )
            ),
            Positioned(
              top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: "Yosemite", color: Colors.black.withOpacity(0.8),),
                          AppLargeText(text: "\$ 350", color: AppColors.mainColor,)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: AppColors.mainColor,),
                          SizedBox(width: 8,),
                          AppText(text: "USA, California"),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                      children: [
                        Wrap(
                          children:
                          List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index<gottenStar ? AppColors.starColor : AppColors.textColor2,);
                          }),
                        ),
                        const SizedBox(width: 10,),
                        AppText(text: "(4.0)", color: AppColors.textColor2,)
                      ],
                    ),
                      const SizedBox(height: 30,),
                      AppLargeText(text: "People", size: 20, color: Colors.black.withOpacity(0.8),),
                      const SizedBox(height: 10,),
                      AppText(text: "Number of people in your group", color: AppColors.mainColor,),
                      const SizedBox(height: 20,),
                      Wrap(
                        children: List.generate(5, (index){
                          return InkWell(
                            onTap:() {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: AppButton(
                                size: 60,
                                color: selectedIndex == index ? Colors.white : Colors.black,
                                backgroundColor: selectedIndex == index ? Colors.black: AppColors.buttonBackground ,
                                borderColor: selectedIndex == index ? Colors.black: AppColors.buttonBackground ,
                                text: (index + 1).toString(),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20,),
                      AppLargeText(text: "Description", color: Colors.black.withOpacity(0.8),),
                      const SizedBox(height: 10,),
                      AppText(text: "Travelling and going to vacation may have an"
                          " impact on your production because your mind will be relaxed.",
                      color: AppColors.mainTextColor,)
                    ],

                  ),
                )
            ),
            Positioned(
              bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButton(
                        size: 60,
                        color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor1,
                        isIcon: true,
                        icon: Icons.favorite_border,
                    ),
                    ResponsiveButton(
                      isResponsive: true,
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
