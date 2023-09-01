

import 'package:flutter/material.dart';
import 'package:flutter_application_15/screen/users.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)!.settings.arguments as Users;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Info"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Card(
          child: ListView(
            children: [
              ListTile(title: Text("Full Name"),subtitle: Text("${user.fullname}"),),
              ListTile(title: Text("Email"),subtitle: Text("${user.email}"),),
              ListTile(title: Text("Gander"),subtitle: Text("${user.gender}"),),
            ],
          ),
        )
      ),
    );
  }
}