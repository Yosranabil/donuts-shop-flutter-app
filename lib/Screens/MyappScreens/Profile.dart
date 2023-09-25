import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:task_5/Screens/Authentication/Signup.dart';
import '../../Constants/Components/buttonWidget.dart';
import '../../Constants/Variables/Const.dart';
import '../../core/data_provider/remote/fireBaseHelper.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PlayfairDisplay'),
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                              ),
                            ),
                            child: Image.asset(
                              'Images/najlacam-F71ZHHBYs3w-unsplash.jpg',
                            )),
                        CircleAvatar(
                          radius: 95,
                          backgroundColor: Color(0xFFAB72C0),
                          child: CircleAvatar(
                            radius: 91,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 89,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                  'Images/isaac-quesada-0kF7wNPl1kk-unsplash.jpg'),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg",
                                fit: BoxFit.contain,
                                imageBuilder: (context, imageProvider) =>
                                    CircleAvatar(
                                        radius: 86,
                                        backgroundImage: imageProvider),
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 7,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        PositionedDirectional(
                          start: 6.5,
                          top: 1,
                          child: Container(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  MdiIcons.arrowLeft,
                                  color: Colors.black,
                                  size: 30,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 40,
                        bottom: 10,
                      ),
                      child: Text(
                        username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Text(
                      '@${username.replaceAll(' ','')}',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w600,
                        fontFamily: 'IndieFlower',
                        fontSize: 20,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ButtonWidget(
                        text: 'LogOut',
                        onClick: () {
                          FireBaseHelper().signOut();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => signup()));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        bottom: 10,
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              MdiIcons.cog,
                              color: Color(0xFFAB72C0),
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Settings',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFAB72C0),
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        bottom: 10,
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              MdiIcons.account,
                              color: Color(0xFFAB72C0),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Friend',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFAB72C0),
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        bottom: 10,
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              MdiIcons.accountMultiple,
                              color: Color(0xFFAB72C0),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'New Group',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFAB72C0),
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
