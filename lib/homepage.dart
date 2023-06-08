import 'package:flutter/material.dart';
import 'package:temp_conv/results.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String t1 = "Celsius";
String t2 = "Kelvin";
String temperature = "20";

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> temp = ["Farenhite", "Celsius", "Kelvin"];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tempreature Converter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 50, right: 50),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "20",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(122, 255, 255, 255)),
                    labelText: "Enter Temperature",
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide())),
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    temperature = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 170,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: DropdownButtonFormField(
                  items: [
                    for (final temptype in temp)
                      DropdownMenuItem(
                          value: temptype,
                          child: Text(
                            temptype,
                            style: const TextStyle(color: Colors.white),
                          ))
                  ],
                  onChanged: (value) {
                    setState(() {
                      t1 = value!;
                    });
                  },
                  dropdownColor: Colors.black,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide())),
                  hint: const Text(
                    "Convert From",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: double.infinity,
              height: 170,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: DropdownButtonFormField(
                  items: [
                    for (final temptype in temp)
                      DropdownMenuItem(
                          value: temptype,
                          child: Text(
                            temptype,
                            style: const TextStyle(color: Colors.white),
                          ))
                  ],
                  onChanged: (value) {
                    setState(() {
                      t2 = value!;
                    });
                  },
                  dropdownColor: Colors.black,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide())),
                  hint: const Text(
                    "Convert To",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => Results(
                                temperature: temperature,
                                t1: t1,
                                t2: t2,
                              )));
                },
                child: const Text(
                  "Click To Convert",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
