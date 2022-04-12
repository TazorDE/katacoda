# Neue Einträge und Relationen erstellen
Der Film "Die Wilden Kerle" wurde kürzlich auf Netflix veröffentlicht und wir werden diesen nun in die Datenbank einfügen.
Dazu nutzen wir das `CREATE`-Statement von Cypher.
Dieses Statement erstellt einen neue "Media"-Node mit den Attributen des Films.
`CREATE (:Media {name: "Die Wilden Kerle", director: "Joachim Masannek", release_year: 2003, duration: "94 min", rating: "FSK 0", type: "Movie", cast:"Jimi Blue Ochsenknecht, Raban Bieling, Sarah Kim Gries, Constantin Gastmann, Wilson Gonzalez Ochsenknecht, Marlon Wessel, Jonathan Beck"});`{{execute}}

Da der Film ein anderes Rating hat als die bisher existierenden Filme wird eine neue "Rating"-Node erstellt.
`CREATE (:Rating {type: "FSK 0"});`{{execute}}

Dieses neue Rating muss jetzt noch mit allen Filmen mit "FSK 0"-Rating verbunden werden.
Wir nutzen das `MATCH`-Statement von Cypher um alle "Media"-Nodes mit dem Rating "FSK 0" zu finden.
Die gefundenen Nodes werden mit der "Rating"-Node verbunden.
Cypher nutzt für Relationen einen ASCII-Pfeil `-->`.
In der Mitte des Pfeils wird der Beziehungstyp der Relation angegeben.
`MATCH (m:Media) WHERE m.rating = "FSK 0" MATCH (r:Rating) WHERE r.type = "FSK 0" CREATE (m)-[:RATED]->(r);`{{execute}}

FSK 0 Filme sind uns aber zu langweilig.
Also zeigen wir nun alle Filme an die mit "R" bewertet sind.
`MATCH (r:Rating {type: "R"})-[*0..1]-(media) RETURN DISTINCT media;`{{execute}}

Aufgrund der technischen Limitierungen von Katacoda werden die Ergebnisse dieser Abfrage nicht als Graph dargestellt.
Als Graph würde das Ergebnis so aussehen:
![Graph Darstellung der vorangegangenen Abfrage](https://github.com/TazorDE/katacoda/blob/main/Neo4j/images/r-graph.png?raw=true)

Betrachten wir nun alle Filme in der Datenbank, die FSK 0 zertfiziert sind.
`MATCH (m:Media) WHERE m.rating = "FSK 0" RETURN m.name, m.rating, m.director, m.release_year, m.duration, m.cast;`{{execute}}

Die gesamte Datenbank in einem graphischen Tool zu betrachten wäre zu ressourcenintensiv.

Beginnen wir damit herauszufinden, welcher Regisseur wie viele Filme produziert hat.
`MATCH (d:Director)-[:DIRECTED]->(m) RETURN d.name, count(*) AS strength ORDER BY strength DESC`{{execute}}

In der Ergebnistabelle lässt sich erkennen dass Raúl Campos und Jan Suter gemeinsam die meisten Filme oder Serien produziert haben.
Appropos Filme oder Serien. Wie viele Filme und wie viele Serien existieren eigentlich in der Datenbank.