import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:uas/adapter/pin_adapter/pin.dart';
import 'package:uas/constant/alert_color.dart';
import 'package:uas/constant/styles.dart';
import 'package:uas/constant/colors.dart';
import 'package:uas/includes/functions.dart';
import 'package:uas/layouts/loader_small_center.dart';
import 'package:uas/model/pin_model.dart';

class PinSetting extends StatefulWidget 
{
  const PinSetting({ super.key });

  @override
  _PinSetting createState() => _PinSetting();
}

class _PinSetting extends State<PinSetting>
{
  late Box<Pin> pinSaved;
  final pinBaruController = TextEditingController();
  final konfirmasiPinBaruController = TextEditingController();
  final pinLamaController = TextEditingController();

  bool isLoadinghive = true;
  bool isShowFormPinBaru = true;


  @override
  void dispose()
  {
    super.dispose();

    pinBaruController.dispose();
    konfirmasiPinBaruController.dispose();
    pinLamaController.dispose();
  }

  @override
  void initState()
  {
    super.initState();
    setStateFormPin();
  }

  Future<void> setStateFormPin() async
  {
    pinSaved = await openPinModel();
    Pin? checkPinSaved = await getPinModel(pinSaved);

    setState(() {
      isShowFormPinBaru = (checkPinSaved == null);
      isLoadinghive = false;
    });

    pinSaved.close();
  }

  Future<void> saveSubmitPin(BuildContext context) async
  {
    pinSaved = await openPinModel();
    Pin? checkPinSaved = await getPinModel(pinSaved);

    String valuePinLama = pinLamaController.value.text;
    String valuePinBaru = pinBaruController.value.text;
    String valueKonfirmasiPinBaru = konfirmasiPinBaruController.value.text;

    if (checkPinSaved != null && valuePinLama != checkPinSaved.pin.toString())
    {
      snackbarMessage(context, 'PIN lama yang diketik salah.');
    }
    else if (valuePinBaru.isEmpty)
    {
      snackbarMessage(context, 'Silakan ketik PIN baru.');
    }
    else if (!RegExp(r'^\d{4}$').hasMatch(valuePinBaru))
    {
      snackbarMessage(context, 'Isi PIN baru dengan angka.');
    }
    else if (valueKonfirmasiPinBaru != valuePinBaru)
    {
      snackbarMessage(context, 'Konfirmasi PIN baru tidak sama.');
    }
    else
    {
      int? valuePinBaruInt = int.tryParse(valuePinBaru);
      Pin pinModelSaved = Pin( pin: valuePinBaruInt );

      savePinModel(pinSaved, pinModelSaved);
      setState(() { isShowFormPinBaru = false; });

      snackbarMessage(context, 
        checkPinSaved == null ? 
          'Berhasil menyimpan PIN baru Anda.' : 'Berhasil menyimpan PIN Anda.'
      );

      pinLamaController.clear();
      pinBaruController.clear();
      konfirmasiPinBaruController.clear();
    }

    pinSaved.close();
  }


  Future<void> hapusPinHiveDialog(BuildContext context) async
  {
    showDialog(
      context: context,
      builder: (BuildContext context) 
      {
        return AlertDialog(
          title: const Text('Hapus PIN Anda'),
          backgroundColor: backgroundColor,
          surfaceTintColor: backgroundColor,
          content: const Text('Apakah Anda ingin menghapus PIN Anda?'),
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
                pinSaved = await openPinModel();
                deletePinModel(pinSaved);
                pinSaved.close();

                setState(() { isShowFormPinBaru = true; });
                Navigator.of(context).pop();
                snackbarMessage(context, 'Berhasil menghapus PIN Anda.');
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
          actions: !isShowFormPinBaru ? [
            Padding(
              padding: const EdgeInsets.only(right: 9, top: 2),
              child: IconButton(
                onPressed: () => hapusPinHiveDialog(context), 
                icon: const Icon(Icons.delete_outline, color: textBlackAppBar),
                tooltip: "Hapus PIN",
              ),
            )
          ] : null,
        ),
      ),
    ),
    
    body: Container(
        padding: const EdgeInsets.all(paddingContainer),
        child: isLoadinghive ? loaderSmallCenter() : formPengaturanPin(pengaturanPinBaru: isShowFormPinBaru),

      ),
      floatingActionButton: FloatingActionButton(  
        onPressed: () => saveSubmitPin(context),
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

  Widget formPengaturanPin({bool pengaturanPinBaru = false})
  {
    if (pengaturanPinBaru)
    {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>
        [
          messageAlertWarning('Anda belum melakukan pengaturan pada PIN. Silakan buat PIN untuk menjaga keamanan.'),
          
          const SizedBox(height: 15),

          const Text('Buat PIN Baru', style: TextStyle(
            color: textBlack,
            fontSize: 14,
            fontWeight: FontWeight.bold
          )),

          const SizedBox(height: 15),

          _textFormField(pinBaruController, "Masukkan PIN Baru"),

          const SizedBox(height: 15,),

          _textFormField(konfirmasiPinBaruController, "Konfirmasi PIN Baru"),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>
      [
        const Text('Ubah PIN Anda', style: TextStyle(
          color: textBlack,
          fontSize: 14,
          fontWeight: FontWeight.bold
        )),

        const SizedBox(height: 15),

        _textFormField(pinLamaController, "Masukkan PIN Lama"),

        const SizedBox(height: 15,),

        _textFormField(pinBaruController, "Masukkan PIN Baru"),

        const SizedBox(height: 15,),

        _textFormField(konfirmasiPinBaruController, "Konfirmasi PIN Baru"),

      ],
    );
  }


  TextFormField _textFormField(TextEditingController controller, String labelText)
  {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        counterText: "",
        labelText: labelText,
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
      cursorColor: primaryColor,
    );
  }
}