import 'package:flutter/material.dart';
import 'package:portfolio/api/api.dart';
import 'package:portfolio/model/quick_start.dart';
import 'package:portfolio/widget/list_view_widget.dart';

class QuickBuy extends StatefulWidget {
  const QuickBuy({super.key});

  @override
  State<QuickBuy> createState() => _QuickBuyState();
}

class _QuickBuyState extends State<QuickBuy> {
  // List tileList = ["Reliance", "Nifty50", "Index", "Infosys", "IRCTC"];
  List<QuickAdd> tileList = [];

  TextEditingController titlecontroller = TextEditingController();
  List<QuickAdd> isFound = [];
  bool isLoading = false;

  @override
  void initState() {
    getStockListtt();
    super.initState();
  }

  void getStockListtt() async {
    setState(() {
      isLoading = true;
    });
    final res = await getStockList();
    for (int i = 0; i < res.length; i++) {
      if ("Meta Platforms Inc - Class A" != res[i]['CompanyName'] &&
          "International Business Machines Corp." != res[i]['CompanyName']) {
        tileList.add(QuickAdd(
            name: res[i]['CompanyName'],
            currentPrice: res[i]['LatestPrice'].toString(),
            changeinPercentage: res[i]['PercentageChange'].toString(),
            description: res[i]['Description'].toString()
            ));
      }
    }
    setState(() {
      isLoading = false;
    });
    print(tileList);
  }

  void runFilter(String enteredValue) {
    List<QuickAdd> result = [];
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              forceMaterialTransparency: true,
              automaticallyImplyLeading: false,
              title: const Text(
                "Wealth Wise",
                style: TextStyle(color: Colors.white),
              ),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 0),
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
              ListTileWidget(
                description: isFound[i].description,
                title: isFound[i].name,changePercentage: isFound[i].changeinPercentage,currentPrice: isFound[i].currentPrice),
            if (!isLoading)
              for (int i = 0; i < tileList.length; i++)
                ListTileWidget(
                  description: tileList[i].description ,
                  title: tileList[i].name,changePercentage: tileList[i].changeinPercentage,currentPrice:tileList[i].currentPrice ),
            if (isLoading)
              const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ))
          ],
        ),
      ),
    );
  }
}
