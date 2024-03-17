import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My profile',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                child: Text(
                  'Infomration',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: 340,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: ListTile(
                    title: Text(
                      'Elmir Mikayilli',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        ///////////////////////////////////////////
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                child: Text(
                  'Payment Method',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            Container(
              width: 340,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Spacer(flex: 5),
                  RadioListTileExample(),
                  Spacer(
                    flex: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Update',
                          style: TextStyle(fontSize: 17),
                        ),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}

enum SingingCharacter { card, wallet, paypal }

class RadioListTileExample extends StatefulWidget {
  const RadioListTileExample({super.key});

  @override
  State<RadioListTileExample> createState() => _RadioListTileExampleState();
}

class _RadioListTileExampleState extends State<RadioListTileExample> {
  SingingCharacter? _character = SingingCharacter.card;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RadioListTile<SingingCharacter>(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            title: Row(
              children: [
                Text(
                  'Card',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 130,
                ),
                Icon(
                  Icons.credit_card,
                  color: Colors.orangeAccent,
                  size: 40,
                )
              ],
            ),
            value: SingingCharacter.card,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RadioListTile<SingingCharacter>(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            title: Row(
              children: [
                Text(
                  'Wallet',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 117,
                ),
                Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Colors.orangeAccent,
                  size: 40,
                ),
              ],
            ),
            value: SingingCharacter.wallet,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RadioListTile<SingingCharacter>(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            title: Row(
              children: [
                Text(
                  'PayPal',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 110,
                ),
                Icon(
                  Icons.paypal_outlined,
                  color: Colors.orangeAccent,
                  size: 40,
                ),
              ],
            ),
            value: SingingCharacter.paypal,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
