import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:uas/adapter/notes_adapter/notes.dart';
import 'package:uas/constant/styles.dart';
import 'package:uas/constant/colors.dart';
import 'package:uas/includes/functions.dart';
import 'package:uas/model/notes_model.dart';
import 'package:uas/pages/home_screen.dart';

class AddNotes extends StatefulWidget 
{
  const AddNotes({ super.key });

  @override
  _AddNotes createState() => _AddNotes();
}

class _AddNotes extends State<AddNotes>
{
  final judulController = TextEditingController();
  final deskripsiController = TextEditingController();
  late Box<Notes> notesBox;

  @override
  Widget build(BuildContext context)
  {
    DateTime now = DateTime.now();
    String formattedDateTime = DateFormat('d MMMM yyyy HH:mm').format(now);


    Future<void> tambahNote(BuildContext context) async
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
        Notes notesAdd = Notes(
          judul: valJudul, 
          deskripsi: valDeskripsi, 
          createdAt: formattedDateTime, 
          updatedAt: formattedDateTime
        );

        addNotesModel(notesBox, notesAdd);

        snackbarMessage(context, 'Berhasil menambahkan catatan Anda.');
      }

      notesBox.close();
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
          title: const Text('Tambah Catatan', style: TextStyle(
            fontSize: fontSizeAppBar,
            fontWeight: FontWeight.bold,
            color: textBlack
          )),
          elevation: 0,
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
                formattedDateTime,
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
        onPressed: () => tambahNote(context),
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