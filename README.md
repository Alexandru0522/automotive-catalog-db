# Automotive Catalog DB

A relational MySQL database for managing an automotive parts catalog — including car brands, models, engines, components, stock levels, and aftermarket cross-references.

Built as a personal project to practice relational database design, normalization, and SQL query writing.

---

## Features

- Full schema with 9 normalized tables and enforced foreign key relationships
- CHECK constraints for data integrity (e.g. year ranges, positive values)
- Aftermarket cross-reference tracking per OEM part number
- Engine-to-model many-to-many mapping via junction table
- Electrical component specs (voltage, current, wattage)
- Stock and pricing per component
- 9 analytical SQL queries covering compatibility, inventory, and reporting

---

## Database Schema

```
Marci ──────────────── Modele ──────── MotorModele ──── Motoare
                                                            │
                                               ┌───────────┤
                                               │           │
                                        TipuriCombustibil  │
                                                           │
Componente ──── ComponenteMotoare ─────────────────────────┘
    │
    ├── TipuriComponente
    └── CrossReferences
```

| Table | Description |
|---|---|
| `Marci` | Car brands |
| `Modele` | Models per brand, with generation and production years |
| `Motoare` | Engines with displacement, power, torque, emission standard |
| `MotorModele` | Many-to-many: engines shared across models |
| `TipuriCombustibil` | Fuel types (petrol, diesel, hybrid, electric, LPG) |
| `Componente` | Parts with OEM number, specs, price and stock |
| `TipuriComponente` | Part categories grouped by vehicle system |
| `ComponenteMotoare` | Compatibility: which parts fit which engines |
| `CrossReferences` | Aftermarket equivalents per OEM part |

---

## Sample Queries

| # | Query | Description |
|---|---|---|
| 1 | Compatible parts — 2.0 TDI | All parts for a specific engine |
| 2 | Full catalog overview | All brands, models, engines |
| 3 | Shared engines | Engines used in more than one model |
| 4 | Aftermarket cross-references | OEM vs aftermarket equivalents |
| 5 | Electrical components by wattage | Sorted by power consumption |
| 6 | Parts count per vehicle system | Coverage per system |
| 7 | Full catalog for Golf IV | All compatible parts for one model |
| 8 | Low stock alert | Parts with fewer than 10 units |
| 9 | Stock value per system | Total EUR value by vehicle system |

---

## Tech Stack

- **Database:** MySQL 9.6.0
- **Character set:** utf8mb4 / utf8mb4_unicode_ci
- **Language:** SQL (DDL + DML)

---

## How to Run

1. Make sure you have MySQL installed and running
2. Open your MySQL client (MySQL Workbench, DBeaver, DataGrip or terminal)
3. Run the files in order:

```sql
SOURCE schema.sql;
SOURCE seed_data.sql;
SOURCE queries.sql;
```

Or from the terminal:

```bash
mysql -u root -p < schema.sql
mysql -u root -p automotive_catalog < seed_data.sql
mysql -u root -p automotive_catalog < queries.sql
```

---

## Project Structure

```
automotive-catalog-db/
├── schema.sql       # CREATE DATABASE, tables, indexes
├── seed_data.sql    # INSERT statements with sample data
├── queries.sql      # 9 analytical SELECT queries
└── README.md        # This file
```

---

## Author

Made by Turcu Alexandru-Costin · [linkedin.com/in/alexandru-costin-turcu](https://www.linkedin.com/in/alexandru-costin-turcu-4a95311a6/)