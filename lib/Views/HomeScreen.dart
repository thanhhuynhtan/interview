import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview/Utils/TwitterAvatarTag.dart';
import 'package:interview/Utils/localization.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildTopNews(
    String photoAsset,
    String avatarAsset,
    String uploaderName,
    String uploaderTag,
  ) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 8.h,
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalization.of(context)!
                  .translate('Home.Headline')
                  .toUpperCase(),
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 12.sp,
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(photoAsset), fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 2.h,
              bottom: 4.h,
            ),
            child: TwitterAvatarTag(
              asset: avatarAsset,
              name: uploaderName,
              tag: uploaderTag,
            ),
          ),
          Container(
            height: 8.h,
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalization.of(context)!
                  .translate('Home.BrowseAll')
                  .toUpperCase(),
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPageContent() {
    return Container(
      child: StaggeredGridView.countBuilder(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
        ),
        crossAxisCount: 2,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return buildTopNews(
              "assets/image/home_1.png",
              "assets/image/home_avar.png",
              "Ridhwan Nordin",
              "@ridzjcob",
            );
          } else if (index == 11) {
            return seeMoreButton();
          } else {
            return Image.asset(
              "assets/image/home_${index + 1}.png",
              fit: BoxFit.fitWidth,
            );
          }
        },
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(
          (index == 0 || index == 11) ? 2 : 1,
        ),
        mainAxisSpacing: 5.sp,
        crossAxisSpacing: 5.sp,
      ),
    );
  }

  Widget seeMoreButton() {
    return Container(
      height: 15.h,
      width: double.infinity,
      child: Center(
        child: Container(
          height: 7.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 2.sp,
              color: Colors.black,
            ),
          ),
          child: TextButton(
            child: Text(
              AppLocalization.of(context)!.translate('Home.More').toUpperCase(),
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 12.sp,
              ),
            ),
            onPressed: () {
              print("HomeScreen - See More Button - Pressed");
            },
          ),
        ),
      ),
    );
  }

  Widget buildNavigationBar() {
    return Container(
      height: 8.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(
              0.0,
              -0.5.sp,
            ),
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: buildNavigateButton(
              iconAsset: "assets/icon/home.png",
              onPressed: () {},
            ),
          ),
          Expanded(
            child: buildNavigateButton(
              iconAsset: "assets/icon/search.png",
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 2.w,
              ),
            child: Container(
              height: 6.h,
              width: 22.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  30.sp,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFF00D6),
                    Color(0xFFFF4D00),
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  height: 2.7.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/icon/add.png",
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: buildNavigateButton(
              iconAsset: "assets/icon/comment.png",
              onPressed: () {},
            ),
          ),
          Expanded(
            child: buildNavigateButton(
              iconAsset: "assets/icon/person.png",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavigateButton({
    required String iconAsset,
    required VoidCallback onPressed,
  }) {
    return Container(
      child: MaterialButton(
        child: Center(
          child: Container(
            height: 2.7.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(iconAsset),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 4.h,
                  left: 4.w,
                  right: 4.w,
                ),
                child: Container(
                  height: 10.h,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalization.of(context)!.translate('Home.Title'),
                    style: GoogleFonts.comfortaa(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 30.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: buildPageContent(),
              ),
              buildNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}
