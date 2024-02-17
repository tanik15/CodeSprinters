import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/api/api.dart';
import 'package:portfolio/colors/colors.dart';
import 'package:portfolio/data/chart.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({super.key, required this.stockName});

  final String stockName;

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  // TabController? _tabController;

  bool isLoading = false;
  List<FlSpot> listt = [];

  void getData() async {
    setState(() {
      isLoading = true;
    });
    final res = await getStockDetails("apple");
    // print();
    print(res[0]['High'].runtimeType);
    for (int i = 0; i < res.length; i++) {
      listt.add(FlSpot(((i * 10) + i) + 0.0, double.parse(res[i]['Date'])));
      // listt.add(FlSpot(double,res[0]['High']));
    }
    setState(() {
      isLoading = false;
    });
    listt = const [
      FlSpot(0, 3),
      FlSpot(2, 2),
      FlSpot(4, 5),
      FlSpot(6, 3.1),
      FlSpot(8, 4),
      FlSpot(9, 3),
      FlSpot(10, 4),
      FlSpot(12, 7),
      FlSpot(14, 2),
      FlSpot(16, 5),
      FlSpot(18, 8),
      FlSpot(20, 4),
      FlSpot(22, 3),
      FlSpot(24, 9),
      FlSpot(26, 4),
      FlSpot(28, 6),
      FlSpot(30, 4),
    ];
    print(listt);
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // _tabController?.dispose();
    super.dispose();
  }

  final _numberOfStocksController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                forceMaterialTransparency: true,
                automaticallyImplyLeading: false,
                title: const Text("Wealth Wise"),
              ),
              const Divider(),
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.stockName,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              if (!isLoading)
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    child: LineChartSample2(list: listt),
                  ),
                ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                    "The Delhi High Court has refused to entertain a petition seeking a direction against a private zoo and an elephant camp situated inside the Reliance Complex in Jamnagar, Gujarat. The petition filed by advocate Rahul Narula sought a direction not to hold Anant Ambani and Radhika Merchants wedding events by displaying or exhibiting animals in their possession."),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 2; i++)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height: 50,
                              width: size.width * 0.42,
                              decoration: BoxDecoration(
                                // border: Border.all(),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade900,
                                    blurRadius: 5,
                                    offset: const Offset(0.5, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: const Center(
                                child: Text(
                                  "Current change",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height: 50,
                              width: size.width * 0.42,
                              decoration: BoxDecoration(
                                // border: Border.all(),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade900,
                                    blurRadius: 5,
                                    offset: const Offset(0.5, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: const Center(
                                child: Text(
                                  "High: 240",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height: 50,
                              width: size.width * 0.42,
                              decoration: BoxDecoration(
                                // border: Border.all(),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade900,
                                    blurRadius: 5,
                                    offset: const Offset(0.5, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: const Center(
                                child: Text(
                                  "Low: 240",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Number of Stocks",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextField(
                        controller: _numberOfStocksController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: '  ',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String numberOfStocks = _numberOfStocksController.text;
                  if (numberOfStocks.isNotEmpty) {
                    // Handle the number of stocks input
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
