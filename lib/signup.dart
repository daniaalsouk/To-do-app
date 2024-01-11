import 'package:flutter/material.dart';
import 'package:thread_app/home.dart';
import 'package:thread_app/login.dart';

class SingnPage extends StatelessWidget {
  const SingnPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image(
              image: AssetImage('images/photo_٢٠٢٤-٠١-١١_١٢-٢٣-١١.jpg'),
              height: 130,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              'SIGN UP',
              style: TextStyle(fontFamily: 'Salsa', fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Email',
              style: TextStyle(fontFamily: 'Salsa', fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 22),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(
                  labelText: "Email",
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'password',
              style: TextStyle(fontFamily: 'Salsa', fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 22),
            child: TextField(
              controller: password,
              decoration: const InputDecoration(
                  labelText: "password",
                  suffixIcon: Icon(Icons.key),
                  border: OutlineInputBorder()),
            ),
          ),

          /* TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(' LOGIN ')),*/
          Padding(
            padding:
                const EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 0),
            child: SizedBox(
              height: 40,
              width: 500,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.pink[400])),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Salsa', fontSize: 20),
                  )),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('OR'),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 170, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.email),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.facebook),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.camera)
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 130,
              ),
              Text(
                'Already a user?',
                style: TextStyle(fontSize: 15),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'LOG_IN',
                    style: TextStyle(fontFamily: 'Salsa', fontSize: 20),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
