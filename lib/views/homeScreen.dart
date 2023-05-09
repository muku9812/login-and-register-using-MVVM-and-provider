import 'package:flutter/material.dart';
import 'package:mvvm/utilities/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: InkWell(
            onTap: () {
              userPreference.remove().then((value) {
                Navigator.pushReplacementNamed(context, RoutesName.login);
              });
            },
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 30),
            )),
      ),
    );
  }
}
