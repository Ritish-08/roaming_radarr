import 'package:flutter/material.dart';
import 'package:roaming_radarr/pages/MainPage/ui/main_page.dart';
import 'package:roaming_radarr/widgets/app_large_text.dart';
import 'package:roaming_radarr/widgets/app_text.dart';
import 'package:roaming_radarr/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  String phone = "";
  String email = "";
  String name = "";
  String gender = "";
  String Country = "";
  String state = "";
  String city = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/registerimage.jpeg'),
              opacity: .6,
              fit: BoxFit.fill,
            ),
          ),
        ),
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.fromLTRB(20, 80, 20, 40),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.flight_takeoff_sharp,color: Colors.teal.shade400, size:40,),
                  AppLargeText(
                    text: 'RoamingRadar',
                    color: Colors.blueGrey.shade900,
                    size: 30,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppText(
                    text: 'Register Now to see places to Explore!',
                    size: 18,
                    color: Colors.teal,

                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    // height: 200,
                    // width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width:2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              style: TextStyle(color: Colors.teal.shade900,fontWeight: FontWeight.w600),
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Full Name',
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Colors.white,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                              //check the validation
                              validator: (val) {
                                if (val!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "Please Enter a valid Name";
                                }
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.teal.shade900,fontWeight: FontWeight.w600),
                              decoration: textInputDecoration.copyWith(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                labelText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              //check the validation
                              validator: (val) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val!)
                                    ? null
                                    : 'Please enter a valid Email';
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.teal.shade900,fontWeight: FontWeight.w600),
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Phone',
                                prefixIcon: Icon(
                                  Icons.phone_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  phone = value;
                                });
                              },
                              //check the validation
                              validator: (val) {
                                if (val!.length==10) {
                                  return null;
                                } else {
                                  return "Please Enter a valid Number";
                                }
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.teal.shade900,fontWeight: FontWeight.w600),
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Gender',
                                prefixIcon: Icon(
                                  Icons.person_add_alt,
                                  color: Colors.white,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                              //check the validation
                              validator: (val) {
                                if (val=='Male' || val=='Female'||val=='Transgender' ) {
                                  return null;
                                } else {
                                  return "Please Enter a Gender";
                                }
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            TextFormField(
                              style: TextStyle(color: Colors.teal.shade900,fontWeight: FontWeight.w600),
                              decoration: textInputDecoration.copyWith(
                                labelText: 'State',
                                prefixIcon: Icon(
                                  Icons.radar,
                                  color: Colors.white,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  state = value;
                                });
                              },
                              //check the validation
                              validator: (val) {
                                if (val!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "Please Enter a valid State";
                                }
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            TextFormField(
                              style: TextStyle(color: Colors.teal.shade900,fontWeight: FontWeight.w600),
                              decoration: textInputDecoration.copyWith(
                                labelText: 'City',
                                prefixIcon: Icon(
                                  Icons.location_city,
                                  color: Colors.white,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  state = value;
                                });
                              },
                              //check the validation
                              validator: (val) {
                                if (val!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "Please Enter a valid City";
                                }
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.teal.shade900,fontWeight: FontWeight.w600),
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Country',
                                prefixIcon: Icon(
                                  Icons.location_history,
                                  color: Colors.white,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  state = value;
                                });
                              },
                              //check the validation
                              validator: (val) {
                                if (val!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "Please Enter a valid Country";
                                }
                              },
                            ),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () { Register();},
                      child: Text('Register'),
                    ),
                  ),

                ]),
          ),

      ],
      ),
    );
  }
  Register(){
    if(formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Your account Registered Succesfullly'),
       backgroundColor: Colors.green,
        duration: Duration(milliseconds: 1000),
      ));
      Navigator.push(context,MaterialPageRoute(builder: (context)=>MainPage()));
    }
  }
}
