import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:uas/adapter/pin_adapter/pin.dart';
import 'package:uas/constant/colors.dart';
import 'package:uas/includes/functions.dart';
import 'package:uas/model/pin_model.dart';
import 'package:uas/pages/home_screen.dart';

class PinScreen extends StatefulWidget 
{
  const PinScreen({ super.key });

  @override
  _PinScreen createState() => _PinScreen();
}

class _PinScreen extends State<PinScreen>
{
  late Box<Pin> pinSaved;
  final _pinController1 = TextEditingController();
  final _pinController2 = TextEditingController();
  final _pinController3 = TextEditingController();
  final _pinController4 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  bool isEnabledPin1 = true;
  bool isEnabledPin2 = false;
  bool isEnabledPin3 = false;
  bool isEnabledPin4 = false;


  @override
  void dispose()
  {
    super.dispose();

    _pinController1.dispose();
    _pinController2.dispose();
    _pinController3.dispose();
    _pinController4.dispose();

    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
  }

  void _onChanged(String value, FocusNode currentNode, FocusNode nextNode) 
  {
    String valPin1 = _pinController1.value.text;
    String valPin2 = _pinController2.value.text;
    String valPin3 = _pinController3.value.text;

    if (valPin1.isNotEmpty && valPin1.length == 1)
    {
      setState(() {
        isEnabledPin1 = false;
        isEnabledPin2 = true;
      });
    }

    if (valPin2.isNotEmpty && valPin2.length == 1)
    {
      setState(() {
        isEnabledPin2 = false;
        isEnabledPin3 = true;
      });
    }

    if (valPin3.isNotEmpty && valPin3.length == 1)
    {
      setState(() {
        isEnabledPin3 = false;
        isEnabledPin4 = true;
      });
    }
  }

  Future<void> _onLastChanged(BuildContext context, value) async 
  {
    if (value.length == 1 &&
      _pinController1.text.isNotEmpty &&
      _pinController2.text.isNotEmpty &&
      _pinController3.text.isNotEmpty &&
      _pinController4.text.isNotEmpty) 
    {
      String valPin1 = _pinController1.value.text;
      String valPin2 = _pinController2.value.text;
      String valPin3 = _pinController3.value.text;
      String valPin4 = value;
      String allConcate = "$valPin1$valPin2$valPin3$valPin4";

      pinSaved = await openPinModel();
      Pin? fetchPin = await getPinModel(pinSaved);

      if (fetchPin?.pin != int.tryParse(allConcate))
      {
        _pinController1.clear();
        _pinController2.clear();
        _pinController3.clear();
        _pinController4.clear();

        setState(() {
          isEnabledPin1 = true;
          isEnabledPin2 = false;
          isEnabledPin3 = false;
          isEnabledPin4 = false;
        });

        snackbarMessage(context, 'PIN yang Anda masukkan salah.');
      }
      else
      {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }

      pinSaved.close();
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
            const Text('ENTER YOUR A PIN', style: TextStyle(
              color:  textBlack,
              fontWeight: FontWeight.bold
            )),
            
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textPinField(_pinController1, _focusNode1, _focusNode2, isEnabledPin1),
                _textPinField(_pinController2, _focusNode2, _focusNode3, isEnabledPin2),
                _textPinField(_pinController3, _focusNode3, _focusNode4, isEnabledPin3),
                _textPinField(_pinController4, _focusNode4, _focusNode4, isEnabledPin4, isLast: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _textPinField(
    TextEditingController controller, 
    FocusNode focusNode, 
    FocusNode nextFocusNode, 
    bool isEnabled,
    {bool isLast = false})
  {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: 55,
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          decoration: InputDecoration(
            counterText: "",
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
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          cursorColor: primaryColor,
          maxLength: 1,
          enabled: isEnabled,
          obscureText: true,
          onChanged: (value) 
          {
            if (isLast) 
            {
              _onLastChanged(context, value);
            } else if (value.length == 1) 
            {
              _onChanged(value, focusNode, nextFocusNode);
            }
          },
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      )
    );
  }
}