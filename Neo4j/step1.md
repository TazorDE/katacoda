# Start Neo4j database in a Docker container

Um Neo4j zu nutzen wird eine Instanz der Datenbank benötigt.
Das von Neo4j bereitgestellte Docker-Container-Image genügt hierzu.
Dieses Image erlaubt es, eine Instanz der Datenbank zu starten, ohne dass eigene Docker-Komponenten erstellt werden müssen.
Auch kann es mit nur einem Kommandozeilenbefehl installiert und gestartet werden.
Dieser Kommandozeilenbefehl wird mit Befehlsattributen versehen, die dem Container einen Namen, Ports und Authentifizierungsdaten zuweisen.
Die Authentifizierungsdaten sind nicht notwendig, wenn nur eine einfache Anmeldung benötigt wird.

`docker run -d --log-driver=none --name neo4j -p 7474:7474 -p 7687:7687 --env NEO4J_AUTH=none neo4j:latest`{{execute}}

Mit dem Befehl `docker ps`{{execute}} kann die Liste der aktiven Docker-Instanzen anzeigt werden.
So wird verifiziert, dass die Instanz gestartet wurde.

Gehe auf die nächste Seite, wenn sichergestellt ist, dass der Docker-Container gestartet ist.