import 'package:flutter/material.dart';


class Profile extends StatelessWidget
{
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 50),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: const Color.fromARGB(255, 218, 218, 218), width: 2.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/user-icon.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    )
                  )
                )
              ],
            ),

            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Hi, Pandu!', 
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              )
            ),

            
            const SizedBox(height: 40),


            const Text('Full Name', 
              style: TextStyle(
                fontSize: 15
              )
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 218, 218, 218).withOpacity(.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]
              ),
              child: const Text('Andreas Pandu P', 
                style: TextStyle(
                  fontSize: 15
                )
              ),
            ),


            const SizedBox(height: 25),


            const Text('NRP', 
              style: TextStyle(
                fontSize: 15
              )
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 218, 218, 218).withOpacity(.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]
              ),
              child: const Text('C14210004', 
                style: TextStyle(
                  fontSize: 15
                )
              ),
            ),



            const SizedBox(height: 25),


            const Text('Email', 
              style: TextStyle(
                fontSize: 15
              )
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 218, 218, 218).withOpacity(.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]
              ),
              child: const Text('c14210004@john.petra.ac.id', 
                style: TextStyle(
                  fontSize: 15
                )
              ),
            ),



            const SizedBox(height: 25),



            const Text('Jenis Kelamin', 
              style: TextStyle(
                fontSize: 15
              )
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 218, 218, 218).withOpacity(.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]
              ),
              child: const Text('Laki-laki', 
                style: TextStyle(
                  fontSize: 15
                )
              ),
            ),



            const SizedBox(height: 25),


            const Text('Nomor Telepon', 
              style: TextStyle(
                fontSize: 15
              )
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 218, 218, 218).withOpacity(.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]
              ),
              child: const Text('+628123456789', 
                style: TextStyle(
                  fontSize: 15
                )
              ),
            ),


            const SizedBox(height: 25),


            const Text('Tanggal Bergabung', 
              style: TextStyle(
                fontSize: 15
              )
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 218, 218, 218).withOpacity(.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]
              ),
              child: const Text('16 April 2024', 
                style: TextStyle(
                  fontSize: 15
                )
              ),
            )

            
          ],
        ),
      ]
    );
  }
}