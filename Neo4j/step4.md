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

Wollen wir nur den Film "Die Wilden Kerle" in der Datenbank finden, so muss nur nach dem Namen gefiltert werden.
Das `WHERE`-Statement wird dazu verwendet.
` MATCH (m:Media) WHERE m.name = "Die Wilden Kerle" RETURN m;`{{execute}}

Dies sind die Grundlagen für alle Anfragen an die Datenbank.

