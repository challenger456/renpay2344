import 'package:flutter/material.dart';
import 'package:renpay/TransactionScreens/Recieve%20Screen.dart';
import 'package:renpay/TransactionScreens/Send%20Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg',
    'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes-thumbnail.png',
    'https://cdn5.vectorstock.com/i/1000x1000/73/04/female-avatar-profile-icon-round-woman-face-vector-18307304.jpg',
    'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png',
    'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=2000',
    'https://cdn5.vectorstock.com/i/1000x1000/20/74/woman-avatar-profile-vector-21372074.jpg',
    'https://cdn2.vectorstock.com/i/1000x1000/54/41/young-and-elegant-woman-avatar-profile-vector-9685441.jpg',
    'https://cdn5.vectorstock.com/i/1000x1000/73/04/female-avatar-profile-icon-round-woman-face-vector-18307304.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: Alignment.centerLeft,
            width: 150,
            child: Image.asset('asset/renpaylogo.png')),
        actions: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.asset('asset/profile.png'),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "WALLET",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffBCBEFA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'asset/renpaylogo.png',
                            width: 55,
                          )
                        ],
                      ),
                      Text(
                        '₹ 1000',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple,
                            fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                              MaterialPageRoute(
                                  builder: (context) => SendScreen(),)
                          );
                        },
          child: Image.asset(
                          'asset/s2-1.png',
                          height: 40,
                          width: 40,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text(
                        'Send',
                      )
                    ],
                  )),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecieveScreen())
                      );
                    },
                    child: Expanded(
                        child: Column(
                      children: [
                        Transform.rotate(
                            angle: 90 * 3.14159265323 / 180,
                            child: Image.asset(
                              'asset/t (1).png',
                              height: 40,
                              width: 40,
                              color: Colors.deepPurple,
                            )),
                        Text('Recieve')
                      ],
                    )),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Image.asset(
                        'asset/contact.png',
                        height: 40,
                        width: 40,
                        color: Colors.deepPurple,
                      ),
                      Text(
                        'Contact',
                      )
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.deepPurple,
                        size: 40,
                      ),
                      Text(
                        'Add',
                      )
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'PREVIOUS TRANSACTIONS',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3),
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 180,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemCount: images.length,
                    itemBuilder:(context, index) {
                      return CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(images[index],),
                      );

                    },
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
