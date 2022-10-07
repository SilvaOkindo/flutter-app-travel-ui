import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  // image list
  List image = [
    "balloning.png",
    "hiking.png",
    "kayaking.png",
    "snorkling.png"
  ];
  // text list
  List texts = [
    "Balloning",
    "Hiking",
    "Kayaking",
    "Snorkling"
  ];


  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // menu and icon person container
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, size: 30, color: Colors.black54,),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Icon(Icons.person, color: Colors.black54, size: 40,),
                )
              ],
            ),
          ),
          const SizedBox(height: 40,),
          Container(
            padding: const EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Discover"
              )
          ),
          const SizedBox(height: 40,),
          // tab bars
          TabBar(
            controller: tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            labelPadding: const EdgeInsets.only(left: 20, right: 20),
            indicator: CircleIndicator(color: AppColors.mainColor, radius: 4),
            tabs: const [
              Tab(text: "Places",),
              Tab(text: "Inspiration",),
              Tab(text: "Emotions",),
            ],
          ),
          SizedBox(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
                controller: tabController,
                children: [
                 Container(
                   padding: const EdgeInsets.only(left: 20),
                   child: ListView.builder(
                     itemCount: 3,
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (_, index){
                         return  Container(
                           margin: const EdgeInsets.only(top: 10, right: 15),
                           height: 300,
                           width: 200,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(20),
                             image: const DecorationImage(
                                 image: AssetImage(
                                     "img/mountain.jpeg"
                                 ),
                                 fit: BoxFit.cover
                             ),
                           ),
                         );
                       }),
                 ),
                  Text("There"),
                  Text("Bye"),
            ]),
          ),
          const SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore more", size: 22,),
                AppText(text: "See all", color: AppColors.textColor1,)
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 120,
            width: double.maxFinite,
            child: ListView.builder(
                itemCount: image.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                         // margin: const EdgeInsets.only(right: 50),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(
                                "img/" + image[index]
                            ),
                                fit: BoxFit.cover
                        ),
                      ),
                    ),
                        const SizedBox(height: 10,),
                        Container(
                          child: AppText(text: texts[index],color: AppColors.textColor2,),
                        )
                ],
              ),
                  );
            }),
          )
        ],
      ),
    );
  }
}

//circle indicator
class CircleIndicator extends Decoration {
  double radius;
  final Color color;

  //
  CircleIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {

    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  double radius;
  final Color color;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2
        , configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }

}
