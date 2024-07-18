import 'package:flutter/material.dart';
import 'package:hng_task3_shopper/models/history_model.dart';
import 'package:hng_task3_shopper/utils/colors.dart';
import 'package:hng_task3_shopper/utils/shared_pref.dart';
import 'package:hng_task3_shopper/views/history_page/components/order_details_page.dart';
import 'package:hng_task3_shopper/widgets/custom_appbar_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  List<OrderHistoryModel> historyList = [];

  @override
  void initState() {
    super.initState();
    loadOrderHistory();
  }

  Future<void> loadOrderHistory() async {
    historyList = await PrefUtils.getCartOrder('HISTORY');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomAppBarHeader(title: "Order History"),
      ),
      body: historyList.isEmpty
          ? const Center(
              child: Text(
                'No  history found',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: historyList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OrderDetailPage(order: historyList[index]),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 230,
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order ${index + 1}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: historyList[index]
                                        .orderItem
                                        .map((item) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundColor:
                                                const Color(0xffededed),
                                            backgroundImage:
                                                NetworkImage(item.image),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(child: Text(item.title)),
                                          Text('Qty: ${item.quantity}'),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total Amount',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '₦ ${historyList[index].totalOrderPrice.formatMoney}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
