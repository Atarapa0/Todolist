import 'package:flutter/material.dart';
import 'package:todo_list/UI/consants/color_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu), // Sol tarafta menü butonu
          onPressed: () {
            // Menü sayfasına gitme işlemi
          },
        ),
        title: Text('TaskNest'),
        backgroundColor: ColorFile.backgroundColor,
        actions: [
          IconButton(
            icon: Icon(Icons.settings), // Sağ tarafta ayarlar butonu
            onPressed: () {
              // Ayarlar sayfasına gitme işlemi
            },
          ),
        ],
      ),
      body: Container(
        color: ColorFile.primaryColor,
      )
    );
  }
}
