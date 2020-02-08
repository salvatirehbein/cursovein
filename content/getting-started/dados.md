---
title: "Dados dentro do modelo"
date: 2019-10-26T15:26:15Z
draft: false
weight: 30
---

o modelo vein tem varios dados para facilitar a vida.

### Fatores de emissão da CETESB 2018

Os fatores estão dentro da função [ef_cetesb](https://atmoschem.github.io/vein/reference/ef_cetesb.html):

```r
library(vein)
ef_cetesb(p, veh, year = 2017, agemax = 40, full = FALSE, project = "constant")
```

### Quilometragem médio para veículos de Brazil

[Bruni e Bales (2013)](https://cetesb.sp.gov.br/veicular/relatorios-e-publicacoes/) publicaram regressões de mais de 2 millões de medições de odómetro. As equações resultanes foram incluidas no modelo

```r
data(fkm)
```
Bruni, Antonio De Castro, and Marcelo Pereira Bales. 2013. “Curvas de Intensidade de Uso Por Tipo de Veículo Automotor Da Frota Da Cidade de São Paulo.” CETESB.

### Fatores de expansão temporal 

Tem dois dados de fatores de expansão temporal gerados a partir do fluxo horario das praças de pedágio de São Paulo, da ARTESP (obrigado Artesp). Os dados são `pc_profile` e `profiles`

```r
data(pc_profile)
tf <- unlist(pc_profile)
hours <- 1:168
par(mar = c(4, 4, .1, .1))
plot(y = tf, x = hours, pch = 16, type = "b")
```

![](https://i.imgur.com/4nupPCB.png)

```r
data(profiles)
names(profiles)
 [1] "PC_JUNE_2012"     "PC_JUNE_2013"     "PC_JUNE_2014"     "LCV_JUNE_2012"   
 [5] "LCV_JUNE_2013"    "LCV_JUNE_2014"    "MC_JUNE_2012"     "MC_JUNE_2013"    
 [9] "MC_JUNE_2014"     "HGV_JUNE_2012"    "HGV_JUNE_2013"    "HGV_JUNE_2014"   
[13] "PC_JANUARY_2012"  "PC_JANUARY_2013"  "PC_JANUARY_2014"  "LCV_JANUARY_2012"
[17] "LCV_JANUARY_2013" "LCV_JANUARY_2014" "MC_JANUARY_2012"  "MC_JANUARY_2014" 
[21] "HGV_JANUARY_2012" "HGV_JANUARY_2013" "HGV_JANUARY_2014"
```

## Perfil para partidas em frio

Em 2004, Mauricio Osses e outros mediram as partidas em Sâo Paulo

```r
data(pc_cold)
```

Lents, James, Nicole Davis, Nick Nikkila, and Mauricio Osses. 2004. “São Paulo Vehicle Activity Study.” 605 South Palm Street, Suite C, La Habra, CA 90631, USA: International Sustainable System Research Cente

dica:

> O melhor dado de perfil horario é o medido especificamente para o periodo de estudo. Os fatores de expansão temporal podem ser ussados só se não tiver dados melhores.

## Poluentes com pesso molecular e MIR

vein conta com  fatores de emissão de quase 150 poluentes. Estos dados podem ser vistos assim:

```r
data(pollutants)
View(pollutants)
head(pollutants)
  n group1  group2     pollutant      CAS            g_mol       MIR     MOIR
1 1   NMHC alkenes      1-butene 106-98-9 56.10632 [g/mol]  9.726590 3.822154
2 2   NMHC alkenes      1-hexene 592-41-6 84.15948 [g/mol]  5.492385 2.329718
3 3   NMHC alkenes     1-pentene 109-67-1 70.13290 [g/mol]  7.207436 2.884923
4 4   NMHC alkenes 1,3-butadiene 106-99-0 54.09044 [g/mol] 12.612103 4.705564
5 5   NMHC alkenes      2-butene 106-98-9 56.11000 [g/mol]        NA       NA
6 6   NMHC alkenes     2-pentene 627-20-3 70.13290 [g/mol] 10.474641 3.954795
      EBIR notes
1 2.367359      
2 1.446754      
3 1.775662      
4 2.876026      
5       NA      
6 2.452128  
```