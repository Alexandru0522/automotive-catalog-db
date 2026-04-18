classDiagram
direction BT
class componente {
   int id_tip
   varchar(100) numar_oem
   varchar(100) producator
   text descriere
   decimal(6,2) tensiune_v
   decimal(6,2) curent_a
   decimal(8,2) putere_w
   decimal(10,2) pret_eur
   int stoc_disponibil
   timestamp created_at
   timestamp updated_at
   int id_componenta
}
class componentemotoare {
   int id_componenta
   int id_motor
   text note
   timestamp updated_at
   int id
}
class crossreferences {
   int id_componenta
   varchar(100) aftermarket_number
   varchar(100) producator_aftermarket
   int id
}
class marci {
   varchar(100) nume
   int id_marca
}
class modele {
   int id_marca
   varchar(100) nume_model
   varchar(50) generatie
   year an_start
   year an_sfarsit
   int id_model
}
class motoare {
   int id_model_referinta
   int id_combustibil
   varchar(50) cod_motor
   int capacitate_cm3
   int putere_cp
   int cuplu_nm
   varchar(20) standard_emisii
   year an_start
   year an_sfarsit
   int id_motor
}
class motormodele {
   int id_motor
   int id_model
   int id
}
class tipuricombustibil {
   varchar(30) nume
   int id_combustibil
}
class tipuricomponente {
   varchar(100) nume
   varchar(100) sistem
   int id_tip
}

componente  -->  tipuricomponente : id_tip
componentemotoare  -->  componente : id_componenta
componentemotoare  -->  motoare : id_motor
crossreferences  -->  componente : id_componenta
modele  -->  marci : id_marca
motoare  -->  modele : id_model_referinta:id_model
motoare  -->  tipuricombustibil : id_combustibil
motormodele  -->  modele : id_model
motormodele  -->  motoare : id_motor
