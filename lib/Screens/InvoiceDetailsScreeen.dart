import 'package:flutter/material.dart';
class InvoiceDetailsScreen extends StatefulWidget {
  const InvoiceDetailsScreen({Key key}) : super(key: key);

  @override
  _InvoiceDetailsScreenState createState() => _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("restaurant name"),
                          Text("Restaurant phone number")
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Name"), Text("Price"), Text("Count")],
                      ),
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(border: Border.all()),
                  //   child: Column(
                  //     children: List.generate(
                  //       DetailsRestaurantActiveOrderTile.foods.length,
                  //           (index) => Card(
                  //         child: ListTile(
                  //           title: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Text(Accounts.digester(
                  //                   DetailsRestaurantActiveOrderTile
                  //                       .foods[index].name,
                  //                   10)),
                  //               Text("\$" +
                  //                   DetailsRestaurantActiveOrderTile
                  //                       .foods[index].price),
                  //               Text(DetailsRestaurantActiveOrderTile
                  //                   .numberOfFoods[index]
                  //                   .toString()),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sum: '),
                          Text('\$' +
                              "sum of prices"),
                          Text("number of foods")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
