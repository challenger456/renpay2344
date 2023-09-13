import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class TransactionDone extends StatefulWidget {
  String amount;
   TransactionDone({super.key,required this.amount});

  @override
  State<TransactionDone> createState() => _TransactionDoneState();
}

class _TransactionDoneState extends State<TransactionDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(

        color: Colors.white,
        child:  Column(
          children: [
            Center(child: Lottie.asset('asset/done.json',repeat: false)),
            Text('Transaction Done '+ widget.amount ,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,color: Colors.blue),)
          ],
        ),
      ),
    );
  }
}
