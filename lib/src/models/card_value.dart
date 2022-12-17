class CardValue {
  final String title;
  final String? subtitle;
  final String? description;
  final String moneyDenomination;
  final double amount;
  final String category;
  final DateTime? createdAt;

  CardValue({
    required this.title,
    required this.moneyDenomination,
    required this.amount,
    required this.category,
    this.subtitle = "",
    this.description = "",
    this.createdAt,
  });
}
