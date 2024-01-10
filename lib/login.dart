import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thread_app/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Text('LogIn'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text('Email'),
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
            child: Text('password'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 22),
            child: TextField(
              controller: password,
              decoration: const InputDecoration(
                  labelText: "password",
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (Value) {},
              ),
              Text('Remember me')
            ],
          ),
          /* TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(' LOGIN ')),*/
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.pink[400])),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 300),
            child: Text('forget password?'),
          )
        ],
      ),
    );
  }
}
