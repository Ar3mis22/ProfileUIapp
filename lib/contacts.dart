import 'dart:typed_data';

import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter/material.dart';
import 'package:profile_ui_app/contactdetails.dart';
import 'package:flutter_contacts/contact.dart';

import 'contacts.dart';






class contacts extends StatefulWidget {
  const contacts({Key? key,}) : super(key: key);





  @override
  State<contacts> createState() => _contactsState(
  );
}

class _contactsState extends State<contacts> {
  List<Contact>? contacts;
  @override

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContacts();
  }

   void getContacts() async{
    if(await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      setState(() {

      });
    }
   }

  @override



  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        centerTitle: true,
        title: const Text('Contact List',
        style: TextStyle(
          fontSize: 40,
          letterSpacing: 2.0,
          fontWeight: FontWeight.w900,
          fontFamily: 'DancingScript',
        ),
        ),
      ),
      body:

          (contacts == null)? Center(child: CircularProgressIndicator(),):ListView.builder(
              itemCount: contacts!.length,
              itemBuilder: (BuildContext context,int index){
                Uint8List? image = contacts![index].photo;


            return ListTile(
              leading: CircleAvatar(child: Icon(Icons.person),),
              title: Text(contacts![index].name.first),

              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=> contactdetails(name: contacts![index].name.first,
                  phone: 'contacts![index].phone.first',)
                  ,)
                  ,);

              },
            );
          }
          )





      );
          }

  }


