# CSV formatierte Daten einlesen

In der Cypher Shell können nun die CSV-Daten geladen und in die Datenbank eingelesen werden.
Der `LOAD CSV`-Befehl wird genutzt um die CSV aus einer externen URL mit Kopfdaten zu laden und für jeden Datensatz eine neue Node zu erzeugen.

`LOAD CSV WITH HEADERS FROM 'https://malteteichert.de/files/netflix_titles.csv' AS line CREATE (:Media {type: line.type, title: line.title, director: line.director, cast: line.cast, release_year: toInteger(line.release_year), rating: line.rating, duration: line.duration});`{{execute}}

# Daten weiterverarbeiten und verbinden
## Index erstellen
Nun wird ein Index erstellt, der die Daten nach einem bestimmten Attribut indiziert.
Dieses Attribut ist hierbei das Jahr der Erscheinung.
Ein Index erhöht die Geschwindigkeit der Suche und sollte auf Attribute angewendet werden, die oft gesucht werden.

Testen wir nun einmal die Abfragegeschwindigkeit vor dem Index.
`MATCH (m:Media) WHERE m.release_year=2016 RETURN m;`{{execute}}

Diese erste Abfrage benötigt ca. 242 ms um die Daten zu laden.

`CREATE INDEX ON :Media(release_year);`{{execute}}

`MATCH (m:Media) WHERE m.release_year=2016 RETURN m;`{{execute}}

Nach erstellen des Indexes wird die Dauer der Abfrage auf stark verkürzt.
Attribute nach denen oft gefiltert wird sollten entsprechend in einem Index verwaltet werden.

## Rating Nodes
Nun werden alle "Media"-Nodes nach dem Rating aufgeteilt.
Rating beschreibt in diesem Datensatz die Altersfreigabe des Mediums.
Aus diesen Rating-Einträgen werden alle Duplikate gekürzt.
Diese einzigartigen Einträge werden als "Rating"-Nodes in der Datenbank gespeichert.

`MATCH (m:Media) WHERE m.rating IS NOT NULL WITH DISTINCT m.rating as rating CREATE (:Rating {type: rating});`{{execute}}

## Regisseur Nodes
Dieser Vorgang wird auch für die Regisseure ausgeführt.

`MATCH (m:Media) WHERE m.director IS NOT NULL WITH DISTINCT m.director as director CREATE (:Director {name: director});`{{execute}}

## Media-Rating Beziehung
Nun werden alle "Media"-Nodes mit den zugehörigen "Rating"-Nodes verbunden.
Das heißt, wenn die "Media"-Node ein rating äquivalent zu einer "Rating"-Node enthält, wird eine Verbindung zwischen den beiden erstellt.

`MATCH (m:Media), (r:Rating) WHERE m.rating = r.type CREATE (m)-[:RATED]->(r);`{{execute}}

## Director-Media Beziehung
Dieser Prozess wird auch für die Regisseure ausgeführt.
Hier werden die Regisseurnamen verglichen und bei Übereinstimmungen wird die Verbindung erstellt.

`MATCH (m:Media), (d:Director) WHERE m.director = d.name CREATE (d)-[:DIRECTED]->(m);`{{execute}}

Die vorangegangenen Anfragen haben nun ein nutzbares Datenset erstellt.
An dieser Stelle können weitere Indices angelegt werden, diese sind jedoch für das Datenmodell nicht notwendig.
Auf der nächsten Seite werden noch einmal die Grundlagen der Abfragesprache von Neo4j dargestellt.