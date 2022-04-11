# CSV formatierte Daten einlesen

Nun befinden wir uns in der Cypher Shell.
Laden wir also die CSV-Datei und nutzen die darin enthaltenen Daten um die Datenbank zu füllen.
Wir laden die Daten von einer externen URL und nutzen den "LOAD CSV"-Befehl um die Daten in die Datenbank zu laden.
Desweiteren werden die Daten weiter auseinander genommen und mit Relationen verbunden.

    []: # Language: cypher

`LOAD CSV WITH HEADERS FROM 'https://malteteichert.de/files/netflix_titles.csv' AS line CREATE (:Media {type: line.type, title: line.title, director: line.director, cast: line.cast, release_year: toInteger(line.release_year), rating: line.rating, duration: line.duration});CREATE INDEX ON :Media(release_year);MATCH (m:Media) WHERE m.rating IS NOT NULL WITH DISTINCT m.rating as rating CREATE (:Rating {type: rating});MATCH (m:Media) WHERE m.director IS NOT NULL WITH DISTINCT m.director as director CREATE (:Director {name: director});MATCH (m:Media), (r:Rating) WHERE m.rating = r.type CREATE (m)-[:RATED]->(r);MATCH (m:Media), (d:Director) WHERE m.director = d.name CREATE (d)-[:DIRECTED]->(m);`{{execute}}