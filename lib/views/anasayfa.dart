import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/anasayfa_cubit.dart';
import 'package:kisiler_uygulamasi/entity/Kisiler.dart';
import 'package:kisiler_uygulamasi/views/kisi_kayit_sayfa.dart';

import 'kisi_detay.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyormu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyormu ?
            TextField(decoration: const InputDecoration(hintText: "ARA",),
              onChanged: (aramaSonucu){
                context.read<AnasayfaCubit>().ara(aramaSonucu);
              },
            )
            : const Text("Anasayfa"),
        actions: [
          aramaYapiliyormu ?
          IconButton(
                  onPressed: () {
                    setState(() {
                        aramaYapiliyormu = false;
                    });
                    context.read<AnasayfaCubit>().kisleriYukle();
                  },
                  icon: const Icon(Icons.cancel))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyormu = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                )
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<Kisiler>>(
        builder: (context,kisilerListesi){
            if(kisilerListesi.isNotEmpty){
              return ListView.builder(
                itemCount: kisilerListesi.length,
                itemBuilder: (context,indeks){
                  var kisi = kisilerListesi[indeks];
                  return GestureDetector(
                    onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context) => KisiDetaySayfa(kisiler: kisi,)))
                        .then((value){ context.read<AnasayfaCubit>().kisleriYukle();});
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Row(
                          children: [
                            Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                            const Spacer(),
                            IconButton(onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${kisi.kisi_ad} silinsi mi?"),
                                action: SnackBarAction(
                                  label: "EVET",
                                  onPressed: (){
                                    context.read<AnasayfaCubit>().sil(kisi.kisi_id);
                                  },
                                ),
                                )
                              );
                            },
                              icon: const Icon(Icons.delete_outline,color:Colors.black87),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }else{
              return const Center();
            }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const KisilerKayit()))
              .then((value) {
            context.read<AnasayfaCubit>().kisleriYukle();
          });

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
