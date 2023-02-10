import 'package:flutter/material.dart';
import 'package:personal_money_manager/screens/category/category_add_popup.dart';
import 'package:personal_money_manager/screens/category/screen_category.dart';
import 'package:personal_money_manager/screens/home/widgets/bottom_navigation_bar.dart';
import 'package:personal_money_manager/screens/transaction/screen_add_transactions.dart';

import '../transaction/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = [
    ScreenTransaction(),
    ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100 ],
      appBar: AppBar(title: Text("Money Manager"),),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
        if(selectedIndexNotifier.value==0){
          print("transaction page");
          Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenAddTransactions(),));
        }
        else{
          print("category page");
          showCategoryAddPopup(context);
        }

      },child: Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: MoneyManagerBottomNavigation(),
      body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (context, updatedIndex, _) {
              return _pages[updatedIndex];
            },
          )),
    );
  }
}
