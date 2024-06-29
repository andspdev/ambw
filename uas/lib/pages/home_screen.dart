import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uas/adapter/notes_adapter/notes.dart';
import 'package:uas/constant/styles.dart';
import 'package:uas/constant/assets.dart';
import 'package:uas/constant/colors.dart';
import 'package:uas/layouts/loader_small_center.dart';
import 'package:uas/model/notes_model.dart';
import 'package:uas/pages/add_notes.dart';
import 'package:uas/pages/edit_notes.dart';
import 'package:uas/pages/pin_setting.dart';

class HomeScreen extends StatefulWidget 
{
  const HomeScreen({ super.key });

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
{
  late Box<Notes> notesBox;
  bool isLoadDataHive = true;

  @override
  void initState() 
  {
    super.initState();
    loadDataNotesHive();
  }

  Future<void> loadDataNotesHive() async
  {
    notesBox = await openNotesModel();

    setState(() {
      isLoadDataHive = false;
    });
    // notesBox.clear();
  }

  void onHandleClickEdit(Notes note)
  {
    Navigator.push(context, 
      MaterialPageRoute(builder: (context) => EditNotes(note: note))
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
            surfaceTintColor: backgroundColor,
            title: const Text('NotesTaking', style: TextStyle(
              fontSize: fontSizeAppBar,
              fontWeight: FontWeight.bold,
              color: textBlack
            ),),
            backgroundColor: backgroundColor,
            elevation: 0,
            actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 9, top: 2),
                  child: IconButton(
                  icon: const Icon(Icons.key_outlined),
                  color: textBlackAppBar,
                  tooltip: "Pengaturan PIN",
                  onPressed: () 
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PinSetting())
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
      
      body: Container(
        child: isLoadDataHive ? 
        Padding(
          padding: const EdgeInsets.all(paddingContainer),
          child: loaderSmallCenter(),
        ) : 
        
        Container(
          padding: const EdgeInsets.only(bottom: paddingContainer),
          child: ValueListenableBuilder(
            valueListenable: notesBox!.listenable(),
            builder: (context, Box box, widget)
            {
              if (box.isEmpty)
              {
                return notesNotFound();
              }
              
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: ((context, index) 
                {
                  Notes? note = box.getAt(index);

                  return 
                  Padding(
                    padding: EdgeInsets.only(
                      top: (index == 0 ? paddingContainer : 0),
                      left: paddingContainer, 
                      right: paddingContainer,
                      bottom: (index + 1 == box.length ? 70 : 0 )
                    ),
                    child: Card(
                      color: backgroundColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: borderCardNotes, 
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      surfaceTintColor: backgroundColor,
                      margin: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Text(
                              note!.judul.isEmpty ? '(Tidak ada judul)' : note.judul,
                              style: TextStyle(
                                fontSize: 18,
                                color: note.judul.isEmpty ? textBlackSmooth : textBlack,
                                fontWeight: note.judul.isEmpty ? FontWeight.normal : FontWeight.bold,
                                fontStyle: note.judul.isEmpty ? FontStyle.italic : FontStyle.normal
                              ),
                            ),
                            
                            const SizedBox(height: 8),
                            
                            Text(
                              note.deskripsi, 
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            
                            const SizedBox(height: 16),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat('d MMMM yyyy HH:mm').format(note.updatedAt),
                                  style: const TextStyle(
                                    color: textBlackSmooth,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12
                                  ),
                                ),

                                IconButton(
                                  icon: const Icon(Icons.arrow_circle_right_outlined),
                                  color: textBlackAppBar,
                                  onPressed: () => onHandleClickEdit(note)
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    )
                  );
                })
              );
            }
          ),
        )
      ),

      floatingActionButton: FloatingActionButton(  
        onPressed: () 
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNotes())
          );
        },
        backgroundColor: primaryColor,
        tooltip: "Tambah Catatan",
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
            'Tidak ada catatan yang ditambahkan.',
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