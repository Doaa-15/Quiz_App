import 'package:flutter/material.dart';
import 'package:quiz_app/feature/home/presentation/screen/questions_screen.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  
@override
  void initState() {
   Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return QuestionsScreen();
          },
        ),
      );
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/image/logo.png", width: 300, height: 300),
          Text(
            "Quiz App",
            style: TextStyle(
              color: const Color.fromARGB(255, 230, 214, 93),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          CircularProgressIndicator(color: const Color.fromARGB(255, 230, 214, 93)),
        ],
      ),
    );
  }
}
