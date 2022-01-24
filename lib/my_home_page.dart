import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String,dynamic>? paymentIntentData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stripe Payment"),),
      body: Center(
        child: InkWell(
          onTap: () async{
            await MakePayment();
          },
          child: Container(
            height: 500,
            width: 500,
            decoration: BoxDecoration(
                color: Colors.green
            ),
            child:Center(child: Text('Pay')) ,),
        ),
      ),
    );
  }
  Future<void> MakePayment() async{
    try{
      paymentIntentData =await createPaymentIntent('20', "USD");
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
        applePay: true,
        googlePay: true,
        merchantDisplayName: 'Asif',
        merchantCountryCode: 'US'
      ));

    displayPaymentSheet();
    }
    catch(e){
      print(e.toString());
    }
  }

  displayPaymentSheet() async{
    try{
      await Stripe.instance.presentPaymentSheet(
          parameters: PresentPaymentSheetParameters(clientSecret: paymentIntentData!['client_secret'],
              confirmPayment: true
          )
      );
      setState(() {
        paymentIntentData=null;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Paid Succesfully')));
    }
    on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text("Cancelled "),
          ));
    }
  }

  createPaymentIntent(String amount,String currency) async
  {
    try{
      Map<String,dynamic>? body={
        'amount':calculatePayment(amount),
        'currency':currency,
        'payment_method_types[]':'card'
      };
      var response=await http.post(Uri.parse('https://api.stripe.com/v1/payment_intents'),
      body: body,
          headers: {
            'Authorization':'Bearer "secret key"'
            ,
            'Content-Type': 'application/x-www-form-urlencoded'
          });
    return jsonDecode(response.body.toString());
    }
    catch(e){print(e.toString());}
  }
  calculatePayment(String amount){
    final price=int.parse(amount)*100;
    return price.toString();

  }

}

