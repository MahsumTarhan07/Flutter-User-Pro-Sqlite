import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/kisilerdao_repository.dart';

class KisiDetayCubit extends  Cubit<void>{
  KisiDetayCubit() : super(0);

  var krepo = KisilerDaoRepositor();


  Future<void> Guncele(int kisi_id,String kisi_ad, String kisi_tel) async {
   await krepo.KisiGuncele(kisi_id, kisi_ad, kisi_tel);
  }

}