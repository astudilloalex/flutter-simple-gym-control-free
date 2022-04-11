import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/data/local/sqlite/src/customer_sqlite.dart';
import 'package:simple_gym_control_free/src/domain/entities/customer.dart';
import 'package:simple_gym_control_free/src/ui/widgets/custom_progress_indicator.dart';
import 'package:simple_gym_control_free/src/ui/widgets/customer_tile.dart';

class CustomerSearchDelegate extends SearchDelegate<Customer?> {
  @override
  List<Widget>? buildActions(final BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(final BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.adaptive.arrow_back_outlined),
    );
  }

  @override
  Widget buildResults(final BuildContext context) {
    if (query.trim().length < 2) {
      return const Center();
    }
    return FutureBuilder<List<Customer>>(
      future: const CustomerSQLite().searchService(query.trim()),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomProgressIndicator();
        }
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text('noData'.tr),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) {
              return CustomerTile(customer: snapshot.data![index]);
            },
          );
        }
        return Center(
          child: Text('noData'.tr),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(final BuildContext context) {
    if (query.trim().length < 2) {
      return const Center();
    }
    return FutureBuilder<List<Customer>>(
      future: const CustomerSQLite().searchService(query.trim()),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomProgressIndicator();
        }
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text('noData'.tr),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) {
              return CustomerTile(customer: snapshot.data![index]);
            },
          );
        }
        return Center(
          child: Text('noData'.tr),
        );
      },
    );
  }
}
