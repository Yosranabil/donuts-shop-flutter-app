import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Constants/Components/buttonWidget.dart';
import '../../Constants/Components/passtextformfeildWidget.dart';
import '../../Constants/Components/textformfieldWidget.dart';
import '../../Constants/Variables/Const.dart';
import '../MyappScreens/Cover.dart';
import '../../core/data_provider/remote/fireBaseHelper.dart';

class signin extends StatefulWidget {
  signin({Key? key}) : super(key: key);
  @override
  State<signin> createState() => _signinState();

}

class _signinState extends State<signin> {

  final _key = GlobalKey<FormState>();
  bool visible = true;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                          ),
                          child: Image.asset(
                            'Images/najlacam-F71ZHHBYs3w-unsplash.jpg',
                          )),
                      const Text(
                        'SignIn',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFCDF0EA),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFFCDF0EA),
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                      'Images/7b9cd021df1cad1c974a82f58ff994a9.png'),
                                ),
                                Text(
                                  'With Google',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFCDF0EA),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xFFCDF0EA),
                                  backgroundImage: AssetImage(
                                      'Images/2576de3a4df8d3cf899e9a9a74168b44.jpg'),
                                ),
                                Text(
                                  'With Facebook',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: SizedBox(
                      child: Text(
                        'or',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Form(
                      key: _key,
                      child: Column(
                        children: [
                          formfieldWidget(
                            textController: emailController,
                            texttype: TextInputType.emailAddress,
                            errortext:
                                'A valid email should be not empty and \n in form of (@ .com).',
                            labeltext: 'Email',
                            textExp: emailExp,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          passformfieldWidget(
                            textExp: passExp,
                            visible: visible,
                            textController: passwordController,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: double.infinity,
                            child: ButtonWidget(
                              text: 'SignIn',
                              onClick: signInParameter,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Don\' have an account? SignUp',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
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

  Future<void> signInParameter() async {
    if (_key.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFAB72C0),
                strokeWidth: 7,
              ),
            );
          });
      FireBaseHelper()
          .signIn(emailController.text.toString(),
          passwordController.text.toString())
          .then((value) {
        if (value is User) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                  Text(
                    "Hello ${value.displayName}",
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
              ));
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              Cover_page(),));
        } else if (value is String) {
          ScaffoldMessenger.of(context)
              .showSnackBar(
              SnackBar(
                  content: Text(
                      value,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                    label: 'Dismiss',
                    disabledTextColor: Colors.white,
                    textColor: const Color(0xFFAB72C0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
              ));
          Navigator.pop(context);
        }
      });
    }
  }



}
