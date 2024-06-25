import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uas/constant/colors.dart';
import 'package:uas/pages/home_screen.dart';

class PinScreen extends StatefulWidget 
{
  const PinScreen({ super.key });

  @override
  _PinScreen createState() => _PinScreen();
}

class _PinScreen extends State<PinScreen>
{
  final _pinController1 = TextEditingController();
  final _pinController2 = TextEditingController();
  final _pinController3 = TextEditingController();
  final _pinController4 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  @override
  void dispose()
  {
    super.dispose();

    _pinController1.dispose();
    _pinController2.dispose();
    _pinController3.dispose();
    _pinController4.dispose();
  }

  void _onChanged(String value, FocusNode currentNode, FocusNode nextNode) 
  {
    if (value.length == 1) {
      currentNode.unfocus();
      FocusScope.of(context).requestFocus(nextNode);
    }
  }

  void _onLastChanged(BuildContext context, value) 
  {
    if (value.length == 1 &&
        _pinController1.text.isNotEmpty &&
        _pinController2.text.isNotEmpty &&
        _pinController3.text.isNotEmpty &&
        _pinController4.text.isNotEmpty) 
      {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
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
              color:  textBlack
            )),
            
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textPinField(_pinController1, _focusNode1, _focusNode2),
                _textPinField(_pinController2, _focusNode2, _focusNode3),
                _textPinField(_pinController3, _focusNode3, _focusNode4),
                _textPinField(_pinController4, _focusNode4, _focusNode4, isLast: true),
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