import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Text(
                  "No transactions added...",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image(
                    image: AssetImage("assets/images/zzz.png"),
                    height: 100,
                  ),
                )
              ],
            ),
          )
        : Flexible(
            child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "£${transactions[index].amount.toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 20),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2),
                        borderRadius:
                            new BorderRadius.all(Radius.circular(5)))),
                title: Text(
                  transactions[index].title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(transactions[index].date),
                  style: TextStyle(fontSize: 15, color: Colors.black45),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () {
                    deleteTx(transactions[index].id);
                  },
                ),
              );
            },
            itemCount: transactions.length,
          ));
  }
}
