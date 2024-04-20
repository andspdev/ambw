import 'package:flutter/material.dart';
import '../includes/datamost.dart';

class CardPopular extends StatelessWidget {
  final DataMost data;

  const CardPopular({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      width: double.infinity,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color.fromARGB(255, 209, 209, 209)
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), 
                topRight: Radius.circular(10)
              ),
              child: SizedBox(
                height: 220,
                width: double.infinity,
                child: Image.asset(data.gambar,
                  width: double.infinity,
                  fit: BoxFit.cover
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.judul,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data.deskripsi,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(157, 157, 157, 1)
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    data.alamat,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(157, 157, 157, 1)
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}