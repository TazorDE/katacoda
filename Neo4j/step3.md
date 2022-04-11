# CSV formatierte Daten einlesen

Nun befinden wir uns in der Cypher Shell.
Laden wir also die CSV-Datei und nutzen die darin enthaltenen Daten um die Datenbank zu füllen.
Wir laden die Daten von einer externen URL und nutzen den "LOAD CSV"-Befehl um die Daten in die Datenbank zu laden.

`LOAD CSV WITH HEADERS FROM 'https://malteteichert.de/files/netflix_titles.csv' AS line CREATE (:Media {type: line.type, title: line.title, director: line.director, release_year: line.release_year, rating: line.rating, duration: line.duration});`{{execute}}