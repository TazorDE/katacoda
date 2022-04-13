# Cypher Basics
Sollten Begrifflichkeiten nicht klar sein besteht die Möglichkeit, sich mit Hilfe der [Cypher-Refcard](https://neo4j.com/docs/cypher-refcard/current/) vertraut zu machen.

Cypher ist eine Abfragesprache für Neo4j.
Die Sprache ist speziell für Graphdatenbanken geeignet und basiert auf SQL, SPARQL, sowie auf iconografischen Konstrukten.
Durch die Schlüsselwörter und Struktur können so Anfragen generiert werden, die der englischen Sprache nahe stehen.

# Neue Einträge erstellen
Unter der Annahme, dass der Film "Die Wilden Kerle" zu der Netflix-Katalog und somit der Datenbank hinzugefügt werden soll, wird das `Create`-Statemetn von Cypher verwendet.
Dieses Statement erstellt einen neue "Media"-Node mit den Attributen des Films, die der DVD-Verpackung entnommen wurden.

`CREATE (:Media {name: "Die Wilden Kerle", director: "Joachim Masannek", release_year: 2003, duration: "94 min", rating: "FSK 0", type: "Movie", cast:"Jimi Blue Ochsenknecht, Raban Bieling, Sarah Kim Gries, Constantin Gastmann, Wilson Gonzalez Ochsenknecht, Marlon Wessel, Jonathan Beck"});`{{execute}}

Da der Film ein anderes Rating hat als die bisher existierenden Filme muss eine neue "Rating"-Node erstellt werden.

`CREATE (:Rating {type: "FSK 0"});`{{execute}}

# Neue Relationen erstellen
Dieses neue Rating muss jetzt noch mit allen Filmen mit "FSK 0"-Rating verbunden werden.
Wir nutzen das `MATCH`-Statement von Cypher um alle "Media"-Nodes mit dem Rating "FSK 0" zu finden.
Die gefundenen Nodes werden mit der "Rating"-Node verbunden.
Cypher nutzt für Relationen einen ASCII-Pfeil `-->`.
In der Mitte des Pfeils wird der Beziehungstyp der Relation angegeben.

`MATCH (m:Media) WHERE m.rating = "FSK 0" MATCH (r:Rating) WHERE r.type = "FSK 0" CREATE (m)-[:RATED]->(r);`{{execute}}

Nun wird das `MATCH`-Statement genutzt um die Verbindung zwischen den "Wilden Kerlen" und "FSK 0"-Rating zu anzuzeigen.
Hierbei werden alle Beziehungen von Medien zu dem "FSK 0"-Rating angezeigt.
Sollten nur die "Wilden Kerle" gesucht werden, muss das `WHERE`-Statement erweitert werden.

`MATCH (me:Media)-[re:RATED]->(ra:Rating) WHERE ra.type = "FSK 0" RETURN me AS Media, ra AS Rating;`{{execute}}

Dies sind die Grundlagen für alle Anfragen an die Datenbank.
Auf der nächsten Seite werden diese Konzepte weiter verdeutlicht.