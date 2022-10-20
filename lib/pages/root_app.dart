import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/theme/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> listPage = [
      Center(
          child: Text("Home Page",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: black))),
      Center(
          child: Text("Search Page",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: black))),
      Center(
          child: Text("Upload Page",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: black))),
      Center(
          child: Text("Activity Page",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: black))),
      Center(
          child: Text("Account Page",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: black)))
    ];

    return IndexedStack(
      index: pageIndex,
      children: listPage,
    );
  }

  Widget getAppBar() {
    if (pageIndex == 0) {
      return AppBar(
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/camera_icon.svg",
              width: 24,
            ),
            Text(
              "Instagram",
              style: TextStyle(fontFamily: 'Billabong', fontSize: 28),
            ),
            SvgPicture.asset(
              "assets/images/message_icon.svg",
              width: 24,
            ),
          ],
        ),
      );
    } else if (pageIndex == 1) {
      return AppBar();
    } else if (pageIndex == 2) {
      return AppBar(
        toolbarHeight: 60,
        title: Text("Upload"),
        centerTitle: true,
        backgroundColor: appBarColor,
      );
    } else if (pageIndex == 3) {
      return AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: Text("Activity"),
        backgroundColor: appBarColor,
      );
    } else if (pageIndex == 4) {
      return AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        title: Text("Account"),
        backgroundColor: appBarColor,
      );
    } else {
      return AppBar();
    }
  }

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_icon.svg",
      pageIndex == 2
          ? "assets/images/upload_active_icon.svg"
          : "assets/images/upload_icon.svg",
      pageIndex == 3
          ? "assets/images/love_active_icon.svg"
          : "assets/images/love_icon.svg",
      pageIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];

    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(color: appFooterColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: SvgPicture.asset(
                  bottomItems[index],
                  width: 24,
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
