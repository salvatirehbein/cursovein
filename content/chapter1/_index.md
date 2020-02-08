---
title: "Estrutura do inventário"
date: 2020-02-07T00:00:00Z
draft: false
weight: 20
---

Não tem uma estrutura definida para rodar vein, isso quer dizer que cada usuario poder ordenar as funções do jeito que quiser. Mas neste curso, vamos a deixar bem estruturado in inventário para evitar erros, evitar usso innecessario de memoria e que seja mais facil replicar os resultados.

O caso que vai ser estudado vai ser considerando a frota de Brasil, especificamente a composição veicular presente nos [inventários de emissões da CETESB](https://cetesb.sp.gov.br/veicular/relatorios-e-publicacoes/). A razão é simples, para cada tipo de veículo tem um fator de emissão.


## Estrutura do inventario

Para gerar a estrutura do invenário primeiro temos que conhecer a composição veicular que vamos utilizar, que é da CETESB:

![](https://i.imgur.com/PVyU0r0.png)


A função que gera a estrutura do inventário é `inventory` os argumentos mais importantes são `name` e `vehcomp`


- `name` é o nome da pasta onde vai ser compilado o inventario
- `vehcomp` é a composição veicular, neste caso a composião da CETESB com os nomes em inglês:
-  **PC** (Automóveis), **LCV** (Comerciais Leves), **HGV** (Caminhões), **BUS** (Ônibus), **MC** (Motocicletas).

Quantos tipos de veículos tem de cada?

Então, tem que ser usada a função assim:

```r
inventory(name = "saopaulo", 
          vehcomp = c(PC = 4, LCV = 5, HGV = 5, BUS = 3, MC = 9),
          ef = "CETESB",
          year = 2018)
```
