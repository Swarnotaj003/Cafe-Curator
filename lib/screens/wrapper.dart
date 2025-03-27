import 'package:cafe_curator/model/my_user.dart';
import 'package:cafe_curator/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:cafe_curator/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final myUser = Provider.of<MyUser?>(context);
    return myUser == null ? Authenticate() : Home();
  }
}