import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../app_utiles/error_modle.dart';
import '../../app_utiles/show_log.dart';
import '../../data/model/response_model/onboard/onboarding_response.dart';
import '../../data/model/response_model/settings/settings_model.dart';
import '../../data/repository/reositories.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit(this.repositories) : super(OnboardInitial());
  final Repositories repositories;

  dynamic fetchOnboard() {
    emit(OnboardLoading(true));
    OnBoardResponse? onBoardingResponse;
    showLog("onBoarding", "getting onBoard");
    repositories.onBoarding().then(
      (onboard) {
        showLog("onBoarding", "$onboard");
        if (onboard != null) {
          onBoardingResponse = OnBoardResponse.fromJson(onboard);
          emit(OnboardLoaded(onBoardingResponse));
        } else {
          emit(OnboardError());
        }
      },
    );

    return onBoardingResponse;
  }

  defaultSettings() {
    emit(OnboardLoading(true));
    dynamic settings;
    repositories.defaultSettings().then(
      (setting) {
        if (setting != ErrorModel) {
          settings = SettingsModel.fromJson(setting);
          emit(SettingsLoaded(settings));
        } else {
          emit(SettingError(settings));
        }
      },
    );
  }
}
