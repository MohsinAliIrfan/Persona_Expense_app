import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/transection.dart';
import 'package:personal_expense_app/widgets/char_bar.dart';
import 'char_bar.dart';

class Chart extends StatelessWidget {
  List<Transactions> recenttrans = [];

  Chart(this.recenttrans);

  List<Map<String, Object>> get recentTranactions {
    return List.generate(
      // it will generate a new list of length 7
      7, //length
      (index) {
        // this function will work 7 times automatically cause we provide 7(value)
        // The next line of code will get current day and subtract the 1st value from it i.e. index = 0 -
        //then index will have auto +1 and same process will repeat.
        var weekday = DateTime.now().subtract(Duration(days: index));
        double totalamount = 0.0;

        // old syntax
        // for(var i = 0; i<recenttrans.length; i++){
        //   if(recenttrans[i].date.day == weekday.day)
        // }

        //new syntax
        for (var i in recenttrans) {
          if (i.date.day == weekday.day &&
              i.date.month == weekday.month &&
              i.date.year == weekday.year) {
            totalamount += i.amount;
          }
        }

        print(DateFormat.E().format(weekday));
        print(totalamount.toString());

        return {
          "day": DateFormat.E().format(weekday),
          "amount": totalamount /*totoaamount*/
        };
      },
    );
  }

  double get totalspending {
    return recentTranactions.fold(
      0.0,
      (sum, element) => sum + element['amount'],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(recentTranactions);
    return Card(
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: recentTranactions.map(
            (e) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    e['day'],
                    e['amount'],
                    totalspending == 0
                        ? 0.0
                        : (e['amount'] as double) / totalspending),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
