FSK 0 Filme sind uns aber zu langweilig.
Also zeigen wir nun alle Filme an die mit "R" bewertet sind.

`MATCH (r:Rating {type: "R"})-[*0..1]-(media) RETURN DISTINCT media;`{{execute}}

Aufgrund der technischen Limitierungen von Katacoda werden die Ergebnisse dieser Abfrage nicht als Graph dargestellt.
Als Graph würde das Ergebnis so aussehen:
![Graph Darstellung der vorangegangenen Abfrage](https://github.com/TazorDE/katacoda/blob/main/Neo4j/images/r-graph.png?raw=true)

Betrachten wir nun wie viele Medien eines Regisseurs/Regisseurpaars in der Datenbank sind.

`MATCH (d:Director)-[:DIRECTED]->(m) RETURN d.name, count(*) AS strength ORDER BY strength DESC`{{execute}}

Das Ergebnis dieser Abfrage zeigt, dass das Regisseurpaar bestehend aus Raúl Campos und Jan Suter mit 18 Medien am häufigsten in der Datenbank vorkommt.

Jetzt verbinden wir diese beiden Abfragen um den Regisseur zu finden der am häufigsten Medien produziert hat, die mit "R" bewertet wurden.
`MATCH (m:Media {rating:"R"})<-[:DIRECTED]-(d) RETURN d.name, count(*) AS number ORDER BY number DESC`{{execute}}

Dies liefert das Ergebnis, dass Martin Scorsese noch vor Quentin Tarantino liegt.
Also schauen wir uns alle Filme an, die Martin Scorsese produziert hat und die mit "R" bewertet wurden.
Dazu modifizieren wir das vorangegangene Statement um eine Filterung nach dem Regisseur.
`MATCH (m:Media {rating:"R"})<-[:DIRECTED]-(d:Director {name: "Martin Scorsese"}) RETURN m, d`{{execute}}

Das Ergebnis sieht in Graphdarstellung folgendermaßen aus:
![Graph Darstellung der vorangegangenen Abfrage](