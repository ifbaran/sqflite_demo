import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }

}

class ProductAddState extends State {
  var dbHelper = new DbHelper();

  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar:AppBar(
          title: Text("Ürün Ekleme")
        ),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              buildNameField(),
              buildDescriptionField(),
              buildUnitPriceField(),
              buildSaveButton()
            ],
          ),
        ),
      );
  }

  Widget buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText:"Ürün Adı"),
      controller: txtName,
    );
  }

  Widget buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText:"Ürün Açıklaması"),
      controller: txtDescription,
    );
  }

  Widget buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(labelText:"Ürün Fiyatı"),
      controller: txtUnitPrice,
    );
  }

  Widget buildSaveButton() {
    return FlatButton(
      child: Text("Ekle"),
      onPressed: () {
        addProduct();
      }
    );
  }

  void addProduct() async {
    var result = await dbHelper.insert(new Product(name: txtName.text, description: txtDescription.text, unitPrice: double.tryParse(txtUnitPrice.text)));
    Navigator.pop(context,true);
  }


}


