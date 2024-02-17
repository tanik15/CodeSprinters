import 'package:flutter/material.dart';
import 'package:portfolio/widget/list_view_widget.dart';

class QuickBuy extends StatefulWidget {
  const QuickBuy({super.key});

  @override
  State<QuickBuy> createState() => _QuickBuyState();
}

class _QuickBuyState extends State<QuickBuy> {
  List tileList = ["Reliance", "Nifty50", "Index", "Infosys", "IRCTC"];
  TextEditingController titlecontroller = TextEditingController();
  List isFound = [];

  @override
  void initState() {
    super.initState();
  }

  void runFilter(String enteredValue) {
    List result = [];
    if (enteredValue.isEmpty) {
      result = [];
    } else {
      result = tileList
          .where((element) =>
              element.toString().toLowerCase().contains(enteredValue))
          .toList();
    }
    setState(() {
      isFound = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: const Text("Wealth Wise"),
      ),
          Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            color: Colors.white,
            child: SizedBox(
                height: 60,
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 250,
                          child: TextField(
                            cursorColor: Colors.black,
                            onChanged: (value) => runFilter(value),
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                // helperMaxLines: 0,
                                label: Text(
                                  "Search",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                )),
                          )),
                      const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 25,
                      ),
                    ],
                  ),
                )),
          ),
            for (int i = 0; i < isFound.length; i++)
                ListTileWidget(title: isFound[i]),
          for(int i =0; i<tileList.length; i++)
          ListTileWidget(title: tileList[i])
        ],
      ),
    );
  }
}
