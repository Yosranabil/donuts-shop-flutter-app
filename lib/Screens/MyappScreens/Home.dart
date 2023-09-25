import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'Buy.dart';
import 'Profile.dart';

class Home extends StatelessWidget {

  List<Info> menu = [
    Info(
        name: 'Strawberry Frost',
        image:
            "Images/Dunkin' Donuts Malaysia - World's leading baked goods and coffee chain (1).png",
        message: 'Strawberry Frosted Donuts feature fresh strawberries.',
        price: 75),
    Info(
        name: 'Bendera Donut',
        image:
            "Images/Dunkin' Donuts Malaysia - World's leading baked goods and coffee chain (2).png",
        message: 'cake made of rich, light dough that is fried in oil',
        price: 65),
    Info(
        name: 'Choc Frost Donut',
        image:
            "Images/Dunkin' Donuts Malaysia - World's leading baked goods and coffee chain (3).png",
        message:
            'a fluffy vanilla doughnut, topped with a silky chocolate frosting.',
        price: 60),
    Info(
        name: 'Sugar Raised',
        image:
            "Images/Dunkin' Donuts Malaysia - World's leading baked goods and coffee chain (4).png",
        message: 'a doughnut made light with yeast rather than baking powder.',
        price: 70),
    Info(
        name: 'Choc Almond',
        image:
            "Images/Dunkin' Donuts Malaysia - World's leading baked goods and coffee chain (5).png",
        message:
            'a fluffy vanilla doughnut, topped with a silky chocolate frosting, stuffed with almond.',
        price: 60),
    Info(
        name: 'Crunchy Choc',
        image:
            "Images/Dunkin' Donuts Malaysia - World's leading baked goods and coffee chain (6).png",
        message: 'crunchy chocolate doughnut, topped with chocolate frosting.',
        price: 55),
    Info(
        name: 'Black Frost Donut',
        image:
            "Images/Dunkin' Donuts Malaysia - World's leading baked goods and coffee chain (7).png",
        message:
            'deliciously light soft buttery cake donuts frosted with a sweet and creamy strawberry frosting',
        price: 90),
    Info(
        name: 'Bavarian Donut',
        image:
            "Images/Dunkin' Donuts Malaysia - World's leading baked goods and coffee chain (8).png",
        message:
            'light soft buttery donuts that are topped with sugar powder and stuffed with chocolate sauce.',
        price: 40),
    Info(
        name: 'Signature Latte',
        image: "Images/Dunkin' Donuts Iced Caramel Latte Lite (Small) 80….png",
        message: 'Iced Caramel Latte Lite topped with whipped cream.',
        price: 100),
    Info(
        name: 'Iced Americano',
        image: "Images/8103d927-e6b1-489b-8264-b8e7a4abdc45.png",
        message:
            'Espresso shots topped with cold water produce a light layer of cream, then served over ice.',
        price: 90),
    Info(
        name: 'Frozen Lotus',
        image: "Images/913bf08b-f2ed-4ef1-9537-f9ad905fca04.png",
        message:
            'Iced Caramel coffee topped with whipped cream and crunched lotus.',
        price: 105),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PlayfairDisplay'),
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(20),
                  bottomStart: Radius.circular(20))),
          backgroundColor: Color(0xFFAB72C0),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              MdiIcons.arrowLeft,
              size: 30,
            ),
          ),
          title: Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => profile()));
                  },
                  icon: Icon(
                    MdiIcons.account,
                    size: 30,
                  )),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsetsDirectional.only(
            top: 10,
          ),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) => buildItem(menu[index], context),
            separatorBuilder: (context, index) => SizedBox(
              height: 20,
            ),
            itemCount: menu.length,
          ),
        ),
      ),
    );
  }

  Widget buildItem(Info i, BuildContext c) => Container(
        child: InkWell(
          onTap: () {
            Navigator.push(
              c,
              MaterialPageRoute(
                  builder: (context) => Pay(i.price, i.name, i.image)),
            );
          },
          child: Container(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.5,
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Row(
              children: [
                Image(
                  image: AssetImage(i.image),
                  height: 145,
                  width: 145,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        i.name,
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xFFAB72C0),
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        i.message,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 70,
                    end: 30,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.grey[200],
                    ),
                    child: Text(
                      '\$${i.price}',
                      style: TextStyle(
                        color: Colors.pink[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ),
      );
}

class Info {
  final String name;
  final String image;
  final String message;
  final int price;

  Info({
    required this.name,
    required this.image,
    required this.message,
    required this.price,
  });
}
