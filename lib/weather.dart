import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';

class Currentweather extends StatefulWidget {
  const Currentweather({Key? key}) : super(key: key);

  @override
  State<Currentweather> createState() => _CurrentweatherState();
}

class _CurrentweatherState extends State<Currentweather> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windspeed;

  Future getWeather () async {
    print('Arya');
     print('before response');
     http.Response response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Mumbai&units=metric&appid=b72bdb994913819ef68c0505b3f1bb22"));
     print('after response');
     print(response.statusCode);
    //print(response.body);
     var results = jsonDecode(response.body);
     print (results);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently =  results['weather'][0]['main'];
      this.humidity =  results['main']['humidity'];
      this.windspeed = results['wind']['speed'];

    });
  }

  @override
  void initState() {
    getWeather();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Current Weather',
        style: TextStyle(
          fontSize: 40,
          fontFamily: 'DancingScript',
        ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            //width: 30,
            color: Colors.blueGrey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only( bottom: 12.0,),
                      child: Text(
                        'Currently in Mumbai',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 3.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),
                    Text(
                        temp != null? temp.toString()+'\u00B0C':'loading',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                    ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      currently != null? currently.toString(): 'loading',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),)
                  ],
                ),


                ),
              ),
          Expanded(child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: [
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  title: Text('Temperature'),
                  trailing: Text(temp != null? temp.toString()+'\u00B0C':'loading',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  ),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.cloud),
                  title: Text('Weather'),
                  trailing: Text(description != null? description.toString() :'loading',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.sun),
                  title: Text('Humidity'),
                  trailing: Text(humidity != null? humidity.toString():'loading',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.wind),
                  title: Text('wind'),
                  trailing: Text(windspeed!= null?windspeed.toString():'loading',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

          ))

          ]


      ),

    );
  }
}





