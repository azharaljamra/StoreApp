import 'package:app_store/core/viewmodels/products_vm.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen  extends StatelessWidget {
  HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> ProductVm()..getProductsFromServer(),

      child: Scaffold(
         appBar: AppBar(

           actions: [Padding(padding: EdgeInsets.all(10), child: Badge(label: Consumer<ProductVm>(builder: (ctx,pvm, child)=>Text("${pvm.total}")) , child: Icon(Icons.shopping_cart),),)],
         ),
        body: Consumer<ProductVm>(builder: (ctx, pvm, child){
        if(pvm.allProducts.isEmpty)
          return Center(child: Text("loading..."),);
          return ListView.builder(
              itemCount: pvm.allProducts.length,
              itemBuilder:(ctx,index){
                return Container(
                margin: EdgeInsets.all(10),
                height: 380,
                width: double.infinity,
                child:Column(
                  children: [
                    Image.network(pvm.allProducts[index].thumbnail),
                    ListTile(
                      leading: InkWell(child: Icon(Icons.add_shopping_cart), onTap: (){
                        pvm.addOne();
                      },),
                      trailing: Text("${pvm.allProducts[index].price}"),
                      subtitle:  Text(pvm.allProducts[index].category),
                      title:  Text(pvm.allProducts[index].title),

                    )
                  ],
                )
                );
              } ) ;
        }
        ),

      ),);
  }
}
