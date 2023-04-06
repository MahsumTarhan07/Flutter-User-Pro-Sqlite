import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/kisi_kayit_cubit.dart';

class KisilerKayit extends StatefulWidget {
  const KisilerKayit({Key? key}) : super(key: key);

  @override
  State<KisilerKayit> createState() => _KisilerKayit();
}

class _KisilerKayit extends State<KisilerKayit> {
  var tfkisiAd = TextEditingController();
  var tfKisiTel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişiler Kayit"),
      ),
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
                 context.read<KisiKayitCubit>().Kayit(tfkisiAd.text, tfKisiTel.text);
                },
                child: const Text("Kaydet"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
