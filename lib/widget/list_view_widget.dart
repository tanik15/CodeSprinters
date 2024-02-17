import 'package:flutter/material.dart';
import 'package:portfolio/screens/buy_screen.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      child: Card(
        elevation: 1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        color: Colors.white,
        child: SizedBox(
            height: 60,
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        // const Text(
                        //   '\u{20B9}1581 | 0.96%',
                        //   style: TextStyle(color: Colors.black, fontSize: 11),
                        // )
                        RichText(
                          text: const TextSpan(
                            text: '\u{20B9}1581',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.green,
                                  size: 12,
                                ),
                              ),
                              TextSpan(
                                text: '0.96%',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: ((context) => BuyScreen(stockName: title))));
                        },
                        child: const Text(
                          "Buy",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ))
                  ]),
            )),
      ),
    );
  }
}
