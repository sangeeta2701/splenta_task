//Assignment Task
// There should be 2 text fields in screen - name and address
// In Address text field "Edit" button should be there , on clicking the button a bottom sheet should open
//Bottom sheet also contain a address textfield in which the value added on the address field of the main screen should be shown.
// In Bottom sheet you can edit the value of address and make sure edited value should show in the address textfield of the main screen 


import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Enter Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  controller: addressController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Enter Address",
                    suffixIcon: TextButton(
                        onPressed: () {
                          _editAddressSheet();
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(color: Colors.blue),
                        )),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _editAddressSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            constraints: BoxConstraints(
              maxHeight: 700,
              minHeight: 250,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Edit Address"),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: addressController,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "Enter Address",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          );
        });
  }
}
