import 'package:cafe_curator/model/brew.dart';
import 'package:cafe_curator/screens/home/brew_list.dart';
import 'package:cafe_curator/screens/home/settings_form.dart';
import 'package:cafe_curator/services/auth.dart';
import 'package:cafe_curator/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: SettingsForm(),
          );
        },
      );
    }

    return StreamProvider<List<Brew>>.value(
      initialData: [],
      value: DatabaseService(uid: '').brews,
      child: Scaffold(
        backgroundColor: Colors.brown[100],

        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/coffee_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    color: Colors.brown[900],
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () async {
                              _auth.signOut();
                            },
                            icon: Icon(Icons.logout, color: Colors.white),
                          ),
                        ),
                        Text(
                          'Welcome to',
                          style: TextStyle(
                            color: Colors.brown[200],
                            fontSize: 28,
                          ),
                        ),
                        Text(
                          'Cafe Curator!',
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80,),
                  Expanded(child: BrewList()),
                  ElevatedButton.icon(
                    onPressed: () => showSettingsPanel(), 
                    label: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        'Update preferences',
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 24,
                        ),
                      ),
                    ),
                    icon: Icon(
                      Icons.settings,
                      color: Colors.grey[200],
                      size: 40,
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.brown[900]),
                      shadowColor: WidgetStateProperty.all(Colors.grey),
                      elevation: WidgetStateProperty.all(3),
                    ),
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
            Positioned(
              top: 200,
              height: 180,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.brown[200],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('images/coffee_banner.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 160,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      child: Text(
                        'Share your preferences, and let the curator brew the coffee for you!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
