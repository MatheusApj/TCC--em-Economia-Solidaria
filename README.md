Plataforma de Logística da Economia Solidária (TCC)

Bem-vindo(a) ao repositório do projeto técnico desenvolvido como parte do Trabalho de Conclusão de Curso (TCC) focado na criação de uma plataforma digital para a logística e o *e-commerce* da Economia Solidária.

Este projeto foi pensado e modelado para atender à realidade de **associações e cooperativas de pequenos produtores rurais do Nordeste brasileiro**, utilizando a tecnologia como instrumento de emancipação, transparência e fortalecimento das redes colaborativas.

Propósito e Contexto
Os empreendimentos de economia solidária enfrentam grandes desafios logísticos (produção, armazenamento, transporte e distribuição), o que gera desperdício e limita a geração de renda. Ferramentas genéricas (como apps de mensagens) não suportam a necessidade de **autogestão** e **decisão democrática**.

Esta plataforma atua como um *hub* logístico solidário, permitindo:
- Integração de informações de produção e demanda.
- Otimização de rotas e recursos logísticos compartilhados.
- Redução drástica da dependência de atravessadores.
- Acesso facilitado a políticas públicas, como o Programa de Aquisição de Alimentos (PAA).

Estrutura do Banco de Dados
Atualmente, este repositório armazena a **Camada de Persistência** do projeto, materializada no arquivo do banco de dados relacional.

O arquivo `logistica_solidaria.sql` contém a modelagem física (DDL) desenvolvida em **PostgreSQL**. Ele estrutura as seguintes entidades principais do ecossistema:

* Associação & Agricultor:** Gestão dos produtores e suas respectivas cooperativas.
* Produto:** Catálogo de alimentos com foco em produção agroecológica e agricultura familiar.
* Entidade Recebedora:** Cadastro dos pontos de destino (escolas, creches, PAA, etc.).
* Oferta & Demanda:** Módulos de consolidação entre o que é produzido e o que é solicitado.
* Pedido & Entrega:** Rastreabilidade logística, status de atendimento e comprovação de entrega.

Como testar o Banco de Dados localmente
Para visualizar e testar as tabelas e relacionamentos criados:

1. Tenha o [PostgreSQL](https://www.postgresql.org/) e o [pgAdmin](https://www.pgadmin.org/) instalados na sua máquina.
2. Clone este repositório ou baixe o arquivo `.sql`.
3. Abra a ferramenta Query Tool do seu pgAdmin.
4. Copie, cole e execute o conteúdo do script para gerar o banco `logistica_solidaria` e suas tabelas normalizadas.

---
**Autor:** Matheus Alves  
*Projeto de cunho acadêmico e tecnológico voltado para o impacto socioeconômico e a economia solidária digital.*
