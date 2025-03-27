import 'package:cafe_curator/model/my_user.dart';
import 'package:cafe_curator/services/database.dart';
import 'package:cafe_curator/shared/border_design.dart';
import 'package:cafe_curator/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // Form values
  String? _currName;
  String? _currSugars;
  int? _currStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return StreamBuilder<Object>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic userData = snapshot.data;

          return Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Update your brew settings...',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                SizedBox(height: 30),

                TextFormField(
                  initialValue: userData.name,
                  decoration: borderDesign.copyWith(
                    hintText: 'Edit your name...',
                  ),
                  validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
                  onChanged: (value) => setState(() => _currName = value),
                ),
                SizedBox(height: 30),

                DropdownButtonFormField(
                  decoration: borderDesign,
                  value: _currSugars ?? userData.sugars,
                  items: sugars.map((sugar) {
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text('$sugar sugars'),
                      );
                    }).toList(),
                  onChanged: (value) {
                    setState(() => _currSugars = value! as String?);
                  },
                ),
                SizedBox(height: 30),

                // Slider
                Slider(
                  label: 'Strength',
                  value: (_currStrength ?? userData.strength).toDouble(),
                  onChanged: (value) => setState(() => _currStrength = value.round()),
                  min: 100,
                  max: 900,
                  divisions: 8,
                  activeColor: Colors.brown[_currStrength ?? userData.strength],
                  inactiveColor: Colors.brown[_currStrength ?? userData.strength],
                ),
                SizedBox(height: 50),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currName ?? userData.name, 
                        _currSugars ?? userData.sugars, 
                        _currStrength ?? userData.strength
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.brown),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Update', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        else {
          return Loading();
        }
      }
    );
  }
}