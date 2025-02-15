enum WoodMaterialType {
  board20x125,
  trunkWood50x100,
  trunkWood50x150,
  trunkWood50x200,
  trunkWood100x100,
  trunkWood150x150,
}

class WoodMaterialInfo {
  static final Map<WoodMaterialType, num> _volumes = {
    WoodMaterialType.board20x125: 0.004,
    WoodMaterialType.trunkWood50x100: 0.005,
    WoodMaterialType.trunkWood50x150: 0.0075,
    WoodMaterialType.trunkWood50x200: 0.01,
    WoodMaterialType.trunkWood100x100: 0.01,
    WoodMaterialType.trunkWood150x150: 0.0225,
  };

  static num volumePerLinearMeter(WoodMaterialType materialType) =>
      _volumes[materialType]!;

  static num weightPerLinearMeter(WoodMaterialType materialType) =>
      _volumes[materialType]! * 500;

  static num boardConsumptionPerSquareMeter(WoodMaterialType materialType) {
    switch (materialType) {
      case WoodMaterialType.board20x125:
        return 8;
      default:
        return 1.25;
    }
  }

  static num woodWeightPerSquareMeter(WoodMaterialType materialType) =>
      boardConsumptionPerSquareMeter(materialType) /
      weightPerLinearMeter(materialType);

  static num densityKgPerCubicMeter() => 500;
}

class YardStructure {
  static final num soilToRemoveDensityKgPerCbm = 1500;
  static final num asphaltWeightKgPerSqm = 100;
  static final num aslphaltDensityKgPerCbm = 2500;
}
