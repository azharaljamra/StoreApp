import 'package:app_store/core/viewmodels/catgories_vm.dart';
import 'package:app_store/core/viewmodels/products_vm.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [

            ChangeNotifierProvider(
              create: (context) => CategoriesVm()..getCategoriesFromServer(),
              child: Consumer<CategoriesVm>(
                builder: (ctx, cvm, child) {
                  if (cvm.allCategories.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cvm.allCategories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 15),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blue[300],
                                child: const Icon(
                                  Icons.store,
                                  size: 30,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 80,
                                child: Text(
                                "${  cvm.allCategories[index].name}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),


            Expanded(
              child: ChangeNotifierProvider(
                create: (context) => ProductVm()..getProductsFromServer(),
                child: Consumer<ProductVm>(
                  builder: (ctx, pvm, child) {
                    if (pvm.allProducts.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                      itemCount: pvm.allProducts.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          height: 380,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Image.network(
                                pvm.allProducts[index].thumbnail,
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              ListTile(
                                leading: InkWell(
                                  child: const Icon(Icons.add_shopping_cart),
                                  onTap: () {
                                    pvm.addOne();
                                  },
                                ),
                                trailing:
                                Text("\$${pvm.allProducts[index].price}"),
                                subtitle: Text(pvm.allProducts[index].category),
                                title: Text(pvm.allProducts[index].title),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

