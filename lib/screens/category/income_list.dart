import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../db/category/category_db.dart';
import '../../models/category/category_model.dart';

class IncomeCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: CategoryDB().incomeCategoryListListner, builder: (BuildContext context, List<CategoryModel> newlist, Widget?_) {
      return ListView.separated(itemBuilder: (context, index) {
        final category=newlist[index];
        return Card(
          elevation: 0,
          child: ListTile(

            title: Text(category.name),
            trailing: IconButton(onPressed: () {
              CategoryDB.instance.deleteCategory(category.id);
            }, icon: Icon(Icons.delete)),
          ),
        );
      }, separatorBuilder: (context, index) => SizedBox(height: 10,), itemCount: newlist.length);
    },);
  }
}
