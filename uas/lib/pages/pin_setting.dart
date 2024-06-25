import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uas/constant/alert_color.dart';
import 'package:uas/constant/styles.dart';
import 'package:uas/constant/colors.dart';

class PinSetting extends StatefulWidget 
{
  const PinSetting({ super.key });

  @override
  _PinSetting createState() => _PinSetting();
}

class _PinSetting extends State<PinSetting>
{
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
          title: const Text('Pengaturan PIN', style: TextStyle(
            fontSize: fontSizeAppBar,
            fontWeight: FontWeight.bold,
            color: textBlack
          )),
          elevation: 0,
        ),
      ),
    ),
    
    body: Container(
        padding: const EdgeInsets.all(paddingContainer),
        child: formPengaturanPin()
      ),
      floatingActionButton: FloatingActionButton(  
        onPressed: () 
        {
          Navigator.pop(context);


          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Berhasil menyimpan PIN Anda.'))
          );
        },
        backgroundColor: primaryColor,
        tooltip: "Simpan Perubahan",
        child: const Icon(
          Icons.save_as_outlined, 
          color: whiteColor
        ),
      )
    );
  }



  Widget messageAlertWarning(String message)
  {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: alertWarningColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: alertWarningBorderColor,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: alertWarningTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget formPengaturanPin({bool pengaturanPinBaru = true})
  {
    if (pengaturanPinBaru)
    {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>
          [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [
                messageAlertWarning('Anda belum melakukan pengaturan pada PIN. Silakan buat PIN untuk menjaga keamanan.'),

                const Text('Buat PIN Baru', style: TextStyle(
                  color: textBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                )),

                const SizedBox(height: 16),

                TextFormField(
                  decoration: InputDecoration(
                    counterText: "",
                    labelText: 'Masukkan PIN Baru',
                    labelStyle: const TextStyle(
                      color: textBlackSmooth,
                      fontSize: 14
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: primaryColor, width: 1)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Color.fromRGBO(204, 204, 204, 1))
                    ),
                  ),
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  obscureText: true,
                ),

                const SizedBox(height: 15,),

                TextFormField(
                  decoration: InputDecoration(
                    counterText: "",
                    labelText: 'Konfirmasi PIN Baru',
                    labelStyle: const TextStyle(
                      color: textBlackSmooth,
                      fontSize: 14
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: primaryColor, width: 1)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Color.fromRGBO(204, 204, 204, 1))
                    ),
                  ),
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  obscureText: true,
                )
              ],
            )
          ]
      );
    }

    return Container(
      child: null,
    );
  }
}