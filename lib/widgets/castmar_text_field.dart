import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({this.hintText, this.onChanged});
  Function(String)? onChanged;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            //data != 'fliops'هنا انا ممكن اخلي شخص واحد بس يدخل من خلال
            return 'value is Empty';
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xFFE3F1FC),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              // الحدود
              color: Color(0xFF2bbdc5),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
