# CSV formatierte Daten einlesen

Nun befinden wir uns in der Cypher Shell.
Laden wir also die CSV-Datei und nutzen die darin enthaltenen Daten um die Datenbank zu füllen.
Wir laden die Daten von einer externen URL und nutzen den "LOAD CSV"-Befehl um die Daten in die Datenbank zu laden.

`LOAD CSV WITH HEADERS FROM 'https://malteteichert.de/files/netflix_titles.csv' AS line CREATE (:Media {type: line.type, title: line.title, director: line.director, cast: line.cast, release_year: toInteger(line.release_year), rating: line.rating, duration: line.duration});`{{execute}}

# Daten weiterverarbeiten und verbinden

## Index erstellen
Nun wird ein Index erstellt, der die Daten nach einem bestimmten Attribut sortiert.
Dieses Attribut ist hierbei das Jahr der Erscheinung.
Ein Index erhöht die Geschwindigkeit der Suche und sollte auf Attribute angewendet werden, die oft gesucht werden.
`CREATE INDEX ON :Media(release_year);`{{execute}}

## erstelle distinct rating Nodes
Nun werden alle "Media"-Nodes nach dem Rating aufgeteilt.
Hierbei werden alle Rating-Einträge auf einzigartige Einträge gekürzt.
Diese Einträge werden als "Rating"-Nodes in der Datenbank gespeichert.
`MATCH (m:Media) WHERE m.rating IS NOT NULL WITH DISTINCT m.rating as rating CREATE (:Rating {type: rating});`{{execute}}

## erstelle distinct director Nodes
Der gleiche Vorgang wird auch für die Regisseure ausgeführt.
`MATCH (m:Media) WHERE m.director IS NOT NULL WITH DISTINCT m.director as director CREATE (:Director {name: director});`{{execute}}

## alle cast-Einträge als einzigartige Nodes erstellen
Die Cast-Einträge enthalten mehrere Personen.
Diese werden getrennt und als einzelne Nodes in der Datenbank gespeichert.
`MATCH (m:Media) WITH DISTINCT m.cast as cast UNWIND cast as data WITH split(data, ',') as split WITH `{{execute}}
ish funktioniert nicht ganz: MATCH (m:Media) WITH DISTINCT m.cast as cast UNWIND cast as data WITH split(data, ',') as split WITH [] AS list WITH UNWIND split AS char SET list = list + char RETURN list

## verbinde Media mit Rating
Nun werden alle "Media"-Nodes mit den zugehörigen "Rating"-Nodes verbunden.
Wenn die "Media"-Node ein rating äquivalent zu einer "Rating"-Node enthält, wird die Verbindung erstellt.
`MATCH (m:Media), (r:Rating) WHERE m.rating = r.type CREATE (m)-[:RATED]->(r);`{{execute}}

## verbinde Director mit Media
Dieser Prozess wird auch für die Regisseure ausgeführt.
Hier werden die Regisseurnamen verglichen und bei Übereinstimmungen wird die Verbindung erstellt.
`MATCH (m:Media), (d:Director) WHERE m.director = d.name CREATE (d)-[:DIRECTED]->(m);`{{execute}}