import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:uas/adapter/notes_adapter/notes.dart';
import 'package:uas/constant/styles.dart';
import 'package:uas/constant/colors.dart';
import 'package:uas/includes/functions.dart';
import 'package:uas/model/notes_model.dart';
import 'package:uas/pages/home_screen.dart';

class EditNotes extends StatefulWidget 
{
  final Notes note;
  const EditNotes({ required this.note });

  @override
  _EditNotes createState() => _EditNotes();
}

class _EditNotes extends State<EditNotes>
{
  late Box<Notes> notesBox;
  late TextEditingController judulController;
  late TextEditingController deskripsiController;

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
                snackbarMessage(context, 'Berhasil menghapus catatan Anda');
              },
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context)
  {
    DateTime now = DateTime.now();


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
          judul: valJudul, 
          deskripsi: valDeskripsi, 
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
          title: const Text('Ubah Catatan', style: TextStyle(
            fontSize: fontSizeAppBar,
            fontWeight: FontWeight.bold,
            color: textBlack
          )),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 9, top: 2),
              child: IconButton(
                onPressed: () => {}, 
                icon: const Icon(Icons.visibility_outlined, color: textBlackAppBar),
                tooltip: "Mode Baca",
              ),
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
    
    body: Container(
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
                DateFormat('d MMMM yyyy HH:mm').format(now),
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
      ),


      floatingActionButton: FloatingActionButton(  
        onPressed: () => simpanNote(context),
        backgroundColor: primaryColor,
        tooltip: "Simpan Catatan",
        child: const Icon(
          Icons.save_as_outlined, 
          color: whiteColor
        ),
      )
    );
  }
}