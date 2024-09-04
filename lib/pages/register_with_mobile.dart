import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_app_1/pages/home.dart';
import 'package:flutter_demo_app_1/pages/tab_bars_drawers_feature.dart';

class RegisterWithMobileScreen extends StatelessWidget {
  const RegisterWithMobileScreen({super.key});
  final bool _selectedValue = true; // The initial selected value
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 102, 0),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome to",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    // SizedBox(height: 2),
                    Text("InstaBIZ!",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Register with mobile",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 20),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.sim_card,
                                size: 25,
                              ),
                              Expanded(
                                  child: RadioListTile<bool>(
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                activeColor: Colors.blue,
                                value: true,
                                groupValue: _selectedValue,
                                onChanged: (bool? value) {},
                                title: const Text("xxxxxx4236"),
                                subtitle: const Text(
                                  "SIM 1 - Vodafone",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ))
                            ],
                          )),
                      const SizedBox(height: 20),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.sim_card,
                                size: 25,
                              ),
                              Expanded(
                                  child: RadioListTile<bool>(
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                activeColor:
                                    const Color.fromARGB(255, 37, 33, 243),
                                value: false,
                                groupValue: _selectedValue,
                                onChanged: (bool? value) {},
                                title: const Text("xxxxxx4236"),
                                subtitle: const Text(
                                  "SIM 2 - Jio",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ))
                            ],
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              backgroundColor:
                                  const Color.fromARGB(253, 141, 10, 56),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // Customize the border radius here
                              ),
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const Home()),
                              // );
                              // print('hello');
                            },
                            child: const Text("Proceed",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                            "**App will send SMS to verify. Standard SMS charges apply.",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 11)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
