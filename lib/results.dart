import "package:flutter/material.dart";
import "package:temp_conv/homepage.dart";

class Results extends StatefulWidget {
  const Results(
      {super.key,
      required this.temperature,
      required this.t1,
      required this.t2});
  final String temperature;
  final String t1;
  final String t2;
  @override
  State<Results> createState() => _ResultsState();
}

String val = "Your Result";

class _ResultsState extends State<Results> {
  double coverter(String temp, String t1, String t2) {
    if (t1 == "Farenhite") {
      if (t2 == "Farenhite") {
        return double.parse(temp);
      } else if (t2 == "Celsius") {
        return (double.parse(temp) - 32) * 5 / 9;
      } else if (t2 == "Kelvin") {
        return (double.parse(temp) - 32) * 5 / 9 + 273.15;
      }
    } else if (t1 == "Celsius") {
      if (t2 == "Farenhite") {
        return double.parse(temp) * (9 / 5) + 32;
      } else if (t2 == "Celsius") {
        return double.parse(temp);
      } else if (t2 == "Kelvin") {
        return double.parse(temp) + 273.15;
      }
    } else if (t1 == "Kelvin") {
      if (t2 == "Farenhite") {
        return (double.parse(temp) - 273.15) * 9 / 5 + 32;
      } else if (t2 == "Celsius") {
        return (double.parse(temp) - 273.15);
      } else if (t2 == "Kelvin") {
        return double.parse(temp);
      }
    } else {
      return 0;
    }
    return 0;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      val =
          coverter(widget.temperature, widget.t1, widget.t2).toStringAsFixed(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Results',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Text(
                val.toString(),
                maxLines: 1,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 33),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (builder) => const HomePage()));
                },
                child: const Text(
                  "Return To Converter",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
