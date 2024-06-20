class ListViewParams {
  final int page;

  ListViewParams({
    required this.page,
  });

  Map<String, dynamic> toJson() => {
    '': page,
  };
}
