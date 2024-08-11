import 'package:flutter/material.dart';


class PaymentScss{
  dialogue(context){
    return showModalBottomSheet(context: context, builder: (context){
      return const PymtSuccessDialogue();
    });
  }
}

class PymtSuccessDialogue extends StatelessWidget {
  const PymtSuccessDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [

        ],
      ),
    );
  }
}
