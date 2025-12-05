import 'package:bravoo/Screens/signup.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // ------- STAGGERED COIN PATTERN -------
            Expanded(
              child: Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: buildCoinRow(offset: false)),
                    Expanded(child: buildCoinRow(offset: true)),
                    Expanded(child: buildCoinRow(offset: false)),
                    Expanded(child: buildCoinRow(offset: true)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Yes, we reward your productivity",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dot(false),
                dot(false),
                dot(false),
                dot(true),
              ],
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: GestureDetector(
                onTap: () {
                  _openmodaloverlay(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF000000),
                        Color(0xFF2B2B2B),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _openmodaloverlay(BuildContext context){
  return showModalBottomSheet(
    context: context, 
    isScrollControlled: true, 
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    showDragHandle: true,
    elevation: 3,
    builder: (context) => SignUpScreen(),
    ); 

}

  Widget buildCoinRow({required bool offset}) {
    return Padding(
      padding: EdgeInsets.only(left: offset ? 40 : 0, right: 0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              "assets/images/coin.png",
              width: 60,
              height: 100,
              fit: BoxFit.contain,
            ),
          );
        }),
      ),
    );
  }

  Widget dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 10 : 7,
      height: active ? 10 : 7,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.black : Colors.grey.shade400,
      ),
    );
  }
}
