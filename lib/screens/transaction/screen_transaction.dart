import 'package:flutter/material.dart';
import 'package:personal_money_manager/db/transaction/transaction_db.dart';

import '../../db/category/category_db.dart';
import '../../models/category/category_model.dart';
import 'package:intl/intl.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({super.key});



  @override
  Widget build(BuildContext context) {

    TransactionDB.instancs.refresh();
    CategoryDB.instance.refreshUI();
    return ValueListenableBuilder(valueListenable: TransactionDB.instancs.transactionListNotifier, builder: (BuildContext context, value, Widget? _) {
      return ListView.separated(

          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            final transaction=value[index];
            return Card(
              elevation: 0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: transaction.type==CategoryType.income?Colors.green:Colors.red,

                    radius: 55,
                    child: Text(parseDate(transaction.date))),
                title: Text("\$${transaction.amount}"),
                subtitle: Text(transaction.category.name),

              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          itemCount: value.length);
    },);
  }
  String parseDate(DateTime date){
    final _date=DateFormat.MMMd().format(date);
    return _date;
    //return '${date.day}\n${date.month}';
  }
}
