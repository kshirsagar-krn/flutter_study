// lib/screens/home_screen.dart
import 'package:fake_store/widgets/update_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/app_controller.dart';
import '../widgets/rezorpay_dialogue.dart';

class HomeScreen extends StatelessWidget {
  AppController appController = Get.put(AppController());

  // @override
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // logic --
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: Obx(
            () {
              if (appController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (appController.errorMessage.isNotEmpty) {
                return Center(child: Text(appController.errorMessage.value));
              } else {
                var data = appController.productData;
                return ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      color: Colors.grey.shade200,
                    );
                  },
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Image.network(
                          "${data[index].image}",
                          width: 60,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data[index].title}",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                "${data[index].category}".toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: Colors.green,
                                    ),
                              ),
                              Text(
                                "${data[index].description}",
                                maxLines: 3,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // appController.getProductData();
              RezOnlinePayment().dialogue(context);
            },
            child: const Icon(Icons.refresh),
          )),
    );
  }
}
