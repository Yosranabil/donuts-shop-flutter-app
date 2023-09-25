import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Pay extends StatefulWidget {
  int price;
  String name;
  String image;
  Pay(this.price, this.name, this.image);

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  bool check1 = false;
  bool check2 = false;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

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
              'Checkout',
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
                  onPressed: () {},
                  icon: Icon(
                    MdiIcons.menu,
                    size: 28,
                  )),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Text(
                          '${widget.name}',
                          style: TextStyle(
                            color: Color(0xFFAB72C0),
                            fontSize: 75,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Positioned(
                          top: 130,
                          child: Image(
                            image: AssetImage(widget.image),
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 10,
                      ),
                      child: Text(
                        'Extra:',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '- Caramel',
                          style: TextStyle(
                            fontSize: 25.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '(+\$ 15)',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        Checkbox(
                            activeColor: Color(0xFFAB72C0),
                            value: check1,
                            onChanged: (value) {
                              setState(() {
                                check1 = value!;
                                if (value == false) {
                                  widget.price = (widget.price) - 15;
                                }
                                if (value == true) {
                                  widget.price = (widget.price) + 15;
                                }
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '- Chocolate',
                          style: TextStyle(
                            fontSize: 25.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '(+\$ 20)',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                        ),
                        Checkbox(
                          value: check2,
                          activeColor: Color(0xFFAB72C0),
                          onChanged: (value) {
                            setState(() {
                              check2 = value!;
                              if (value == false) {
                                widget.price = (widget.price) - 20;
                              }
                              if (value == true) {
                                widget.price = (widget.price) + 20;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 30,
                ),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.5, color: Colors.black12),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text(
                    '      Total Price: \$${widget.price}',
                    style: TextStyle(
                      color: Colors.pink[300],
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text(
                'Succeeded',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              content: const Text(
                'Thank you for using our app',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          backgroundColor: Color(0xFFAB72C0),
          child: Icon(
            MdiIcons.check,
            size: 30,
          ),
        ),
      ),
    );
  }
}
