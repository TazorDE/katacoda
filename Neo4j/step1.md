# Start Neo4j database in a Docker container

Um Neo4j zu nutzen benötigen wir eine Instanz der Datenbank.
Wir nutzen das von Neo4j zur Verfügung gestellte Docker-Image.
Dieses Image erlaubt es, eine Instanz der Datenbank zu starten, ohne dass wir eigene Docker-Komponenten erstellen müssen.
Auch kann es so mit nur einem Kommandozeilenbefehl installiert und gestartet werden.

`docker run -d --log-driver=none --name neo4j -p 7474:7474 -p 7687:7687 --env NEO4J_AUTH=neo4j/securepw neo4j:latest`{{execute}}

Mit dem Befehl `docker ps`{{execute}} können wir die Liste der aktiven Docker-Instanzen anzeigen.
So wird verifiziert, dass die Instanz gestartet wurde.