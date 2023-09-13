import 'package:flutter/material.dart';
import 'package:renpay/TransactionScreens/TransactionDone.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
 final  TextEditingController sendController = TextEditingController();
  void _showDialog(BuildContext context) {
    showDialog(

      context: context,
      builder: (BuildContext context) {
        String userInput = '';
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Enter your amount',style: TextStyle(color: Colors.deepPurple),),
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                TextFormField(
                  controller: sendController,
                  decoration: InputDecoration(
                    prefix: Icon(Icons.currency_rupee_sharp,color: Colors.deepPurple,size: 25,),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple
                      )
                    )
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    userInput = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15,),
                GestureDetector(
                  onTap: (){
                    if(sendController.text.isEmpty){
                      'Enter Your Amount';
                    }
                    else{
                      Navigator.pop(context);

                      Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionDone(amount: sendController.text),));


                    }
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(child: Text('Send',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                  ),
                )
              ],
            ),
          ),

        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(

        children: [
          Center(
            child: RippleAnimation(
    child: CircleAvatar(
    minRadius: 75,
            maxRadius: 75,
            backgroundImage: AssetImage('asset/profile.png'),
    ),
    color: Colors.deepPurple,
    delay: const Duration(milliseconds: 300),
    repeat: true,
    minRadius: 120,
    ripplesCount: 10,
    duration: const Duration(milliseconds: 6 * 300),
    ),
          ),
          Positioned(
            top: 180,
            left: 80,
            child: InkWell(
              onTap: (){
                _showDialog(context);
              },
              child: CircleAvatar(
                radius: 30,

                backgroundImage: AssetImage('asset/senduser.jpg',),
              ),
            ),
          )
        ],
      ),
    );
  }
}
