import 'package:flutter/material.dart';
import 'package:todo_list/UI/home_page.dart';
import 'consants/color_file.dart';

class StartPage2 extends StatefulWidget {
  const StartPage2({super.key});

  @override
  State<StartPage2> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 100),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'I want to organize your task',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Quam risus sem amet. Condimentum magna vitae mauris sed integer lacus nec arcu. Gravida s',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(top: 120),
                          child: Container(
                            width: 200,  // Resmin genişliğini ayarlayın
                            height: 200, // Resmin yüksekliğini ayarlayın
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50), // Köşeleri daha yuvarlak yapmak için değeri artırdık
                              image: DecorationImage(
                                image: AssetImage('assets/image1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white, // Container'ın arka plan rengi
                padding: const EdgeInsets.all(30),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, // Butonun arka plan rengi
                          shadowColor: Colors.transparent, // Gölgeyi kaldırmak için
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87, // Buton üzerindeki metin rengi
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
