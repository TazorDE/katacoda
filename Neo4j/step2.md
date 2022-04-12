# Der Datensatz

Diese Neo4j Fallstudie enthält eine bereinigte Kopie des [Netflix Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/netflix-shows) Datensatzes von Shivam Bansal im Stand vom 11. April 2022.

Schauen wir uns einmal die erste Zeile dieser an um herauszufinden welche Spalten in diesem Datensatz enthalten sind.

`sed -n 1p csv/netflix_titles.csv`{{execute}}

Nun können wir das Terminal bereinigen.

`clear`{{execute}}

# Die Datenbank

Um mit der Datenbank zu interagieren nutzen wir die [Cypher Shell](https://neo4j.com/docs/operations-manual/current/tools/cypher-shell/).
Diese ist bereits im Docker container vorhanden.
Wir müssen nur die executable Datei aufrufen und uns mit dem Nutzernamen und Passwort authentifizieren, die wir in der Docker-Konfiguration festgelegt haben.

`docker exec -it neo4j bin/cypher-shell`{{execute}}

Wenn die Verbindung abgelehnt wird versuche es einfach noch einmal.
Im nächsten Schritt werden wir die Datenbank mit den Daten aus der CSV-Datei füllen.
Gehe dazu auf die nächste Seite.