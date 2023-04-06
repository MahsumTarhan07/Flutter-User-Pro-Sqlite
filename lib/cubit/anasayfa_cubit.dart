import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/entity/Kisiler.dart';
import 'package:kisiler_uygulamasi/repo/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>>{
  AnasayfaCubit() : super(<Kisiler>[]);


  var krepo = KisilerDaoRepositor();

  Future<void> kisleriYukle() async{
    var liste = await krepo.tumKisilerAl();
    emit(liste);
  }


  Future<void> ara(String aramaKelimesi) async{
    var liste = await krepo.kisiAra(aramaKelimesi);
    emit(liste);
  }


  Future<void> sil(int kisi_id) async {
    await krepo.kisiSil(kisi_id);
    await kisleriYukle();
  }
}