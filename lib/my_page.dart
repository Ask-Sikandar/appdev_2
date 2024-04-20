import 'package:appdev_2/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:appdev_2/provider/user_provider.dart';


class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.watch(userProvider);
    return Scaffold(
      body: switch(userNotifier){
        AsyncData(:final value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (cxt, i)=> Card(
                  child: ListTile(
                    title: Text(value[i].name ?? ''),)),
          separatorBuilder: (cxt,i)=>const Divider(),
      itemCount: value.length,),
        ),
        AsyncError(:final error) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Text('error: $error'),
        ),
      _ => const Center(child: CircularProgressIndicator()),
      }
    );
  }
}
