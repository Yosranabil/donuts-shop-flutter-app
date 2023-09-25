import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:lottie/lottie.dart';

class Cover_page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'Images/360_F_443662762_LvyE7HJr6Evk2VPcjit0zepjXlm47DaK.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 70,
                  ),
                  child: Text(
                    'Donuts House',
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                      color: Color(0xFFAB72C0),
                      wordSpacing: -5,
                    ),
                  ),
                ),
                Lottie.asset('Lotties/131846-coffee-and-donut.json'),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 50),
                    backgroundColor: Color(0xFFAB72C0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Text(
                    'Home Page',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 24,
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
}
