# Datenbank

In der untenstehenden Graphik ist unsere Datenbank Struktur ersichtlich. Sie besteht aus zwei Tabellen, namentlich "loans", welche sämtliche Kredite enthält und "credit_packages", welche die verfügbaren Kredit Packete enthält.

![img](https://cdn.discordapp.com/attachments/973475824546230292/973572557070549042/unknown.png)

## ORM (Object Relational Mapper)

Unsere Tabellen werden von einem ORM automatisch aus Programmcode generiert. Die Tabellenschemas befinden sich [hier](https://github.com/3n3a-school/m307/blob/master/lib/m307/credit). Der ORM braucht zusätzlich zu unseren beiden Tabellen ("loans" und "credit_packages") noch eine eigene Tabelle, namens "schema_migrations", in denen er Schema Migrationen speichert. Sie hat aber ansonsten keine Funktion und kann ignoriert werden.

## Datenbank Dump

Um zu veranschaulichen, wie Daten in unserer Datenbank gespeichert werden, haben wir einen SQL Dump mit Beispieldaten erstellt. Die Datei kann in unserer GitHub Repository als Releases gefunden werden. [Hier geht's zu den Releases](https://github.com/3n3a-school/m307/releases)

