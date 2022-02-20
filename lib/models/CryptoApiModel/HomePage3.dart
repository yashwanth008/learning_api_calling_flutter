import 'package:api_call_testing/components/Currencies.dart';
import 'package:api_call_testing/models/CryptoApiModel/crypto.dart';
import 'package:api_call_testing/models/CryptoApiModel/crypto.api.dart';
import 'package:flutter/material.dart';

class HomePage3 extends StatefulWidget {
  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  Currencies init = new Currencies(name: 'hello', price: '10', change: '45', iconUrl: 'yash');
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  late List<crypto> _crypto;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getCrypto();
  }
  Future<void> getCrypto() async {
    _crypto = await cryptoApi.getCrypto();
    setState(() {
      isLoading = false;
    });
    print(_crypto);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        title:Text(
            'CRYPTOMATE',
          style: TextStyle(fontSize: 18.0,color: Colors.grey[900]),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:<Color>[
                  Colors.green,
                  Colors.yellow,
                  Colors.lightBlue,
                ])
          ),
        ),
      ),
        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: getCrypto,
          child: isLoading?
          Center(child: CircularProgressIndicator(),):ListView.builder(
              itemCount: _crypto.length,
              itemBuilder: (BuildContext contex, int index){
                return Currencies(
                    name: _crypto[index].name,
                    price: _crypto[index].price,
                    change: _crypto[index].change,
                    iconUrl: _crypto[index].iconUrl);
              }),
        )
    );
  }


}
