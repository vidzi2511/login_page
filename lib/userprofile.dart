import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String name;
  var userprofile = null;
  void initState() {
    getusername();
  }

  Widget_getImage() {
    if (userprofile == null) {
      return Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(75.0)),
          boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)],
        ),
        child: CircularProgressIndicator(),
      );
    } else {
      return Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            image: NetworkImage(
              '$userprofile',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(75.0)),
          boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)],
        ),
      );
    }
  }

  Future<String> getusername() async {
    var url = await http.get("https://api.github.com/users/vishweshsoni");
    var responseJson = json.decode(url.body);
    var name1 = responseJson['login'];
    var image = responseJson['avatar_url'];
    setState(() {
      name = name1;
      userprofile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(color: Colors.blue.withOpacity(0.8)),
            clipper: getClipper(),
          ),
          SafeArea(
              child: IconButton(
            icon: Icon(Icons.edit, size: 30.0),
            onPressed: () => {},
            padding: EdgeInsets.only(left: 309.0, right: 5.0, top: 9.0),
          )),
          Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 8,
            child: Column(
              children: <Widget>[
                Widget_getImage(),
                SizedBox(height: 5.0),
                Text(
                  '$name',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Container(
                  margin: EdgeInsets.only(left: 20.0,right:20.0),
                  alignment: FractionalOffset.center,
                  child: Column(
                    children: <Widget>[
                            Container(
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.blue))
                                ),
                                child:Row(
                                    children: <Widget>[
                                        Icon(Icons.verified_user),
                                        Container(
                                          width: 100.0,
                                          height: 20.0,
                                          child: Text('Student Id',textAlign: TextAlign.center,),
                                        ),
                                        SizedBox(width: 2.0),
                                        Text('201812101'),


                                    ],
                                ),
                            ),
                            SizedBox(height: 20.0,),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.blue))
                              ),
                              child:Row(
                                children: <Widget>[

                                  Icon(Icons.email),
                                  Container(
                                    width: 100.0,
                                    height: 20.0,

                                    child: Text('Email',textAlign: TextAlign.center,),
                                  ),
                                  SizedBox(width: 2.0,),
                                  SizedBox(width: 2.0),
                                  Text('201812101@daiict.ac.in'),

                                ],
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.blue))
                              ),
                              child:Row(
                                children: <Widget>[
                                  Icon(Icons.favorite),
                                  Container(
                                    width: 100.0,
                                    height: 20.0,
                                    child: Text('Intrests',textAlign: TextAlign.center,),
                                  ),
                                  SizedBox(width: 2.0,),
                                  SizedBox(width: 2.0),
                                  Text('Nodejs,php,mysql,java'),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.blue))
                              ),
                              child:Row(
                                children: <Widget>[
                                  Icon(Icons.assessment),
                                  Container(
                                    width: 100.0,
                                      height: 20.0,
                                    child: Text('No of project',textAlign: TextAlign.center,),
                                  ),
                                  SizedBox(width: 2.0,),
                                  SizedBox(width: 2.0),
                                  Text('20'),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.blue))
                              ),
                              child:Row(
                                children: <Widget>[
                                  Icon(Icons.local_activity),
                                  Container(
                                    width: 100.0,
                                    height: 20.0,
                                    child: Text('Resume',textAlign: TextAlign.center,),
                                  ),
                                  SizedBox(width: 2.0,),
                                  SizedBox(width: 2.0),
                                  Material(
                                      color: Colors.white70,
                                      child: MaterialButton(
                                          onPressed: null,
                                        minWidth: 25.0,
                                        color: Colors.white70,
                                      ),
                                  ),

                                ],
                              ),
                            )
                    ],
                  ),
                ),
//                            Container(
//                            height: 30.0,
//                            width: 95.0,
//                            child: Material(
//                                borderRadius: BorderRadius.circular(20.0),
//                                shadowColor: Colors.redAccent,
//                                color: Colors.red,
//                                elevation: 7.0,
//                                child: GestureDetector(
//                                    onTap: ()=>{},
//                                    child: Center(
//                                        child: Text('Logout', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),),
//
//                                    ),
//                                ),
//                            ),
//                        ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 2.5);
    path.lineTo(size.width + 100, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}