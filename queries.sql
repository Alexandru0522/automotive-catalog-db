SELECT
    c.numar_oem,
    c.producator,
    tc.nume      AS tip_componenta,
    tc.sistem    AS sistem_auto,
    m.cod_motor,
    c.pret_eur,
    c.stoc_disponibil
FROM ComponenteMotoare cm
JOIN Componente        c  ON cm.id_componenta = c.id_componenta
JOIN TipuriComponente  tc ON c.id_tip         = tc.id_tip
JOIN Motoare           m  ON cm.id_motor       = m.id_motor
WHERE m.cod_motor = '2.0TDI'
ORDER BY tc.sistem, tc.nume;

SELECT
    ma.nume      AS marca,
    mo.nume_model,
    mo.generatie,
    m.cod_motor,
    tc.nume      AS combustibil,
    m.putere_cp  AS cp
FROM Motoare m
JOIN TipuriCombustibil tc ON m.id_combustibil  = tc.id_combustibil
JOIN MotorModele       mm ON mm.id_motor        = m.id_motor
JOIN Modele            mo ON mm.id_model        = mo.id_model
JOIN Marci             ma ON mo.id_marca        = ma.id_marca
ORDER BY ma.nume, mo.nume_model;

SELECT
    m.cod_motor,
    m.capacitate_cm3,
    tc.nume                                                                      AS combustibil,
    GROUP_CONCAT(DISTINCT mo.nume_model ORDER BY mo.nume_model SEPARATOR ', ')  AS modele_compatibile,
    COUNT(DISTINCT mm.id_model)                                                  AS nr_modele,
    COUNT(DISTINCT cm.id_componenta)                                             AS nr_componente
FROM Motoare m
JOIN TipuriCombustibil tc ON m.id_combustibil = tc.id_combustibil
JOIN MotorModele       mm ON mm.id_motor       = m.id_motor
JOIN Modele            mo ON mm.id_model       = mo.id_model
LEFT JOIN ComponenteMotoare cm ON cm.id_motor  = m.id_motor
GROUP BY m.id_motor, m.cod_motor, m.capacitate_cm3, tc.nume
HAVING COUNT(DISTINCT mm.id_model) > 1
ORDER BY nr_componente DESC;

SELECT
    c.numar_oem,
    c.producator       AS producator_original,
    tc.nume            AS tip_componenta,
    cr.aftermarket_number,
    cr.producator_aftermarket
FROM CrossReferences  cr
JOIN Componente       c  ON cr.id_componenta = c.id_componenta
JOIN TipuriComponente tc ON c.id_tip         = tc.id_tip
ORDER BY c.numar_oem, cr.producator_aftermarket;

SELECT
    c.numar_oem,
    c.producator,
    tc.nume    AS tip,
    c.tensiune_v,
    c.curent_a,
    c.putere_w,
    c.pret_eur
FROM Componente       c
JOIN TipuriComponente tc ON c.id_tip = tc.id_tip
WHERE c.putere_w IS NOT NULL
ORDER BY c.putere_w DESC;

SELECT
    tc.sistem,
    COUNT(DISTINCT c.id_componenta)  AS nr_componente,
    COUNT(DISTINCT cm.id_motor)      AS nr_motoare_acoperite
FROM TipuriComponente  tc
JOIN Componente        c  ON c.id_tip          = tc.id_tip
JOIN ComponenteMotoare cm ON cm.id_componenta  = c.id_componenta
GROUP BY tc.sistem
ORDER BY nr_componente DESC;

SELECT
    tc.sistem,
    tc.nume         AS tip_componenta,
    c.numar_oem,
    c.producator,
    c.descriere,
    c.pret_eur,
    c.stoc_disponibil
FROM ComponenteMotoare cm
JOIN Componente        c  ON cm.id_componenta = c.id_componenta
JOIN TipuriComponente  tc ON c.id_tip         = tc.id_tip
JOIN Motoare           m  ON cm.id_motor       = m.id_motor
JOIN MotorModele       mm ON m.id_motor        = mm.id_motor
JOIN Modele            mo ON mm.id_model       = mo.id_model
JOIN Marci             ma ON mo.id_marca       = ma.id_marca
WHERE ma.nume = 'Volkswagen' AND mo.nume_model = 'Golf' AND mo.generatie = 'IV'
ORDER BY tc.sistem, tc.nume;

SELECT
    c.numar_oem,
    c.producator,
    tc.nume  AS tip_componenta,
    tc.sistem,
    c.stoc_disponibil,
    c.pret_eur
FROM Componente       c
JOIN TipuriComponente tc ON c.id_tip = tc.id_tip
WHERE c.stoc_disponibil < 10
ORDER BY c.stoc_disponibil ASC, tc.sistem;

SELECT
    tc.sistem,
    COUNT(DISTINCT c.id_componenta)                             AS nr_produse,
    SUM(c.stoc_disponibil)                                      AS total_bucati,
    ROUND(SUM(c.stoc_disponibil * COALESCE(c.pret_eur, 0)), 2) AS valoare_totala_eur
FROM Componente       c
JOIN TipuriComponente tc ON c.id_tip = tc.id_tip
GROUP BY tc.sistem
ORDER BY valoare_totala_eur DESC;