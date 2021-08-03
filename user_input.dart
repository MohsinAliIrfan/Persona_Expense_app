import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Userinput extends StatefulWidget {
  final Function adddatainlist;

  Userinput(this.adddatainlist);

  @override
  _UserinputState createState() => _UserinputState();
}

class _UserinputState extends State<Userinput> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();
  DateTime date;

  void adddata() {
    if (titlecontroller.text.isEmpty ||
        amountcontroller.text.isEmpty ||
        date == null) {
      return;
    } else {
      print("NOT NULL");
      widget.adddatainlist(
          titlecontroller.text, double.parse(amountcontroller.text), date);

      Navigator.of(context).pop();
    }
  }

  void pickdate() {
    print("aya h");
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickeddate) => {
          if (pickeddate != null)
            {
              setState(() {
                date = pickeddate;
              })
            }
          else
            {
              // date = DateTime.now(),
              print("no date picked"),
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller:
                titlecontroller, // the amount enterd will be stored in titlecontroller like this
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountcontroller,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => adddata(),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  date == null
                      ? "No Date Choosen"
                      : DateFormat.E().format(date),
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () => pickdate(),
                child: Text("Select Date",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    )),
              ),
            ],
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Theme.of(context).textTheme.button.color,
              backgroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: () => adddata(),
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
