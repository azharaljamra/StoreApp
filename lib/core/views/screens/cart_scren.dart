import 'package:app_store/core/viewmodels/products_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
   CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: Center(
        
        child: Consumer<ProductVm>(builder: (ctx,pvm,chiid)=> ListView.builder(
            itemCount: pvm.cartItems.length,
            itemBuilder: (ctx,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.network(pvm.cartItems[index].thumbnail)),

                      Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(pvm.cartItems[index].title),
                              Text("\$${pvm.cartItems[index].price}")

                            ],


                          )),

                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(

                                onTap:(){
                                  pvm.addToCart(pvm.cartItems[index]);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,

                                    shape: BoxShape.circle,),

                                  child: Icon(Icons.add),


                                ),
                              ),

                             Center(
                               child: Text("${pvm.cartItems[index].quantity}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                             ) ,

                              InkWell(
                                onTap:(){
                                  pvm.removeToCart(pvm.cartItems[index]);
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,

                                    shape: BoxShape.circle,),

                                  child: Icon(Icons.remove,),
                                ),
                              ),


                                                 ]),
                      )

                    ],
                  ),
                ),
              );
            })),      ),
    );
  }
}
