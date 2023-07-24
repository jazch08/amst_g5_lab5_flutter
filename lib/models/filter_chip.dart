class FilterChipData {
  String label;
  bool isSelected;

  FilterChipData(this.label, this.isSelected);
}

List<FilterChipData> categories = [
  FilterChipData("Food", false),
  FilterChipData("Brushes", false),
  FilterChipData("Containers", false),
  FilterChipData("Toys", false)
];
