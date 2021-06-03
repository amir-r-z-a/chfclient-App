import 'package:flutter/material.dart';
class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({Key key}) : super(key: key);

  @override
  _InvoiceDetailsState createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("Details") ,
      ),
      body: ListView(
        children: [
          Column(
            // children: List.generate(length, (index) => null),
          )
        ],
      ),
    );
  }
}
