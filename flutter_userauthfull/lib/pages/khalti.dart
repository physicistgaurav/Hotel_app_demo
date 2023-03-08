// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, implementation_imports, unnecessary_import, unused_import, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class Khalti extends StatefulWidget {
  const Khalti({super.key});

  @override
  State<Khalti> createState() => _KhaltiState();
}

class _KhaltiState extends State<Khalti> {
  TextEditingController amountController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  // TextEditingController optionController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  String dropdownValue = 'Personal use';

  getAmt() {
    return int.parse(amountController.text) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: "test_public_key_cee04f3f6e3848cf8a86d38032fd39a3",
      enabledDebugging: true,
      builder: (context, navkey) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Khalti Payment"),
            backgroundColor: Colors.indigo,
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  // phone number
                  TextField(
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Khalti Mobile Number",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Amount text
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Amount",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Purpose
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    value: dropdownValue,
                    elevation: 16,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    itemHeight: 100,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      'Personal use',
                      'Borrow/Lend',
                      'Family expenses',
                      'Bill Sharing',
                      'Salary'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Remarks
                  TextField(
                    controller: remarksController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Remaks",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // button
                  MaterialButton(
                    onPressed: () {
                      KhaltiScope.of(context).pay(
                        config: PaymentConfig(
                            amount: getAmt(),
                            productIdentity: "Gaurav",
                            productName: "ghub"),
                        preferences: [
                          PaymentPreference.khalti,
                          PaymentPreference.connectIPS
                        ],
                        onSuccess: (su) {
                          const successsnackBar =
                              SnackBar(content: Text("Payment Successful"));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(successsnackBar);
                        },
                        onFailure: (fa) {
                          const failedsnackBar = SnackBar(
                            content: Text("Payment Failed"),
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(failedsnackBar);
                        },
                        onCancel: () {
                          const cancelsnackBar = SnackBar(
                            content: Text("Payment cancelled"),
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(cancelsnackBar);
                        },
                      );
                    },
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.green)),
                    color: Colors.indigo,
                    child: Text(
                      "Pay",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class KhatiHome extends StatelessWidget {
  const KhatiHome({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: "test_public_key_cee04f3f6e3848cf8a86d38032fd39a3",
        builder: (context, navigatorKey) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [KhaltiLocalizations.delegate],
            home: Khalti(),
          );
        });
  }
}
