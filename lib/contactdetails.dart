import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class contactdetails extends StatefulWidget {

  final String name,phone;
  const contactdetails({Key? key,
  required this.name,required this.phone}) : super(key: key);




  @override
  State<contactdetails> createState() => _contactdetailsState();
}

class _contactdetailsState extends State<contactdetails> {
  //get name => this.name;

  //get phone => this.phone;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        //backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Contact Details',
            style: TextStyle(
              letterSpacing: 2.0,
              fontFamily: 'DancingScript',
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          backgroundColor: Colors.blueGrey[600],
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
            child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(children: [
                  Center(
                      child: Stack(
                          children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/user.png')),
                      ),
                    ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 4, color: Colors.blueGrey),
                                    color: Colors.blueGrey,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                )),
                  ]
                      )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Positioned(
                       child:  Container(
                         decoration: BoxDecoration(

                           border: Border.all(width: 4, color: Colors.blueGrey),
                           borderRadius: BorderRadius.all(Radius.circular(4)),
                         ),
                         height: 40,
                         width: 2000,
                         child: Text('NAME: ${widget.name}',
                         style: TextStyle(
                           color: Colors.blue,

                           fontSize:24,
                         ),
                         ),

                       )



                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                           border: Border.all(width: 4, color: Colors.blueGrey),
                         borderRadius: BorderRadius.all(Radius.circular(4)),
                           ),
    height: 40,
    width: 2000,
    child: Text('PHONE NO.: ${widget.phone}',
    style: TextStyle(
    color: Colors.blue,

    fontSize:24,
    ),
    ),

                        ),
                      ]
                  ),
      ]
                  )
            )
        )
    );



  }
}
