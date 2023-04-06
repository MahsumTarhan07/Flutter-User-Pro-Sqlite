
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/entity/Kisiler.dart';

import '../cubit/kisi_detay_cubit.dart';

class KisiDetaySayfa extends StatefulWidget {
 Kisiler kisiler;

 KisiDetaySayfa({required this.kisiler});

  @override
  State<KisiDetaySayfa> createState() => _KisiDetaySayfaState();
}


class _KisiDetaySayfaState extends State<KisiDetaySayfa> {

  var tfkisiAd = TextEditingController();
  var tfKisiTel = TextEditingController();

  @override
  void initState() {
    super.initState();
    var kisi = widget.kisiler;
    tfkisiAd.text = kisi.kisi_ad;
    tfKisiTel.text = kisi.kisi_tel;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kişi Detay"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                  controller: tfkisiAd,
                  decoration: const InputDecoration(hintText: "Kişi Ad")),
              TextField(
                  controller: tfKisiTel,
                  decoration: const InputDecoration(hintText: "Kişi Ad")),
              ElevatedButton(
                onPressed: () {
                  context.read<KisiDetayCubit>().Guncele(widget.kisiler.kisi_id, tfkisiAd.text,tfKisiTel.text);
                },
                child: const Text("Güncele"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
