-------------------------------------------------------------------------
uefcsthesis --- LaTeX-tyyli kandidaatin- ja pro gradu -tutkielmia varten
E-mail: pauli.miettinen@uef.fi
Lisenssi: LaTeX Project Public License v1.3c tai myöhempi
Katso https://www.latex-project.org/lppl.txt
-------------------------------------------------------------------------

Tyyli uefcsthesis.cls on Itä-Suomen yliopiston tietojenkäsittelytieteen
laitoksen kandidaatin- ja pro gradu -tutkielmien LaTeX-tyyli. Tyyli tulee kahdessa eri paketissa:
  o uefcsthesis.[zip|tar.bz] - pakolliset tyylitiedostot ja joukko
                               esimerkkitiedostoja
  o uefcsthesis-doc.zip - tyylitiedosto ja sen dokumentaatio ja dokumentaation
                          lähdetiedostot

Oman tutkielman kirjoittaminen kannattaa aloittaa muokkaamalla sopivaa
esimerkkitiedostoa. Dokumentaatiopaketista löytyvät modern.tex- ja
classic.tex-tiedostot näyttävät hieman enemmän rakennetta. Dokumentaatio-
paketin sample_contents/body_f.tex-tiedostosta voi katsoa esimerkkejä, miten
erilaiset tutkielmissa tavalliset osat on toteutettu.

Dokumentaatiopaketissa oleva sample.pdf sisältää sekä lyhyen esimerkin tyylin
käytöstä että lyhyen käyttöohjeen. Varsinainen käyttöohje on tiedostossa
uefcsthesis.pdf.

Luokan lähdetiedostot voi ladata omalle koneelleen git-reposta cs.uef.fi-
koneelta komennolla
git clone ssh://<username>@cs.uef.fi/staff/pauli/repos/git/uefthesis.git
Repo on vain luettavissa, eli push-komennot eivät toimi. Tyylitiedoston
ja muut tiedostot saa luotua komennolla
make
ja jakelupaketit komennolla
make package
