import 'package:blooddonorapp/core/constant.dart';
import 'package:blooddonorapp/function.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
   UpdateScreen({super.key});

   TextEditingController namectr = TextEditingController();
   TextEditingController mobilectr = TextEditingController();
   String? selectedbloodgroup;
   final bloodgroup = ['A+','A-','B+','B-','AB+','AB-','O+','O-'];
  

  @override
  Widget build(BuildContext context) {
    final passdata = ModalRoute.of(context)!.settings.arguments as Map;
    namectr.text = passdata['name'];
    mobilectr.text = passdata['mobile'];
    selectedbloodgroup = passdata['group'];

    return  Scaffold(
      appBar: AppBar(
        title: Text("Update Donor"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: namectr,
              textCapitalization: TextCapitalization.words,
              maxLength: 20,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                label: Text('Name')
              ),
            ),
            kheight,
            TextField(
              controller: mobilectr,
              maxLength: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                label: Text('Mobile Number')
              ),
            ),
            kheight,
            DropdownButtonFormField(
              value: selectedbloodgroup,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
              ),
              items:bloodgroup.map((e) => DropdownMenuItem(
                value: e, 
                child: Text(e)
                )).toList(),
              onChanged: (value) {
                selectedbloodgroup =value; 
              }),
              kheight,

              ElevatedButton(onPressed: () {
                updatedonor(passdata['id'], namectr.text, mobilectr.text, selectedbloodgroup!
                );
                Navigator.of(context).pushNamed('/');
              }, child: Text('Update'))
          ],
        ),
      ),
    );
  }
}