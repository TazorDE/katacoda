# Der Datensatz

Diese Neo4j Fallstudie enthält eine bereinigte Kopie des [Netflix Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/netflix-shows) Datensatzes von Shivam Bansal im Stand vom 11. April 2022.

Schauen wir uns einmal die ersten drei Zeilen dieser an:

`sed -n 1,3p csvs/netflix_titles.csv`{{execute}}

Nun können wir das Terminal bereinigen.

`clear`{{execute}}

# Die Datenbank

open cypher shell in docker container
`docker exec -it bin/cypher-shell`{{execute}}