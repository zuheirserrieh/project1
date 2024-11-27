import 'package:flutter/material.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String callType = 'Local';
  bool hasOffer = false;
  int callDuration = 0;
  double totalCost = 0.0;

  void calculateCost() {
    double rate = callType == 'Local' ? 0.5 : 1.5;
    double cost = rate * callDuration;
    if (hasOffer) cost *= 0.9;
    setState(() {
      totalCost = cost;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text('Call Cost Calculator')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Radio(
                  value: 'Local',
                  groupValue: callType,
                  onChanged: (value) => setState(() => callType = value!),
                ),
                Text('Local'),
                Radio(
                  value: 'Roaming',
                  groupValue: callType,
                  onChanged: (value) => setState(() => callType = value!),
                ),
                Text('Roaming'),
              ],
            ),
            SizedBox(height: 10),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Call Duration (minutes)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  callDuration = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 10),

            Row(
              children: [
                Checkbox(
                  value: hasOffer,
                  onChanged: (value) => setState(() => hasOffer = value!),
                ),
                Text('10% Discount Offer'),
              ],
            ),
            SizedBox(height: 10),

            Center(
              child: ElevatedButton(
                onPressed: calculateCost,
                child: Text('Calculate'),
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Total Cost: \$${totalCost.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
