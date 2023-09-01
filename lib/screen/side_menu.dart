//import 'screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_15/screen/config.dart';
import 'package:flutter_application_15/screen/home.dart';
import 'package:flutter_application_15/screen/login.dart';
import 'package:flutter_application_15/screen/users.dart';

// void main() {
//   runApp(const SideMenu());
// }
class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    String accountName = "N/A";
    String accountEmail = "N/A";
    String accountUrl = "https://i.pinimg.com/564x/72/6a/94/726a94feb7f8279b505d82fc15e70809.jpg";
    
    Users user = Configure.login;
    if(user.id != null){
      accountName = user.fullname!;
      accountEmail = user.email!;
    }
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(accountName), 
            accountEmail: Text(accountEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(accountUrl),
              backgroundColor: Colors.white
            ),          
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: (){
              Navigator.pushNamed(context, Home.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Login"),
            onTap: (){
              Navigator.pushNamed(context, login.routeName);
            },
          )
        ],
      ),
    );
  }
}

