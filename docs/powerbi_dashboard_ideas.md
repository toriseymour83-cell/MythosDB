# MythosDB Power BI Dashboard Ideas

This document outlines possible Power BI dashboard pages using the MythosDB dataset.

---

## Page 1: Dataset Overview

Purpose: provide a summary of the dataset.

Suggested visuals:

- total characters
- total works
- total authors
- total locations
- total events
- character count by type
- works by genre
- locations by type
- mythological vs geographical locations

Suggested slicers:

- character type
- gender
- source culture
- genre
- mythological location status

Suggested fields:

```text
characters.character_type
characters.gender
works.genre
works.source_culture
locations.location_type
locations.mythological
```

---

## Page 2: Character Explorer

Purpose: explore individual gods, heroes, mortals, monsters, rulers, and other figures.

Suggested visuals:

- character details table
- character aliases
- works featuring selected character
- events involving selected character
- relationships involving selected character
- crimes and punishments linked to selected character

Suggested fields:

```text
characters.name
characters.character_type
characters.domain
characters.gender
character_aliases.alias_name
character_appearances.role
character_appearances.importance
events.event_name
relationships.relationship_type
```

Example questions:

- Which works does Athena appear in?
- Which characters are connected to Zeus?
- Which characters have Roman equivalents?
- Which characters are linked to the most events?

---

## Page 3: Works and Authors

Purpose: analyse source texts and their authors.

Suggested visuals:

- works by author
- works by genre
- works by source culture
- character appearances per work
- locations per work
- works by estimated date or period

Suggested fields:

```text
works.title
works.genre
works.estimated_date
works.source_culture
authors.name
authors.period
authors.primary_genre
```

Example questions:

- Which author has the most works in the dataset?
- Which works include the most characters?
- Which works are Greek and which are Roman?
- Which works are linked to the most locations?

---

## Page 4: Mythological Map

Purpose: explore geographical and mythological locations.

Suggested visuals:

- map of locations with coordinates
- table of locations without coordinates
- location count by region
- events by location
- characters by origin location
- works linked to selected location

Important note:

Some locations are mythological, symbolic, uncertain, or not tied to a modern geographical point. These records may not have latitude and longitude values.

Suggested filter for mapped visuals:

```text
locations.mythological = FALSE
```

Suggested fields:

```text
locations.name
locations.modern_equivalent
locations.location_type
locations.latitude
locations.longitude
locations.region
```

Example questions:

- Which real locations appear most often?
- Which mythological locations cannot be mapped?
- Which works are linked to Troy?
- Which characters are linked to Thebes?

---

## Page 5: Events Timeline

Purpose: explore major mythological events and episodes.

Suggested visuals:

- event list
- events by type
- events by primary location
- characters involved in selected event
- source work for selected event
- crimes and punishments linked to selected event

Suggested fields:

```text
events.event_name
events.event_type
events.estimated_period
events.summary
locations.name
works.title
event_characters.event_role
```

Example questions:

- Which events are linked to Troy?
- Which characters appear in the most events?
- Which events involve revenge?
- Which events involve divine punishment?

---

## Page 6: Relationships

Purpose: explore relationships between characters.

Suggested visuals:

- relationship table with source and target character names
- relationship count by type
- relationship count by category
- family relationships
- conflict relationships
- alliance relationships

Suggested fields:

```text
relationships.source_character_id
relationships.target_character_id
relationships.relationship_type
relationship_types.category
relationship_types.description
relationships.notes
```

Example questions:

- Who are the recorded children of Zeus?
- Which characters are enemies?
- Which characters are linked by family relationships?
- Which characters are linked by conflict relationships?

---

## Page 7: Crimes and Punishments

Purpose: explore the optional modern legal comparison table.

Suggested visuals:

- count of records by `likely_illegal_today`
- average severity rating by character
- severity rating by mythological category
- alleged actions table
- modern UK equivalent table
- events linked to serious offences

Suggested cards:

- number likely illegal today
- number legally unclear
- highest severity rating
- average severity rating

Suggested fields:

```text
crimes_and_punishments.alleged_action
crimes_and_punishments.mythological_category
crimes_and_punishments.modern_uk_equivalent
crimes_and_punishments.likely_illegal_today
crimes_and_punishments.severity_rating
```

Example questions:

- Which actions would likely be illegal today?
- Which cases are legally ambiguous?
- Which characters have the highest average severity rating?
- Which events involve revenge or abduction?

Important note:

The modern UK law comparison is simplified and included for data analysis only. It is not legal advice.

---

## Page 8: Data Quality and Uncertainty

Purpose: show uncertainty, missing values, and source confidence.

Suggested visuals:

- source references by confidence level
- records with missing coordinates
- records with uncertain modern equivalents
- works with disputed or attributed authorship
- characters with multiple aliases
- relationship types by category

Suggested fields:

```text
source_references.confidence_level
source_references.entity_type
sources.reliability_note
locations.latitude
locations.longitude
character_aliases.alias_name
```

Example questions:

- Which records have medium or disputed confidence?
- Which places cannot be mapped?
- Which characters have multiple aliases?
- Which relationships are difficult to classify?

---

## Suggested Measures

```DAX
Character Count = COUNTROWS(characters)
```

```DAX
Work Count = COUNTROWS(works)
```

```DAX
Author Count = COUNTROWS(authors)
```

```DAX
Location Count = COUNTROWS(locations)
```

```DAX
Event Count = COUNTROWS(events)
```

```DAX
Relationship Count = COUNTROWS(relationships)
```

```DAX
Average Crime Severity = AVERAGE(crimes_and_punishments[severity_rating])
```

```DAX
Likely Illegal Count =
CALCULATE(
    COUNTROWS(crimes_and_punishments),
    crimes_and_punishments[likely_illegal_today] = "TRUE"
)
```

```DAX
Unclear Legal Status Count =
CALCULATE(
    COUNTROWS(crimes_and_punishments),
    crimes_and_punishments[likely_illegal_today] = "UNCLEAR"
)
```

```DAX
Mythological Location Count =
CALCULATE(
    COUNTROWS(locations),
    locations[mythological] = TRUE()
)
```

---

## Suggested Dashboard Title

```text
MythosDB: Greek Mythology Data Explorer
```

Alternative titles:

```text
Greek Mythology Relationship Explorer
```

```text
Mythology Data Model Explorer
```

```text
Mythological Sources, Characters and Locations
```
