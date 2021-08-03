import 'dart:ui';
import 'package:flutter/material.dart';
import 'widgets/transetion_list.dart';
import '/widgets/user_input.dart';
import 'transection.dart';
import 'widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personals Expense',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.light,
        accentColor: Colors.blue[800],
        fontFamily: 'Quicksand', //thinner
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: "Quciksand",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Quciksand',
              fontWeight: FontWeight.bold,
            )),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: "Quciksand",
                  fontSize: 20,
                ),
              ),
        ),
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<Transactions> trans = [];
  List<Transactions> get last7dayTransactions {
    return trans.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void addnewdata(String title, double amount, DateTime date) {
    print("title" + title);
    // will add newdata to the list
    var newdata = Transactions(DateTime.now().toString(), title, amount, date);

    setState(() {
      trans.add(newdata);
    });
  }

  void deletedata(String id) {
    setState(() {
      trans.removeWhere((element) => element.id == id);
    });
  }

  void _starttakingInput(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        print("BUILDER");
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child:
              Userinput(addnewdata), //UserInput belongs to user_input.dart file
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          )
        ],
        title: Text("Personals Expense"),
      ),
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 100,
              child: Chart(last7dayTransactions),
            ),
          ),
          // GETTING USER INPUT
          Newtransection(trans, deletedata),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _starttakingInput(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
