class WalletTransactionModel {
  final String id;
  final String title;
  final String description;
  final double amount;
  final bool isCredit;
  final String status;
  final DateTime date;
  final String? paymentId;
  final String? paymentMethod;

  WalletTransactionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.isCredit,
    required this.status,
    required this.date,
    this.paymentId,
    this.paymentMethod,
  });
}