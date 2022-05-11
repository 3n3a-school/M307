# Testfälle

## Manuelle Tests

### 1. Liste der Kreditverleihen

```
GEGEBEN SEI     Ich bin auf der `/loans` Route
WENN            Es Kredite auf in der Datenbank hat
DANN            Sehe ich alle Kredite von der Datenbank aufgelistet
```

### 2. Details eines Kreditverleihs

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

### 4. Bearbeiten eines Kreditverleihs

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

## 7.1 E-Mail Validierung
```
GEGEBEN SEI     Ich bin auf der `/loans/new` Route
WENN            Wenn ich alle Felder richtig ausfülle und im E-Mail Feld `lfnevoewio` eingebe 
DANN            Auf den `Save` Button drücke kommt eine Fehlermeldung
```

## 7.2 E-Mail Validierung
```
GEGEBEN SEI     Ich bin auf der `/loans/new` Route
WENN            Wenn ich alle Felder richtig ausfülle und im E-Mail Feld `kris@krishuber.xyz` eingebe 
DANN            Auf den `Save` Button drücke wird der Eintrag gespeichert
```

## 8.1 Telefonnummer Validierung
```
GEGEBEN SEI     Ich bin auf der `/loans/new` Route
WENN            Wenn ich alle Felder richtig ausfülle und im Telefonnummer Feld `7` eingebe 
DANN            Auf den `Save` Button drücke kommt eine Fehlermeldung
```

## 8.2 Telefonnummer Validierung
```
GEGEBEN SEI     Ich bin auf der `/loans/new` Route
WENN            Wenn ich alle Felder richtig ausfülle und im Telefonnummer Feld `0795236423` eingebe 
DANN            Auf den `Save` Button drücke wird der Eintrag gespeichert
```

## Automatisierte Tests mit Cypress

Zusätzlich zu unseren manuellen Tests, verwenden wir das Testing Framework Cypress, um unsere Seite automatisch zu testen. Sämtliche Testfälle sind [hier](https://github.com/3n3a-school/m307/tree/master/test/cypress/integration) in unserer GitHub Repository zu finden. Die Tests sind im Code bereits dokumentiert. Sie werden automatisch bei jedem Pull Request und bei jedem Push auf den master Branch ausgeführt. Ob die Tests erfolgreich sind oder nicht, ist am CI Badge im [README](https://github.com/3n3a-school/m307/blob/master/README.md) ersichtlich.

Der Continuous Integration Status Badge sieht wie folgt aus:

[![CI](https://github.com/3n3a-school/m307/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/3n3a-school/m307/actions/workflows/ci.yml)
