import 'package:flutter/material.dart';
import '../includes/carddata_home.dart';
import '../includes/datamost.dart';
import '../pages/popularpage.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _Home createState() => _Home();
}


class _Home extends State<Home>
{
  final List<DataMost> dataMostPopular = [
    DataMost(
      gambar: 'assets/makanan/kfc.jpg',
      judul: 'KFC Broadway',
      deskripsi: '122 Queen Street',
      alamat: 'Fried Chicken, American',
    ),
    DataMost(
      gambar: 'assets/makanan/burritos.jpeg',
      judul: 'Greek House',
      deskripsi: '23 Queen Street',
      alamat: 'Burritos, Greek',
    ),
    DataMost(
      gambar: 'assets/makanan/noodles.jpg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
    DataMost(
      gambar: 'assets/makanan/pizza.jpg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
    DataMost(
      gambar: 'assets/makanan/sushi.jpg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
    DataMost(
      gambar: 'assets/makanan/lemon-tea.jpg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
    DataMost(
      gambar: 'assets/makanan/kfc.jpg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
    DataMost(
      gambar: 'assets/makanan/burritos.jpeg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
  ];


  final List<DataMost> dataMealDeals = [
    DataMost(
      gambar: 'assets/makanan/noodles.jpg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
    DataMost(
      gambar: 'assets/makanan/pizza.jpg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
    DataMost(
      gambar: 'assets/makanan/kfc.jpg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
    DataMost(
      gambar: 'assets/makanan/burritos.jpeg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
    DataMost(
      gambar: 'assets/makanan/sushi.jpg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
    DataMost(
      gambar: 'assets/makanan/kfc.jpg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
    DataMost(
      gambar: 'assets/makanan/lemon-tea.jpg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
    DataMost(
      gambar: 'assets/makanan/burritos.jpeg',
      judul: 'Lorem Ipsum',
      deskripsi: 'Lorem Ipsum is simply',
      alamat: 'Lorem Ipsum is not simply random text.',
    ),
  ];
  

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: 'Home | UTS AMBW - C14210004',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text("Sydney CBD", 
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold)
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                border: Border(
                  bottom: BorderSide(width: .5, color: Color.fromARGB(255, 196, 195, 195)),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Color.fromARGB(255, 193, 193, 193)), // Ganti warna sesuai keinginan
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Color.fromRGBO(6, 99, 220, 1)),
                  ),
                  hintText: 'Search for restaurant...',
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 160, 160, 160)),
                  prefixIcon: const Icon(Icons.search),
                ), // Untuk menyembunyikan teks input
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color:Color.fromRGBO(251, 248, 248, 1), // Ganti dengan warna latar belakang yang diinginkan
                ),
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 30),
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: const Offset(0, 2), // changes position of shadow
                              ),
                            ]
                          ),
                          child: Image.asset('assets/noodles.jpg', 
                            height: 280,
                            width: double.infinity,
                            fit: BoxFit.cover
                          ),
                        ),
                        Container(
                            color: Colors.black.withOpacity(0.28),
                            height: 280,
                            width: double.infinity,
                          
                        ),
                        const Positioned(
                          bottom: 35,
                          left: 18,
                          child: Text(
                            'Thai Style',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 12,
                          left: 18,
                          child: Text(
                            '12 Places',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    

                    // Most Popular
                    Container(
                      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 5),
                      child: Row(
                        children: [
                          const Expanded( 
                            child: Text(
                              'Most Popular',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => PopularPage(
                                    title: "Most Popular",
                                    items: dataMostPopular
                                  )
                                )
                              );
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(2, 199, 210, 1)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      height: 240,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dataMostPopular.length, 
                        itemBuilder: (context, index) {
                          return CardData(data: dataMostPopular[index]);
                      }),
                    ),

                    




                    // Meal Deals
                    Container(
                      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 5),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Meal Deals',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => PopularPage(
                                    title: "Meal Deals",
                                    items: dataMealDeals
                                  )
                                )
                              );
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(2, 199, 210, 1)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      height: 240,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8, 
                        itemBuilder: (context, index) {
                          return CardData(data: dataMealDeals[index]);
                      }),
                    ),

                  ],
                ),
              )
            )
          ]
        )
      ),
    );
  }
}