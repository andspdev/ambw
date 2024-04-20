import 'package:flutter/material.dart';

import '../includes/carddata_popular.dart';
import '../includes/datamost.dart';


class PopularPage extends StatelessWidget
{

  const PopularPage({
    super.key, 
    required this.items,
    required this.title
  });

  final String title;
  final List<DataMost> items;

  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp(
        title: '$title | UTS AMBW - C14210004',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
            title: Text(title, 
              style: const TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold)
            ),
            centerTitle: true,
            shape: const Border(
              bottom: BorderSide(
                color: Color.fromARGB(255, 196, 195, 195),
                width: 1
              )
            ),
            elevation: 1,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back), // Ganti dengan ikon yang diinginkan
              onPressed: () {
                Navigator.of(context).pop(); // Kode untuk kembali ke halaman sebelumnya
              },
            ),
        ),
        body: Container(
          color: const Color.fromRGBO(251, 248, 248, 1),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemCount: items.length,
            itemBuilder: ((context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CardPopular(data: items[index]),
              );
            })
          ),
        )
      )
    );
  }
}
