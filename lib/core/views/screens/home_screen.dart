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
        appBar: AppBar(

          actions: [


   Consumer<ProductVm>(
     builder: (context,pvm, child) => Padding(
         padding: EdgeInsets.all(15),
         child: InkWell(
        onTap: (){
      Navigator.pushNamed(context, 'cart_view');
    },
     child: Badge(
      label:Text("${pvm.cartItems.length}")   ,

       child: Icon(Icons.shopping_cart),
     ),

    )
         ,

     )




   ),

          ],
        ),
        body: Column(
          children: [

            Consumer<CategoriesVm>(
              builder: (ctx, cvm, child) {
                if (cvm.allCategories.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return SizedBox(
                  height: 200,
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
            const SizedBox(height: 10),


            Expanded(
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
                                  pvm.addToCart(pvm.allProducts[index]);
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
          ],
        ),
      ),
    );
  }
}

