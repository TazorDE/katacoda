
Herzlichen Glückwunsch!
Dies waren die Grundlagen von Neo4j und der Abfragesprache Cypher.

- Aufsetzen der Datenbank
- Erstellen von Daten
- Abfragen von Daten

## Wie ist Neo4j in der Praxis und im Data Warehouse einzusetzen?
Aufgrund der möglichkeit viele komplexe Beziehungen abzubilden und zu verwalten, werden Graph-Datenstrukturen oft für Projekte wie soziale Netzwerke eingesetzt.
Dies bietet die Möglichkeit Beziehungen zwischen Nutzern akkurat abzubilden und diesen Nutzern auf Basis ihrer Beziehungen weitere Vorschläge für neue Beziehungen anzubieten.

Im Bezug auf Data Warehouse bietet sich Neo4j an um bestehende Daten, wie beispielsweise Stammdaten, weiter zu verarbeiten.
Wenn Stammdaten wie im Beispiel eine Datenbank von Filmen und TV-Shows sind, kann auf Basis der dazugehörigen Informationen ein komplexes Informationssystem erstellt werden.
Dies umgeht schlechte Implementierungen, wie in den Vorlesungsunterlagen zu Datenmodellierung beispielhaft dargestellt, die es erschweren an Informationen zu kommen, die beispielsweise sonst nur durch komplexe SQL-Abfragen erlangt werden können.

Neo4j eignet sich in diesem Kontext besonders für das Data Mart Layer, da bei komplexen Abfragen hohe Performance ohne join-Tables erreicht werden kann.

## Nächste Schritte
Ein weiterer Schritt um das gelernte zu vertiefen, wäre es die bereits in der Datenbank vorhandenen "cast"-Daten aus den Medien zu extrahieren und in eigene Nodes zu speichern und diese passend mit den Medien zu verbinden.
Dazu ist es hilfreich sich die String- und Listen-Funktionen in der [Cypher-Dokumentation](https://neo4j.com/docs/cypher-manual/current/) anzuschauen.

## Quellen
Die verwendeten Quellen sind:
- https://neo4j.com/docs/getting-started/current/graphdb-concepts/#graphdb-concepts (Konzepte von Graphdatenbanken)
- https://neo4j.com/docs/getting-started/current/cypher-intro/ (Grundlagen der Abfragesprache Cypher)
- Vorlesungsfolien zu Datentypen/kategorien und Datenmodellierung (S. 31-34, S. 40-41)
- https://hub.docker.com/_/neo4j/ (Docker-Container-Image für Neo4j, Bedienungsinformationen)
- https://www.kaggle.com/datasets/shivamb/netflix-shows (Datenursprung)