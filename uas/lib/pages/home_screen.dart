import 'package:flutter/material.dart';
import 'package:uas/constant/assets.dart';
import 'package:uas/constant/colors.dart';

class HomeScreen extends StatefulWidget 
{
  const HomeScreen({ super.key });

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: const BoxDecoration(
            color: backgroundColor,
            border: Border(
              bottom: BorderSide(
                color: smoothGrey,
                width: 2.0,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: smoothGrey,
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            title: const Text('NotesTaking', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textBlack
            ),),
            backgroundColor: backgroundColor,
            elevation: 0,
            actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.key_outlined),
                  color: textBlackAppBar,
                  tooltip: "Pengaturan PIN",
                  onPressed: () 
                  {

                  }
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 2),
                  child: IconButton(
                  icon: const Icon(Icons.search),
                  color: textBlackAppBar,
                  tooltip: "Pencarian",
                  onPressed: () 
                  {

                  },
                ),
              )
            ],
          ),
        ),
      ),
      
      body: Container(
        padding: const EdgeInsets.all(20),
        child: notesNotFound()
      ),

      floatingActionButton: FloatingActionButton(  
        onPressed: () 
        {
          print('Floating button pressed!');
        },
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.add, 
          color: whiteColor
        ),
      ),
    );
  }


  Widget notesNotFound()
  {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            assetsImagesEmptyData,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 10),
          const Text(
            'Tidak ada notes yang ditambahkan.',
            style: TextStyle(
              fontSize: 16,
              color:  textBlackNotesNotFound
            ),
          ),
          const SizedBox(height: 60),
        ],
      )
    );
  }
}