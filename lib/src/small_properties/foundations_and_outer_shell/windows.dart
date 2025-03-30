import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';
import '../material_info.dart';

part 'windows.freezed.dart';

/// Ikkunat
/// Sisältää tiedot kaikkien ikkunoiden kappalemääristä ja materiaalimääristä yhteensä
@freezed
abstract class Windows with _$Windows {
  const Windows._();

  const factory Windows({
    num? woodenFramePcs,
    num? steelPcs,
    num? aluminiumPcs,
    @Default(false) bool areWindowsRecyclable,
  }) = _Windows;

  num? get woodenFrameWindowWoodTons {
    num? multiply = Utils.multiplyOrNull([
      woodenFramePcs,
      DoorsAndWindowsWeights.woodenWindows140x140glass2x1_5sqmFrameKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  num? get woodenFrameWindowGlassTons {
    num? multiply = Utils.multiplyOrNull([
      woodenFramePcs,
      DoorsAndWindowsWeights.woodenWindows140x140glass2x1_5sqmGlassKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  num? get steelWindowSteelTons {
    num? multiply = Utils.multiplyOrNull([
      steelPcs,
      DoorsAndWindowsWeights.steelFramedWindows140x140glass2x1_5sqmFrameKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  num? get steelWindowGlassTons {
    num? multiply = Utils.multiplyOrNull([
      steelPcs,
      DoorsAndWindowsWeights.steelFramedWindows140x140glass2x1_5sqmGlassKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  num? get aluminiumWindowAluminiumTons {
    num? multiply = Utils.multiplyOrNull([
      aluminiumPcs,
      DoorsAndWindowsWeights.aluminiumFramedWindows140x140glass2x1_5sqmFrameKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  num? get aluminiumWindowGlassTons {
    num? multiply = Utils.multiplyOrNull([
      aluminiumPcs,
      DoorsAndWindowsWeights.aluminiumFramedWindows140x140glass2x1_5sqmGlassKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Next parts are form Laskenta tab, ikkunat

  /// Kierrätettävät ikkunat, puuta (tonnia)
  num? get recyclableWindowsWoodTons {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return woodenFrameWindowWoodTons;
  }

  /// Kierrätettävät ikkunat, puuta (kpl)
  num? get recyclableWindowsPieces {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return woodenFramePcs;
  }

  /// Ikkunat, puuta, romut ja poltettavat (tonnia)
  num? get woodenWindowsScrapAndBurnable {
    if (areWindowsRecyclable == true) {
      return 0;
    }
    return woodenFrameWindowWoodTons;
  }

  /// Kierrätettävät ikkunat, terästä (tonnia)
  num? get recyclableSteelWindowsTons {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return steelWindowSteelTons;
  }

  /// Kierrätettävät ikkunat, terästä (kpl)
  num? get recyclableSteelWindowsPieces {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return steelPcs;
  }

  /// Ikkunat, terästä, romut ja poltettavat (tonnia)
  num? get steelWindowsScrapAndBurnable {
    if (areWindowsRecyclable == true) {
      return 0;
    }
    return steelWindowSteelTons;
  }

  /// Kierrätettävät ikkunat, alumiinia (tonnia)
  num? get recyclableAluminiumWindowsTons {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return aluminiumWindowAluminiumTons;
  }

  /// Kierrätettävät ikkunat, alumiinia (kpl)
  num? get recyclableAluminiumWindowsPieces {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return aluminiumPcs;
  }

  /// Ikkunat, alumiinia, romut ja poltettavat (tonnia)
  num? get aluminiumWindowsScrapAndBurnable {
    if (areWindowsRecyclable == true) {
      return 0;
    }
    return aluminiumWindowAluminiumTons;
  }

  /// Kierrätettävien ikkunoiden lasiosuus, tonnia
  num? get recyclableWindowsGlassTons {
    if (areWindowsRecyclable == true) {
      return null;
    }
    return Utils.sumOrNull([
      woodenFrameWindowGlassTons,
      steelWindowGlassTons,
      aluminiumWindowGlassTons
    ]);
  }

  /// Ikkunoiden lasiosuus, romut ja poltettavat
  num? get windowsGlassScrapAndBurnable {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return Utils.sumOrNull([
      woodenFrameWindowGlassTons,
      steelWindowGlassTons,
      aluminiumWindowGlassTons
    ]);
  }
}
