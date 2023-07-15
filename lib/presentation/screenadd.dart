import 'package:blooddonorapp/core/constant.dart';
import 'package:blooddonorapp/function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddScreen extends StatelessWidget {
   AddScreen({super.key});

   TextEditingController namectr = TextEditingController();
   TextEditingController mobilectr = TextEditingController();
   String? selectedbloodgroup;
   final bloodgroup = ['A+','A-','B+','B-','AB+','AB-','O+','O-'];
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Add Donor"),
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
                adddonor(namectr.text, mobilectr.text, selectedbloodgroup!);
                Navigator.of(context).pushNamed('/');
              }, child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}

