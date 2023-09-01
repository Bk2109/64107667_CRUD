
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_15/screen/config.dart';
import 'package:flutter_application_15/screen/home.dart';
import 'package:flutter_application_15/screen/side_menu.dart';
import 'package:flutter_application_15/screen/users.dart';
import 'package:http/http.dart' as http;


class login extends StatefulWidget {
  static const routeName = "/login";
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey = GlobalKey<FormState>();
  Users user = Users();
  Future<void> login(Users user) async{
    var params = {"email" : "bilkis.to@mail.wu.ac.th", "password": "1234"};
    var url = Uri.http(Configure.server, "user",params);
    var resp = await http.get(url);
    print(resp.body);

    List<Users> login_result = usersFromJson(resp.body);
    print(login_result.length);
    if(login_result.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("username or password invalid")));
    }else{
      Configure.login = login_result[0];
      Navigator.pushNamed(context, Home.routeName);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                emailInputField(),
                passwordInputField(),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    submitButton(),
                    SizedBox(width: 10.0),
                    backButton(),
                    SizedBox(width: 10.0,)
                  ],
                )
              ],
            ),
          )),
        drawer: SideMenu(),
    );
  }

  Widget emailInputField() {
    return TextFormField(
      initialValue: "bilkis.to@mail.wu.ac.th",
      decoration: InputDecoration(
          labelText: "Email",
          //hintText: "input your email",
          icon: Icon(Icons.email)),
      validator:(value){
            if(value!.isEmpty){
              return "This field is required";
            }
            if(!EmailValidator.validate(value)){
              return "it is not email format";
            }
            return null;
          },
      onSaved: (newValue) => user.email = newValue!,
    );
  }

  Widget passwordInputField() {
    return TextFormField(
      initialValue: "1234",
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Password",
          //hintText: "input your password",
          icon: Icon(Icons.lock)),
      validator:(value){
            if(value!.isEmpty){
              return "This field is required";
            }
            // if(!EmailValidator.validate(value)){
            //   return "it is not email format";
            // }
            return null;
          },
      onSaved: (newValue) => user.password = newValue!,
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
          if(_formkey.currentState!.validate()){
            _formkey.currentState!.save();
            print(user.toJson().toString());
            login(user);
        }
      },
      child: Text("Login"),
    );
  }

  Widget backButton(){
    return ElevatedButton(
      onPressed: (){

      },
      child: Text("Back")
      );
  }

  Widget registerLik(){
    return InkWell(
      child: const Text("Sign up"),
      onTap: (){},
    );
  }
}

  