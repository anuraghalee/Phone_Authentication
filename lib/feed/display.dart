import 'package:flutter/material.dart';
import 'package:twitterapp/common/appbar.dart';
import 'package:twitterapp/common/asset_constants.dart';
import 'package:twitterapp/services/auth.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  int value = 0;

  Widget customRadio(String heading, String text, String img, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          value = index;
        });
      },
      child: Container(
        margin: index == 1 ? const EdgeInsets.symmetric(vertical: 25) : const EdgeInsets.all(0),
        padding: const EdgeInsets.only(
          left: 15,
          top: 30,
          bottom: 30,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            value == index
                ? const Icon(
                    Icons.circle,
                    size: 40,
                    color: Colors.black,
                  )
                : const Icon(
                    Icons.circle_outlined,
                    size: 40,
                    color: Colors.black,
                  ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                img,
                width: 40,
                height: 40,
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        letterSpacing: 0.07,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black.withOpacity(0),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 150,
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 70,
                  bottom: 30,
                ),
                child: Text(
                  'Please select your profile',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            Column(
              children: [
                customRadio('Shipper', 'Lorem ipsum dolor sit amet, consectetur adipiscing', AssetConstants.home, 0),
                customRadio('Transporter', 'Lorem ipsum dolor sit amet, consectetur adipiscing', AssetConstants.home, 1),
              ],
            ),
            Container(
              height: 60,
              color: const Color.fromRGBO(46, 59, 98, 1),
              child: ElevatedButton(
                onPressed: () async {
                  await AuthService.instace.auth.signOut();
                  if (mounted) Navigator.of(context).popAndPushNamed('/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                child: const Text(
                  'CONTINUE',
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 16,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
