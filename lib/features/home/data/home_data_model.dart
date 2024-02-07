class HomeDataModel {
  final String imagePath;

  HomeDataModel({required this.imagePath});
}

List<HomeDataModel> HomeData = [
  HomeDataModel(imagePath: "assets/components of solar power/solar cell.jpg"),
  HomeDataModel(imagePath: "assets/components of solar power/Battery.jpg"),
  HomeDataModel(
      imagePath: "assets/components of solar power/charge controller.png"),
  HomeDataModel(imagePath: "assets/components of solar power/inverter.png"),
];
