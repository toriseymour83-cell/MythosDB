# CSV Quality Checks

This document explains basic checks to run when adding or editing MythosDB CSV files.

CSV files rely on consistent structure. Each row must contain the same number of fields as the header row.

---

## 1. Check the Number of Columns

Every row in a CSV file must have the same number of columns as the header row.

Example:

```csv
author_id,name,notes
1,Homer,Traditional author of the Iliad and Odyssey
```

This has 3 columns.

This is broken:

```csv
author_id,name,notes
1,Homer,Traditional author of the Iliad, Odyssey, and other works
```

The commas inside the note make the row appear to have extra columns.

Correct version:

```csv
author_id,name,notes
1,Homer,"Traditional author of the Iliad, Odyssey, and other works"
```

---

## 2. Put Quotes Around Fields with Commas

Use quotation marks when a field contains commas.

```csv
character_id,name,notes
1,Zeus,"King of the gods, father of many figures, and ruler of Olympus"
```

---

## 3. Keep Column Names Consistent

Use the exact same column names across the dataset and documentation.

Use:

```text
character_id
work_id
location_id
event_id
```

Avoid inconsistent alternatives such as:

```text
characterID
character_id_number
Character ID
```

---

## 4. Use Blank Fields Carefully

Blank fields are allowed.

Example:

```csv
character_id,name,roman_name
55,Aeneas,
```

This means Aeneas has no value entered in the `roman_name` field.

Preferred values for unknown or uncertain fields include:

```text
Unknown
Unclear
Not applicable
```

Use these consistently where a blank field would be unclear.

---

## 5. Use Consistent TRUE/FALSE Values

For Boolean fields, use:

```text
TRUE
FALSE
```

Example:

```csv
location_id,name,mythological
1,Mount Olympus,FALSE
21,Hades/Underworld,TRUE
```

---

## 6. Use Negative Numbers for BCE Years

For estimated ancient dates:

```text
-800 = 800 BCE
-43 = 43 BCE
17 = 17 CE
```

Example:

```csv
author_id,name,estimated_birth_year,estimated_death_year
1,Homer,-800,-701
27,Ovid,-43,17
```

---

## 7. Check Foreign Keys

Many tables link to other tables using ID fields.

For example:

```text
characters.origin_location_id
```

should match:

```text
locations.location_id
```

Before adding new records, check that the linked ID exists.

Example:

```csv
character_id,name,origin_location_id
46,Odysseus,3
```

This works only if location ID `3` exists in `locations.csv`.

---

## 8. Avoid Duplicate IDs

Each table should have unique IDs.

This is incorrect:

```csv
character_id,name
1,Zeus
1,Hera
```

Correct version:

```csv
character_id,name
1,Zeus
2,Hera
```

---

## 9. Keep Text Fields Simple

Avoid unnecessary commas, line breaks, or quotation marks inside text fields.

Preferred:

```csv
notes
King of the Olympian gods
```

More complex text may require careful quoting:

```csv
notes
"King of the gods, ruler of Olympus, and father of many heroes"
```

---

## 10. Check GitHub CSV Preview

GitHub can preview CSV files as tables.

If GitHub displays an error such as:

```text
We can make this file beautiful and searchable if this error is corrected
```

then one or more rows probably has the wrong number of columns.

The most common cause is an unquoted comma inside a text field.

---

## 11. Recommended Manual Check

Before committing a CSV file:

1. Check the header row.
2. Check that every row has the same number of fields.
3. Search for commas inside notes or descriptions.
4. Put quotes around fields that contain commas.
5. Check that IDs are unique.
6. Check that linked IDs exist in the relevant parent table.
7. Preview the file in GitHub after committing.

---

## 12. Suggested Commit Message

```text
Replace CSV quality checks with neutral version
```

---

## Quick Rule

If a field contains a comma, wrap the whole field in quotation marks.
