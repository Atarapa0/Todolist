import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constants/constans.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: Column(
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Header/Header.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Date',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text(
                      'Todo List',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.menu_open_outlined,
                            size: 50,
                          ),
                          Text(
                            'Study Lesson',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Checkbox(
                              value: isChecked,
                              onChanged: (val) => {
                                    setState(() {
                                      isChecked = val!;
                                    })
                                  }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
