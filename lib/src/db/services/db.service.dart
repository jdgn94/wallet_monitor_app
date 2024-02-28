import 'package:sqflite/sqlite_api.dart';

class WalletMonitorDB {
  Future<void> createTables(Database database) async {
    await database.execute("""
        CREATE TABLE IF NOT EXISTS currencies (
          id INTEGER NOT NULL,
          name VARCHAR NOT NULL,
          symbol CHAR(5) NOT NULL,
          code CHAR(5) NOT NULL,
          exchange_rate DECIMAL(12, 2) NOT NULL,
          decimal_digits INTEGER DEFAULT 0,
          deleted INTEGER DEFAULT 0,
          PRIMARY KEY (id AUTOINCREMENT)
        );
      """);

    await database.execute("""
      CREATE TABLE IF NOT EXISTS banks (
        id INTEGER NOT NULL,
        name VARCHAR NOT NULL,
        icon VARCHAR NOT NULL,
        icon_category VARCHAR NOT NULL,
        color INTEGER NOT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        deleted_at DATETIME,
        PRIMARY KEY (id AUTOINCREMENT)
      );
    """);

    await database.execute("""
      CREATE TABLE IF NOT EXISTS accounts (
        id INTEGER NOT NULL,
        name VARCHAR NOT NULL,
        description VARCHAR,
        icon VARCHAR NOT NULL,
        icon_category VARCHAR NOT NULL,
        color INTEGER NOT NULL,
        amount DECIMAL(12, 2) DEFAULT 0,
        min_amount DECIMAL(12, 2) DEFAULT 0,
        currency_id INTEGER NOT NULL,
        bank_id INTEGER,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        deleted_at DATETIME,
        PRIMARY KEY (id AUTOINCREMENT),
        FOREIGN KEY (currency_id) REFERENCES currencies (id),
        FOREIGN KEY (bank_id) REFERENCES banks (id)
      );
    """);

    await database.execute("""
      CREATE TABLE IF NOT EXISTS categories (
        id INTEGER NOT NULL,
        name VARCHAR NOT NULL UNIQUE,
        description VARCHAR,
        max_amount DECIMAL(15, 2) DEFAULT 0,
        color INTEGER NOT NULL,
        icon VARCHAR NOT NULL,
        icon_category VARCHAR NOT NULL,
        expenses INTEGER NOT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        deleted_at DATETIME,
        PRIMARY KEY (id AUTOINCREMENT)
      );
    """);

    await database.execute("""
      CREATE TABLE IF NOT EXISTS subcategories (
        id INTEGER NOT NULL,
        name VARCHAR NOT NULL,
        icon VARCHAR,
        icon_category VARCHAR,
        color INTEGER NOT NULL,
        max_amount DECIMAL(12, 2) DEFAULT 0,
        category_id INTEGER NOT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        deleted_at DATETIME,
        PRIMARY KEY (id AUTOINCREMENT),
        FOREIGN KEY (category_id) REFERENCES categories (id)
      );
    """);

    await database.execute("""
      CREATE TABLE IF NOT EXISTS transaction_types (
        id INTEGER NOT NULL,
        name VARCHAR NOT NULL
      );
    """);

    await database.execute("""
      CREATE TABLE IF NOT EXISTS transactions (
        id INTEGER NOT NULL,
        category_id INTEGER NOT NULL,
        subcategory_id INTEGER,
        transaction_type_id INTEGER NOT NULL,
        account_id INTEGER NOT NULL,
        title VARCHAR,
        description VARCHAR,
        amount FLOAT NOT NULL,
        transaction_approved BOOLEAN DEFAULT 1,
        transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id AUTOINCREMENT),
        FOREIGN KEY (category_id) REFERENCES categories (id),
        FOREIGN KEY (subcategory_id) REFERENCES subcategories (id),
        FOREIGN KEY (account_id) REFERENCES accounts (id),
        FOREIGN KEY (transaction_type_id) REFERENCES transaction_types (id)
      );
    """);

    await database.execute("""
      CREATE TABLE IF NOT EXISTS budgets (
        id INTEGER NOT NULL,
        currency_id INTEGER NOT NULL,
        amount FLOAT NOT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id AUTOINCREMENT),
        FOREIGN KEY (currency_id) REFERENCES currencies (id)
      );
    """);

    await database.execute("""
      CREATE TABLE IF NOT EXISTS subscription_types (
        id INTEGER NOT NULL,
        name VARCHAR NOT NULL,
        repeat_days INTEGER NOT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id AUTOINCREMENT)
      );
    """);

    await database.execute("""
      CREATE TABLE IF NOT EXISTS subscriptions (
        id INTEGER NOT NULL,
        category_id INTEGER NOT NULL,
        subcategory_id INTEGER NOT NULL,
        subscription_type_id INTEGER NOT NULL,
        title VARCHAR NOT NULL,
        description VARCHAR NOT NULL,
        number INTEGER NOT NULL,
        hour DATETIME,
        initial_date DATETIME DEFAULT CURRENT_TIMESTAMP,
        finish_date DATETIME,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id AUTOINCREMENT),
        FOREIGN KEY (category_id) REFERENCES categories (id),
        FOREIGN KEY (subcategory_id) REFERENCES subcategories (id),
        FOREIGN KEY (subscription_type_id) REFERENCES subscription_types (id)
      );
    """);
  }
}
