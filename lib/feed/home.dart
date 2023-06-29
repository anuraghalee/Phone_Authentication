import 'package:flutter/material.dart';
import 'package:twitterapp/common/asset_constants.dart';
import 'package:twitterapp/common/drawer.dart';
import 'package:twitterapp/login/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> sckey = GlobalKey();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
        value: "English",
        child: Text(
          "English",
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 16,
          ),
        ),
      ),
      DropdownMenuItem(
          value: "French",
          child: Text(
            "French",
            style: TextStyle(
              fontFamily: 'Mont',
              fontSize: 16,
            ),
          )),
      DropdownMenuItem(
        value: "Hindi",
        child: Text(
          "Hindi",
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 16,
          ),
        ),
      ),
      DropdownMenuItem(
        value: "Spanish",
        child: Text(
          "Spanish",
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 16,
          ),
        ),
      ),
    ];
    return menuItems;
  }

  String selectedvalue = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: sckey,
      // appBar: const Appbar(),
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset(AssetConstants.logo),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 35),
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Please select your Language',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Text(
                            'You can change the language at any time.',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 220,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: DropdownButtonFormField(
                        items: dropdownItems,
                        value: selectedvalue,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        isExpanded: true,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      width: 220,
                      height: 50,
                      color: const Color.fromRGBO(46, 59, 98, 1),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                        child: const Text(
                          'NEXT',
                          style: TextStyle(
                            fontFamily: 'Mont',
                            fontSize: 16,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              child: Image.asset(AssetConstants.vector1),
            ),
          )
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}
