import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:uas/adapter/notes_adapter/notes.dart';
import 'package:uas/constant/styles.dart';
import 'package:uas/constant/colors.dart';
import 'package:uas/includes/functions.dart';
import 'package:uas/model/notes_model.dart';

class EditNotes extends StatefulWidget 
{
  final Notes note;
  const EditNotes({ required this.note });

  @override
  _EditNotes createState() => _EditNotes();
}

class _EditNotes extends State<EditNotes>
{
  DateTime now = DateTime.now();
  late Box<Notes> notesBox;
  late TextEditingController judulController;
  late TextEditingController deskripsiController;

  bool isModeBaca = true;

  @override
  void initState()
  {
    super.initState();

    judulController = TextEditingController(text: widget.note.judul);
    deskripsiController = TextEditingController(text: widget.note.deskripsi);
  }
  
  Future<void> hapusCatatan(BuildContext context, Notes note) async 
  {
    showDialog(
      context: context,
      builder: (BuildContext context) 
      {
        return AlertDialog(
          title: const Text('Hapus catatan Anda'),
          backgroundColor: backgroundColor,
          surfaceTintColor: backgroundColor,
          content: const Text('Apakah Anda ingin menghapus catatan Anda?'),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(primaryColor), 
                surfaceTintColor: MaterialStateProperty.all<Color>(backgroundColor),
                backgroundColor: MaterialStateProperty.all<Color>(backgroundColor)
              ),
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
                surfaceTintColor: MaterialStateProperty.all<Color>(backgroundColor),
                backgroundColor: MaterialStateProperty.all<Color>(backgroundColor)
              ),
              child: const Text('Ya'),
              onPressed: () async 
              {
                note.delete();

                Navigator.pop(context);
                Navigator.pop(context);
                snackbarMessage(context, 'Berhasil menghapus catatan Anda');
              },
            ),
          ],
        );
      }
    );
  }

  Future<void> simpanNote(BuildContext context) async
  {
    notesBox = await openNotesModel();
    String valJudul = judulController.value.text;
    String valDeskripsi = deskripsiController.value.text;

    if (valDeskripsi.isEmpty)
    {
      snackbarMessage(context, 'Deskripsi catatan masih kosong.');
    }
    else
    {
      Notes notesSave = Notes(
        judul: valJudul.trim(), 
        deskripsi: valDeskripsi.trim(), 
        createdAt: widget.note.createdAt, 
        updatedAt: now
      );


      widget.note.judul = notesSave.judul;
      widget.note.deskripsi = notesSave.deskripsi;
      widget.note.updatedAt = notesSave.updatedAt;
      widget.note.save();
      
      snackbarMessage(context, 'Berhasil menyimpan catatan Anda.');
    }
  }


  void showInformasiCatatan()
  {
    showDialog(
      context: context,
      builder: (BuildContext context) 
      {
        return AlertDialog(
          title: const Text('Informasi Catatan'),
          backgroundColor: backgroundColor,
          surfaceTintColor: backgroundColor,
          content: Text("Dibuat pada: ${DateFormat('d MMMM yyyy HH:mm').format(widget.note.createdAt)}.\nTerakhir diubah: ${DateFormat('d MMMM yyyy HH:mm').format(widget.note.updatedAt)}"),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(primaryColor), 
                surfaceTintColor: MaterialStateProperty.all<Color>(backgroundColor),
                backgroundColor: MaterialStateProperty.all<Color>(backgroundColor)
              ),
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    ); 
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
    backgroundColor: backgroundColor,
    appBar: PreferredSize(
      preferredSize: const Size.fromHeight(heightAppBar),
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
          backgroundColor: backgroundColor,
          surfaceTintColor: backgroundColor,
          title: const Text('Catatan Saya', style: TextStyle(
            fontSize: fontSizeAppBar,
            fontWeight: FontWeight.bold,
            color: textBlack
          )),
          elevation: 0,
          actions: [
            
            !isModeBaca ?
            IconButton(
              onPressed: () => 
              {
                setState(() {
                  isModeBaca = true;
                })
              }, 
              icon: const Icon(Icons.visibility_outlined, color: textBlackAppBar),
              tooltip: "Mode Baca",
            )
            : IconButton(
              onPressed: () => {
                setState(() {
                  isModeBaca = false;
                })
              }, 
              icon: const Icon(Icons.edit_outlined, color: textBlackAppBar),
              tooltip: "Mode Tulis",
            ),


            IconButton(
              onPressed: () => showInformasiCatatan(), 
              icon: const Icon(Icons.info_outline, color: textBlackAppBar),
              tooltip: "Informasi",
            ),
            


            Padding(
              padding: const EdgeInsets.only(right: 9, top: 2),
              child: IconButton(
                onPressed: () => hapusCatatan(context, widget.note), 
                icon: const Icon(Icons.delete_outline, color: textBlackAppBar),
                tooltip: "Hapus Catatan",
              ),
            )
          ],
        ),
      ),
    ),
    
    body: !isModeBaca ? bodyFormContainer() : modeBacaScroll(),


    floatingActionButton: 
    
    !isModeBaca ? FloatingActionButton(  
        onPressed: () => simpanNote(context),
        backgroundColor: primaryColor,
        tooltip: "Simpan Catatan",
        child: const Icon(
          Icons.save_as_outlined, 
          color: whiteColor
        ),
      ) : null


    );
  }


  Widget bodyFormContainer()
  {
    return Container(
      padding: const EdgeInsets.only(top: paddingContainer),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>
        [
          const SizedBox(height: 10),

          TextFormField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(paddingContainer),
              labelText:  "Judul",
              labelStyle: TextStyle(
                color: textBlackSmooth,
                fontSize: 18
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
            ),
            cursorColor: primaryColor,
            controller: judulController,
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(paddingContainer),
            child: Text(
              DateFormat('d MMMM yyyy HH:mm').format(widget.note.updatedAt),
              style: const TextStyle(
                fontSize: 12,
                color: textBlack
              ),
            ),
          ),
          

          const SizedBox(height: 15),

          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top: 15, left: paddingContainer, right: paddingContainer, bottom: paddingContainer),
                labelText:  "Deskripsi",
                labelStyle: TextStyle(
                  color: textBlackSmooth,
                  fontSize: 18
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
              ),
              maxLines: null,
              cursorColor: primaryColor,
              controller: deskripsiController,
            )
          ),
        ],
      )
    );
  }

  Widget modeBacaScroll()
  {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(paddingContainer),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text("Judul", style: TextStyle(
                color: textBlackSmooth,
                fontSize: 14
              )),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(judulController.value.text, style: const TextStyle(
                fontSize: 16,
                color: textBlack
              )),
            ),


            const SizedBox(height: 40),

            Text(
              DateFormat('d MMMM yyyy HH:mm').format(widget.note.updatedAt),
              style: const TextStyle(
                fontSize: 12,
                color: textBlack
              ),
            ),


            const SizedBox(height: 25),



            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text("Deskripsi", style: TextStyle(
                color: textBlackSmooth,
                fontSize: 14
              )),
            ),


            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(deskripsiController.value.text, style: const TextStyle(
                fontSize: 16,
                color: textBlack
              )),
            ),

          ],
        ),
      ),
    );
  }
}