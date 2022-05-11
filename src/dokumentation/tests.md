# Testfälle



## 1. Liste der Kreditverleihen

```
GEGEBEN SEI     Ich bin auf der `/loans` Route
WENN            Es Kredite auf in der Datenbank hat
DANN            Sehe ich alle Kredite von der Datenbank aufgelistet
```

## 2. Details eines Kreditverleihs

```
GEGEBEN SEI     Ich bin auf der `/loans` Route
WENN            Es Kredite auf in der Datenbank hat
DANN            Sehe ich die Informationen in der Liste
```

## 3. Schliessen eines Kreditverleihs

```
GEGEBEN SEI     Ich bin auf der `/loans` Route
WENN            Es Kredite auf in der Datenbank hat
DANN            Wenn ich auf den Close Button drücke, kommt ein bestätigungs Dialog, wenn ich bestätige wird der Kredit geschlossen.
```

## 4. Bearbeiten eines Kreditverleihs

```
GEGEBEN SEI     Ich bin auf der `/loans` Route
WENN            Es Kredite auf in der Datenbank hat
DANN            Wenn ich auf den Edit Button drücke, werde ich auf das editierungs Formular weitergeleitet
```

## 5. Hinzufügen eines Kreditverleihs 
```
GEGEBEN SEI     Ich bin auf der `/loans` Route
WENN            Ich auf den `New Loan` Button drücke
DANN            Öffnet sich ein Formular, in welchem eine neue Hypothek erstellt werden kann
```

## 6. Falsche Route wurde ausgewählt
```
GEGEBEN SEI     Ich verbinde auf eine falsche Route
WENN            die Route nicht im Router enthalten ist
DANN            werde ich ohne Fehlermeldung auf die Dashboardseite zurückgesendet
```
