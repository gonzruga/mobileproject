import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discretionary Income Budget',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Discretionary Income Budget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //late double petty;
  double salary = 0.0,
      accumulatedSalary = 0.0,
      balance = 0.0,
      months = 0.0,
      pettyExpenses = 0.0,
      totalExpenses = 0.0;
  double jan = 0.0, feb = 0.0, mar = 0.0, apr = 0.0, may = 0.0, jun = 0.0;
  double jul = 0.0, aug = 0.0, sep = 0.0, oct = 0.0, nov = 0.0, dec = 0.0;
  String janCat = "";

  final List<String> categories = ["Rent", "Valentines", "Repairs","Investing","Furniture",
    "Holiday","Miscellaneous","Car Loan","Shopping","Savings","Mortgage","Xmass/NY"];

  final TextStyle totalStyle = const TextStyle(
    color: Colors.red,
    fontSize: 20.0,
    fontWeight: FontWeight.w300,
  );

  TextEditingController janController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Table(border: TableBorder.all(), children: [
                TableRow(children: [
                  const Text("START: Insert Monthly Salary"),
                  const Text("Monthly Salary"),
                  TextField(
                    //keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Insert Salary",
                      ),
                      onChanged: (value) {
                        setState(() {
                          salary = double.parse(value);
                        });
                      }),
                ]),
                //2
                TableRow(children: [
                  MaterialButton(
                    onPressed: update,
                    color: Colors.amber,
                    child: const Text('1. NEW MONTH',
                        style: TextStyle(color: Colors.black)),
                  ),
                  const Text("Accumulated Salary"),
                  Text(accumulatedSalary.toString()),
                ]),
                //3
                TableRow(children: [
                  Text("Month Counter: $months"),
                  const Text("Balance"),
                  Text(balance.toString()),
                ]),
                //4
                TableRow(children: [
                  MaterialButton(
                    onPressed: addPettyExpenses,
                    color: Colors.amber,
                    child: const Text('2. ADD Petty Expenses',
                        style: TextStyle(color: Colors.black)),
                  ),
                  const Text("Petty Expenses"),
                  Text(pettyExpenses.toString()),
                ]),

                TableRow(children: [
                  const Text("1. Jan"),
                  // DropdownButton(
                  //   items: categories
                  //       .map((String value) => DropdownMenuItem<String>(
                  //     child: Text(value),
                  //     value: value,
                  //   ))
                  //       .toList(),
                  //   onChanged: (value) {
                  //     setState(() {
                  //       janCat = value.toString();
                  //     });
                  //   },
                  //   value: janCat,
                  // ),
                  const Text("1. Rent"),
                  TextField(
                    controller: janController,
                    decoration: const InputDecoration(
                      labelText: "Step 3: Insert Amounts",
                    ),
                    onChanged: (value) {
                      // jan = double.parse(value);
                      updateTotal();
                      // setState(() {
                      // });
                    },
                  ),
                ]),

                TableRow(children: [
                  const Text("2. Feb"),
                  const Text("Valentines"),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        feb = double.parse(value);
                        updateTotal();
                      });
                    },
                  ),
                ]),

                TableRow(children: [
                  const Text("3. Mar"),
                  const Text("Repairs"),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        mar = double.parse(value);
                        updateTotal();
                      });
                    },
                  ),
                ]),
                TableRow(children: [
                  const Text("4. Apr"),
                  const Text("Investing"),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        apr = double.parse(value);
                        updateTotal();
                      });
                    },
                  ),
                ]),
                TableRow(children: [
                  const Text("5. May"),
                  const Text("Furniture"),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        may = double.parse(value);
                        updateTotal();
                      });
                    },
                  ),
                ]),
                TableRow(children: [
                  const Text("6. Jun"),
                  const Text("Midsummer"),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        jun = double.parse(value);
                        updateTotal();
                      });
                    },
                  ),
                ]),
                TableRow(children: [
                  const Text("7. Jul"),
                  const Text("Miscellaneous"),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        jul = double.parse(value);
                        updateTotal();
                      });
                    },
                  ),
                ]),
                TableRow(children: [
                  const Text("8. Aug"),
                  const Text("Car Loan"),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        aug = double.parse(value);
                        updateTotal();
                      });
                    },
                  ),
                ]),
                TableRow(children: [
                  const Text("9. Sep"),
                  const Text("Shopping"),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        sep = double.parse(value);
                        updateTotal();
                      });
                    },
                  ),
                ]),
                TableRow(children: [
                  const Text("10. Oct"),
                  const Text("Savings"),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        oct = double.parse(value);
                        updateTotal();
                      });
                    },
                  ),
                ]),
                TableRow(children: [
                  const Text("11. Nov"),
                  const Text("Mortgage"),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        nov = double.parse(value);
                        updateTotal();
                      });
                    },
                  ),
                ]),
                TableRow(children: [
                  const Text("12. Dec"),
                  const Text("Xmass/NY"),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        dec = double.parse(value);
                        updateTotal();
                      });
                    },
                  ),
                ]),
                TableRow(children: [
                  MaterialButton(
                    onPressed: clear,
                    color: Colors.purpleAccent,
                    child: const Text('CLEAR AMOUNTS',
                        style: TextStyle(color: Colors.black)),
                  ),
                  const Text("TOTAL EXPENSES"),
                  Text(totalExpenses.toString()),
                ]),
              ]),
            ),
          ],
        ),
      ),
    );
  }

//METHODS

  void update() {
    setState(() {
      accumulatedSalary = accumulatedSalary + salary;
      balance = accumulatedSalary - totalExpenses;
      months = months + 1;
    });
  }

  void addPettyExpenses() {
    setState(() {
      pettyExpenses = pettyExpenses + (salary / 2);
      updateTotal();
    });
  }

  void updateTotal() {
    setState(() {
      totalExpenses = pettyExpenses +
          double.parse(janController.text) +
          feb +
          mar +
          apr +
          may +
          jun +
          jul +
          aug +
          sep +
          oct +
          nov +
          dec;
      balance = accumulatedSalary - totalExpenses;
    });
  }

  void clear() {
    setState(() {
      salary = 0.0;
      accumulatedSalary = 0.0;
      balance = 0.0;
      months = 0;
      pettyExpenses = 0.0;
      totalExpenses = 0.0;
      janController.text = "";
      feb = 0.0;
      mar = 0.0;
      apr = 0.0;
      may = 0.0;
      jun = 0.0;
      jul = 0.0;
      aug = 0.0;
      sep = 0.0;
      oct = 0.0;
      nov = 0.0;
      dec = 0.0;

    });
  }
}
