import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_test/features/home/data/home_data_model.dart';

class homeBody extends StatefulWidget {
  homeBody({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  State<homeBody> createState() => _homeBodyState();
}

class _homeBodyState extends State<homeBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: SilderBarSection(),
          ),
        ),
      ),
    );
  }
}

// class image_silder extends StatelessWidget {
//   const image_silder({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 35),
//       child: CarouselSlider.builder(
//         itemCount: HomeData.length,
//         options: CarouselOptions(),
//         itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
//             Container(
//           child: Image(image: AssetImage(HomeData[itemIndex].imagePath)),
//         ),
//       ),
//     );
//   }
// }

class SilderBarSection extends StatelessWidget {
  const SilderBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHomeViewAppBar(),
        // image_silder(),
        SizedBox(
          height: 20,
        ),
        CustomCategoryListView(),
      ],
    );
  }
}

class CustomHomeViewAppBar extends StatelessWidget {
  const CustomHomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Solar Power",
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFF07A66FF),
            fontWeight: FontWeight.bold,
          ),
        ),
        FaIcon(FontAwesomeIcons.magnifyingGlass),
      ],
    );
  }
}

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
        scrollDirection: Axis.horizontal,
        itemCount: HomeData.length,
        itemBuilder: (_, index) {
          return const CustomCategoryListViewItem();
        },
      ),
    );
  }
}

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 10, offset: const Offset(0, 7))
          ]),
      child: Column(
        children: [
          ListView.builder(itemBuilder: (BuildContext context, int index) {
            
            Container(
              width: 74,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(
                      "assets/components of solar power/solar cell.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            );

            SizedBox(height: 11);
            Text(
              "Lionheart",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            );
          })
        ],
      ),
    );
  }
}
