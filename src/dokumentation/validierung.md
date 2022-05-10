# Validierung

| Formular           | Feld           | Validierung                                                  |
| ------------------ | -------------- | ------------------------------------------------------------ |
| Create/Edit Kredit | Name           | required, trim,                                              |
| Create/Edit Kredit | Email          | required, trim, contains '@'                                 |
| Create/Edit Kredit | Phone          | trim, regular expression                                     |
| Create Kredit      | Rate Count     | >= 1 and <= 10                                               |
| Create/Edit Kredit | Credit package | required, kann nur ein gültiges Credit package sein, welches in der credit_packages Tabelle aufgeführt ist |
| Edit Kredit        | Status         | required, kann nur open oder closed closed sein (enum type)  |

