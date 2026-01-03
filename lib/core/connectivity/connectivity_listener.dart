import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:offline_first_chat_bloc_mvvm/presentation/bloc/chat_event.dart';
import '../../presentation/bloc/chat_bloc.dart';

class ConnectivityListener {
  final ChatBloc bloc;

  ConnectivityListener(this.bloc) {
    Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        bloc.add(SyncPendingMessagesEvent());
      }
    });
  }
}
