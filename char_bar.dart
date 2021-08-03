import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double totalamount;
  final String day;
  final double spendingper; //spending peercentage

  ChartBar(this.day, this.totalamount, this.spendingper);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 1,
      child: Column(
        children: [
          FittedBox(
            child: Text(
              totalamount.toStringAsFixed(0),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Color.fromRGBO(
                        220, 220, 220, 1), // background color of the container
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingper,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(day)
        ],
      ),
    );
  }
}
