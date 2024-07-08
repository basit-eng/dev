import 'package:flutter/material.dart';
import 'package:flutter_api/bloc/product/product_bloc.dart';
import 'package:flutter_api/bloc/product/product_event.dart';
import 'package:flutter_api/bloc/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/product_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductFetch());
  }

  ProductRepo productRepo = ProductRepo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Our Products")),
        actions: [
          Icon(
            Icons.delete,
          )
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        switch (state.status) {
          case Status.loading:
            return Center(child: CircularProgressIndicator.adaptive());
          case Status.success:
            return ListView.builder(
                itemCount: state.productlist.length,
                itemBuilder: (context, index) {
                  var data = state.productlist[index];
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 8,
                            blurRadius: 9,
                            offset: Offset(2, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(08),
                      ),
                      child: ListTile(
                        // isThreeLine: true,
                        leading: Text(data.id.toString()),
                        title: Text(data.title.toString()),
                        // subtitle: Text(data.description.toString()),
                        trailing: Container(
                          height: 200,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(08),
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: NetworkImage(data.image.toString()))),
                        ),
                      ),
                    ),
                  );
                });
          case Status.error:
            return Center(child: Text(state.msg.toString()));
          default:
            Center(child: Text("Loading wait..." + toString()));
        }
        return Container();
      }),
    );
  }
}
