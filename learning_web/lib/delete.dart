import 'package:flutter/material.dart';
import 'package:learning_web/model/product_model.dart';
import 'package:learning_web/services/api.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Delete"),
        ),
        body: FutureBuilder(
          future: Api.getProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Product> pdata = snapshot.data;

              return ListView.builder(
                itemCount: pdata.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.storage),
                    title: Text("${pdata[index].name}"),
                    subtitle: Text("${pdata[index].desc}"),
                    trailing: IconButton(
                        onPressed: () async {
                          try {
                            await Api.deleteProduct(pdata[index].id);
                          } catch (e) {
                            print(e);
                          }
                          pdata.removeAt(index);
                          setState(() {});
                        },
                        icon: const Icon(Icons.delete)),
                  );
                },
              );
            }
          },
        ));
  }
}
