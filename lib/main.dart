import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:profile_ui_app/users.dart';
import 'package:profile_ui_app/weather.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'contacts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Profile_ui_app(),
    );
  }
}

class Profile_ui_app extends StatefulWidget {
  const Profile_ui_app({Key? key}) : super(key: key);

  @override
  State< Profile_ui_app> createState() => _Profile_ui_appState();
}

class _Profile_ui_appState extends State<Profile_ui_app> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _DateOfBirth = TextEditingController();
  final TextEditingController _Phone = TextEditingController();

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    //TODO:super.initState();
   // initialGetSavedData();
  }

  void initialGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    Map<String, dynamic> jsondatais =
        jsonDecode(sharedPreferences.getString('userdata') ?? "");
    user users = user.fromJson(jsondatais);
    if (jsondatais.isEmpty) {
      _name.value = TextEditingValue(text: 'null');
      _DateOfBirth.value = TextEditingValue(text: 'null');
      _Phone.value = const TextEditingValue(text: 'null');
    }

    if (jsondatais.isNotEmpty) {
      _name.value = TextEditingValue(text: users.name);
      _DateOfBirth.value = TextEditingValue(text: users.DateOfBirth);
      _Phone.value = TextEditingValue(text: users.Phone);
    }
  }

  void storedata() {
    // ignore: unused_local_variable
    var users = user(_name.text, _DateOfBirth.text, _Phone.text);

    String userdata = jsonEncode(users);
    print(userdata);

    sharedPreferences.setString('userdata', userdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text(
          'Flutter Profile UI',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontFamily: 'DancingScript',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
        elevation: 0.0,
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
                            image: AssetImage('assets/android.png')),
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
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.blueGrey,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(children: [
                TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'NAME:',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.blueGrey,
                      ),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _DateOfBirth,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Date Of Birth:',
                    hintText: 'dd-mm-yy',
                    labelStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.blueGrey,
                    ),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _Phone,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Phone NO.',
                    labelStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.blueGrey,
                    ),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                ),
              ]),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => contacts(),
                    ),
                  );
                },
                color: Colors.white,
                textColor: Colors.blueGrey,
                padding: EdgeInsets.all(10.0),
                child: const Text(
                  'Contacts',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Currentweather(),
                    ),
                  );
                },
                splashColor: Colors.blue,
                color: Colors.white,
                textColor: Colors.blueGrey,
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  'Weather Info',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),

              ),

              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ))),
                  onPressed: () {
                    print(_name.text);
                    print(_DateOfBirth.text);
                    print(_Phone.text);

                    storedata();
                  },
                  child: const Text(
                    'save',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )),
              ElevatedButton(
                  style:  ElevatedButton.styleFrom(
                    primary : Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    )
                  ),
                  onPressed: () {
                    sharedPreferences.remove('userdata');
                    _name.value = const TextEditingValue(text: ' ');
                    _DateOfBirth.value = const TextEditingValue(text: '');
                    _Phone.value = const TextEditingValue(text: '');
                  },
                  child: const Text(
                    'clear',
                    style: TextStyle(
                      fontSize: 24,
                    ),

                  )),
            ])),
      ),
    );
  }
}
