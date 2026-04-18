```mermaid

classDiagram
direction BT
class componente {
int id\_tip
varchar(100) numar\_oem
varchar(100) producator
text descriere
decimal(6,2) tensiune\_v
decimal(6,2) curent\_a
decimal(8,2) putere\_w
decimal(10,2) pret\_eur
int stoc\_disponibil
timestamp created\_at
timestamp updated\_at
int id\_componenta
}
class componentemotoare {
int id\_componenta
int id\_motor
text note
timestamp updated\_at
int id
}
class crossreferences {
int id\_componenta
varchar(100) aftermarket\_number
varchar(100) producator\_aftermarket
int id
}
class marci {
varchar(100) nume
int id\_marca
}
class modele {
int id\_marca
varchar(100) nume\_model
varchar(50) generatie
year an\_start
year an\_sfarsit
int id\_model
}
class motoare {
int id\_model\_referinta
int id\_combustibil
varchar(50) cod\_motor
int capacitate\_cm3
int putere\_cp
int cuplu\_nm
varchar(20) standard\_emisii
year an\_start
year an\_sfarsit
int id\_motor
}
class motormodele {
int id\_motor
int id\_model
int id
}
class tipuricombustibil {
varchar(30) nume
int id\_combustibil
}
class tipuricomponente {
varchar(100) nume
varchar(100) sistem
int id\_tip
}

componente  -->  tipuricomponente : id\_tip
componentemotoare  -->  componente : id\_componenta
componentemotoare  -->  motoare : id\_motor
crossreferences  -->  componente : id\_componenta
modele  -->  marci : id\_marca
motoare  -->  modele : id\_model\_referinta:id\_model
motoare  -->  tipuricombustibil : id\_combustibil
motormodele  -->  modele : id\_model
motormodele  -->  motoare : id\_motor

```

