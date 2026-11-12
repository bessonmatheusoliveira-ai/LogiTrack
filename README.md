# LogiTrack — Gerenciador Logístico

Projeto acadêmico desenvolvido em PHP, MySQL/MariaDB, HTML, CSS, JavaScript e Bootstrap para a atividade prática da UNIPAR EAD.

## Funcionalidades
- Painel com indicadores e fretes recentes.
- Cadastro, listagem, edição e exclusão de produtos.
- Cadastro, listagem, edição e exclusão de endereços.
- Cadastro, listagem, edição e exclusão de transportadores.
- Geração de frete relacionando transportador, origem, destino e vários produtos.
- Consulta de fretes e visualização de detalhes.
- Relatório de fretes por data com exportação PDF (Dompdf) ou impressão do navegador.

## Requisitos
- XAMPP para Windows (Apache, PHP 8+ e MySQL/MariaDB).
- Navegador atualizado.
- Composer (opcional, recomendado para instalar Dompdf e gerar PDF diretamente).

## Instalação
1. Copie a pasta `LogiTrack` para `C:\xampp\htdocs\`.
2. Abra o XAMPP Control Panel e inicie Apache e MySQL.
3. Acesse `http://localhost/phpmyadmin`.
4. Importe o arquivo `database/logitrack.sql` na aba Importar. **Atenção:** o script recria as tabelas do banco `logitrack` e insere dados de demonstração.
5. Confira usuário e senha em `config/config.php` (padrão XAMPP: usuário `root`, senha vazia).
6. Acesse `http://localhost/LogiTrack`.

## PDF do relatório
Para gerar o PDF diretamente pelo sistema, abra um terminal na pasta do projeto e execute:
```bash
composer install
```
Isso instalará Dompdf em `vendor/`. Se Composer não estiver instalado, o botão do relatório abre a impressão do navegador; escolha "Salvar como PDF".

## Git e GitHub
Na pasta do projeto:
```bash
git init
git add .
git commit -m "chore: estrutura inicial do LogiTrack"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/LogiTrack.git
git push -u origin main
```
Substitua `SEU-USUARIO` pelo seu usuário do GitHub. Faça novos commits a cada funcionalidade/alteração.

## Estrutura
- `config/`: conexão e funções comuns.
- `includes/`: cabeçalho e rodapé.
- `products/`, `addresses/`, `carriers/`, `freights/`: módulos do sistema.
- `reports/`: relatórios.
- `database/`: script SQL.
- `assets/`: CSS e JavaScript.

## Dados de demonstração
O banco inclui produtos, endereços, transportadores e um frete inicial. São dados fictícios para testes; substitua-os por dados adequados antes de qualquer uso real.

## Observações acadêmicas
O projeto é uma base funcional para estudo. Teste todos os fluxos no seu ambiente, personalize os dados e esteja preparado para explicar a estrutura, os relacionamentos e as funcionalidades na gravação da apresentação.
