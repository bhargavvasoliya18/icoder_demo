class TransactionModel {
  int? id;
  int? transactionType; // 0 for expense, 1 for earning
  String? description;
  String? transactionDate;
  double? transactionAmount;
  double? openBalance;
  double? closingBalance;
  String? createdAt;

  TransactionModel({
    this.id,
     this.transactionType,
     this.description,
     this.transactionDate,
     this.transactionAmount,
     this.openBalance,
     this.closingBalance,
     this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'transaction_type': transactionType,
      'description': description,
      'transaction_date': transactionDate,
      'transaction_amount': transactionAmount,
      'open_balance': openBalance,
      'closing_balance': closingBalance,
      'created_at': createdAt,
    };
  }

  static TransactionModel fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      transactionType: map['transaction_type'],
      description: map['description'],
      transactionDate: map['transaction_date'],
      transactionAmount: map['transaction_amount'],
      openBalance: map['open_balance'],
      closingBalance: map['closing_balance'],
      createdAt: map['created_at'],
    );
  }
}