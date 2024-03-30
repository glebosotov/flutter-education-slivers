import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final _dio = Dio();

class RandomDataListItem extends StatefulWidget {
  const RandomDataListItem({super.key});

  @override
  State<RandomDataListItem> createState() => _RandomDataListItemState();
}

class _RandomDataListItemState extends State<RandomDataListItem> {
  late Future<String> _randomData;

  @override
  void initState() {
    super.initState();
    _randomData = fetchRandomData();
  }

  Future<String> fetchRandomData() async {
    final response = await _dio.get(
      'https://jsonplaceholder.typicode.com/posts/${_generateRandomNumber(1, 100)}',
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.data;
      return data['title'];
    } else {
      throw Exception('Failed to load random data');
    }
  }

  int _generateRandomNumber(int min, int max) {
    return min + (DateTime.now().millisecondsSinceEpoch % (max - min + 1));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _randomData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ListTile(
            leading: Icon(Icons.wb_cloudy_outlined),
            title: Text('Loading...'),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListTile(
            title: Text(snapshot.data!),
            leading: const Icon(Icons.data_usage),
            onTap: () {},
          );
        }
      },
    );
  }
}
