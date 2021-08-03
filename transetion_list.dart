import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/transection.dart';

class Newtransection extends StatelessWidget {
  final List<Transactions> trans;
  final Function deletedata;
  Newtransection(this.trans, this.deletedata);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("TRANSECTION LIST");
    return Container(
      height: 465,
      child: trans.isEmpty
          ? Column(
              children: [
                Text(
                  "NO DATA FOUND!!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 10),
                Container(
                  height: 350,
                  child: Image.network(
                    "https://image.shutterstock.com/shutterstock/photos/1532581805/display_1500/stock-vector-z-z-z-text-on-text-bubble-printable-graphic-tee-design-doodle-for-print-vector-illustration-1532581805.jpg",
                    fit: BoxFit.cover,
                  ),
                  //     child: Image.asset(
                  //   "images/waiting.jpeg",
                  //   fit: BoxFit.cover,
                  // ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 6,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: FittedBox(
                        child: Text(
                          trans[index].amount.toStringAsFixed(0),
                        ),
                      ),
                    ),
                    title: Text(
                      trans[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMEd().format(
                        trans[index].date,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deletedata(trans[index].id),
                    ),
                  ),
                );
              },
              itemCount: trans.length,
            ),
    );
  }
}
