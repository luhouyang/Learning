import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learning_web/model/product_model.dart';

class Api {
  static const baseUrl = "http://172.29.70.135/api/";

  //post method
  static addProduct(Map pdata) async {
    print(pdata);
    var url = Uri.parse("${baseUrl}add_product");

    try {
      final res = await http.post(url, body: pdata);

      if (res.statusCode == 200) {
        var data = jsonEncode(res.body.toString());
        print(data);
      } else {
        print("Failed to get response");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //fetch method
  static getProduct() async {
    List<Product> products = [];

    var url = Uri.parse("${baseUrl}get_product");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        data["products"].forEach((value) => {
              products.add(Product(
                  name: value['pname'],
                  desc: value['pdesc'],
                  price: value['pprice']))
            });

        // debugPrint(data);  //this line causes fatal error

        return products;
      } else {
        print("Failed to get response");
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
