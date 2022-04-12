# Komplexere Abfragen
## 1. Abfrage
Um eine Liste von allen Filmen, die mit "R" bewertet sind zu erhalten kann man eine Abfrage der Node mit dem Typ "R" erstellen, die zusätzlich noch alle Nodes ausgibt, die eine direkte Verbindung zur ursprünglichen Node haben.

`MATCH (r:Rating {type: "R"})-[*0..1]-(media) RETURN DISTINCT media;`{{execute}}

Aufgrund der technischen Limitierungen von Katacoda können die Ergebnisse dieser Abfrage nicht als Graph dargestellt werden.
Als Graph würde das Ergebnis folgendermaßen aussehen:

![Graph Darstellung der vorangegangenen Abfrage](https://github.com/TazorDE/katacoda/blob/main/Neo4j/images/r-graph.png?raw=true)

## 2. Abfrage
Um herauszufinden wie viele Medien eines Regisseurteams auf der Plattform veröffentlicht sind, müssen diese gezählt werden.
Hierbei werden für jedes Regisseurteam die Medien mit Hilfe der Funktion `count()` gezählt und diese werden mit dem `ORDER BY`-Konstrukt sortiert.
Dabei wird das Schlüsselwort `DESC` verwendet, um die Anzahl der Filme in absteigender Reihenfolge zu sortieren.
Das Gegenstück zu `DESC` wäre `ASC` um die Ergebnisse aufsteigend zu sortieren.

`MATCH (d:Director)-[:DIRECTED]->(m) RETURN d.name, count(*) AS strength ORDER BY strength DESC;`{{execute}}

Das Ergebnis dieser Abfrage zeigt, dass das Regisseurpaar bestehend aus Raúl Campos und Jan Suter mit 18 Medien am häufigsten in der Datenbank vorkommt.

## 3. Abfrage
Jetzt verbinden wir diese beiden Abfragen um das Regisseurteam zu finden das am häufigsten Medien produziert hat, die mit "R" bewertet wurden. Dabei limitieren wir mit Hilfe des `LIMIT`-Schlüsselwortes die Ausgabe der Ergebnisse auf die ersten 3 Einträge.

`MATCH (m:Media {rating:"R"})<-[:DIRECTED]-(d) RETURN d.name, count(*) AS number ORDER BY number DESC LIMIT 3;`{{execute}}

Dies liefert das Ergebnis, dass Martin Scorsese mehr Filme auf Netflix mit "R"-Rating hat als Quentin Tarantino und David Fincher.
Um alle Filme von Martin Scorsese zu finden, wird das vorangegangene Statement um eine Filterung nach dem Regisseur "Martin Scorsese" ergänzt.

`MATCH (m:Media {rating:"R"})<-[:DIRECTED]-(d:Director {name: "Martin Scorsese"}) RETURN m, d;`{{execute}}

Das Ergebnis sieht in Graphdarstellung folgendermaßen aus:

![Graph Darstellung der vorangegangenen zu Martin Scorsese](https://github.com/TazorDE/katacoda/blob/main/Neo4j/images/martin-scorsese.png?raw=true)

Diese etwas komplexeren Abfragen sind auch die häufigsten Fälle bei der Interaktion mit der Datenbank.
Es gibt jedoch noch sehr viel komplexere Konstrukte, die mit Listen und verschachtelten Daten Arbeiten.