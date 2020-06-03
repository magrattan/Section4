
import 'package:flutter/material.dart';
import 'package:section4project/widgets/transctionList.dart';

import './widgets/transctionList.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//reference is final not the data
  final List<Transaction> _userTransactions = [
    Transaction(id:'Tx1', title: 'Stationery', amount: 19.99, date: DateTime.now()),
    Transaction(id:'Tx2', title: 'Food', amount: 99.99, date: DateTime.now())
  ];
  
  void _addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction(title: txTitle, 
                              amount: txAmount, 
                              date: DateTime.now(), 
                              id: DateTime.now().toString() );
    setState((){
        _userTransactions.add(newTx);
    });
  }
  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (bCtx) {
      return GestureDetector(
        onTap: (){},
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: ()=> _startAddNewTransaction(context))
        ],
      ),

      body: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width:double.infinity,
                child: Card(
                  color:Colors.blue,
                  child: Text('Chart',style: TextStyle(fontSize: 18)),
                  elevation: 5,
                ),
              ),
             TransactionList(_userTransactions)
            ]
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
        ),
    );
  }        
}