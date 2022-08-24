import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black45),
      body: Column(
        children: [
          Container(
            child: Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_7psw7qge.json'),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Welcome to the Home Page',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}
