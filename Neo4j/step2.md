# Der Datensatz

Diese Neo4j Fallstudie enthält eine bereinigte Kopie des [Netflix Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/netflix-shows) Datensatzes von Shivam Bansal im Stand vom 11. April 2022.

Da sich die Datei am Standard-CSV-Format orientiert, stehen in der ersten Zeile die Spaltennamen.
Diese zu betrachten ist ein wichtiger Hinweis für die Verarbeitung.
Desweiteren ist es wichtig zu verstehen, in welchem Format die Daten gespeichert werden.

Um dies zu erreichen werden nun die ersten 3 Zeilen der Datei betrachtet:

`sed -n '1,3p' csv/netflix_titles.csv`{{execute}}

Auf Basis dieser Ansicht werden die Attribute ausgesucht, die in die Datenbank übernommen werden.
Da der Datensatz von vorneherein bereinigt ist, kann dieser ohne spezielle Maßnahmen in die Datenbank überführt werden.

Da das Terminal gefüllt ist können die bis jetzt durchgeführten Schritte ausgeblendet werden.

`clear`{{execute}}

# Das Graphdatenbankkonzept
Graphdatenbanken basieren auf Eigenschaftsgraphen.
Diese Graphen bestehen aus Nodes (Objekten) und Relationships (Beziehungen).

Nodes sind in Neo4j diskrete Objekte, die über Labels (Kennzeichnungen) kategorisiert werden können.
Relationships beschreiben Verbindungen zwischen Objekten.
Sie haben immer eine Richtung und einen Typ.
Nodes und Relationships können auch Eigenschaften in Form von Schlüssel-Wert-Paaren besitzen.

Der folgende Beispielgraph stellt diese Eigenschaften dar:

![Beispieldarstellung eines Eigenschaftsgraphen](https://neo4j.com/docs/getting-started/current/_images/graph_simple.svg)


# Die Datenbank

Die [Cypher Shell](https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/) bietet eine einfache Schnittstelle zur Datenbank.
Diese ist bereits im Docker-Container vorhanden.
Um auf diese zuzugreifen muss über den `docker exec`-Befehl auf den Docker-Container zugegriffen und die ausführbare Datei `cypher-shell` gestartet werden.

`docker exec -it neo4j bin/cypher-shell`{{execute}}

Dabei kann es vorkommen, dass der Zugriff abgelehnt wird.
In diesem Fall genügt es den obigen Befehl erneut auszuführen.

Sobald die Cypher-Shell gestartet ist, geht es auf der nächsten Seite weiter.