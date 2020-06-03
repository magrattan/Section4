import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx,index){
          return Card(
                      child: Row(children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15
                          ),
                          decoration: BoxDecoration(border:Border.all(color: Colors.purple,width: 2)),
                          padding: EdgeInsets.all(10),
                          child: Text('£' + transactions[index].amount.toStringAsFixed(2), 
                                      style: TextStyle(fontWeight: FontWeight.bold, 
                                      color: Colors.purple)
                                      )
                            ),
                            
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,//moves items to left
                              children: <Widget>[
                                 Text(
                                      transactions[index].title,
                                      style: TextStyle(fontWeight: FontWeight.bold, 
                                      color: Colors.black )
                                      ),
                                 Text(
                                      DateFormat('EEE, dd/M/yyyy').format(transactions[index].date),
                                      style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Colors.grey))
                              ],
                            )
                            ]
                          ),
                      );
        },
        itemCount: transactions.length,
    )
  );
}
}