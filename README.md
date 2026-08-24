# Programação Aplicada ao Direito

Curso de programação em Python do **LabDados**, FGV Direito SP: seis encontros de
3 horas sobre os fundamentos da linguagem, seguidos de quatro workshops temáticos
sobre dados judiciais, tratamento de dados e uso de modelos de linguagem.

Página do curso: <https://lab-dados.github.io/programacao-aplicada-ao-direito/>

## Aulas

| # | Encontro | Material |
|:--|:---------|:---------|
| 1 | Por que programar e preparação do ambiente | [slides](https://lab-dados.github.io/programacao-aplicada-ao-direito/aulas/01-introducao/slides.html) · [notebook](https://github.com/lab-dados/programacao-aplicada-ao-direito/blob/main/aulas/01-introducao/notebook.ipynb) · [Colab](https://colab.research.google.com/github/lab-dados/programacao-aplicada-ao-direito/blob/main/aulas/01-introducao/notebook.ipynb) · [gabarito](https://github.com/lab-dados/programacao-aplicada-ao-direito/blob/main/aulas/01-introducao/gabarito.ipynb) |
| 2 | Tipos básicos e funções | em preparo |
| 3 | Condicionais, loops, listas e dicionários | em preparo |
| 4 | Objetos, classes e herança | em preparo |
| 5 | Manipulação de dados com pandas | em preparo |
| 6 | Conceitos de IA e engenharia de contexto | em preparo |

Workshops de aprofundamento, ainda em preparo: dados judiciais com `juscraper`;
tratamento de dados e engenharia de variáveis; leitura de decisões com LLMs;
análises e visualizações.

## Antes do primeiro encontro

Você pode acompanhar o curso de duas formas. A mais simples é abrir os notebooks
no **Google Colab**, pelos links da tabela acima, sem instalar nada. A mais
completa é instalar o ambiente no seu computador, que é o caminho usado nas
aulas. Se a instalação travar, use o Colab e resolvemos depois.

### 1. Instale as ferramentas

No **Windows**, abra o PowerShell e execute os comandos abaixo, um por vez.
Depois de cada instalação, abra uma janela nova do PowerShell.

```powershell
winget install --id=astral-sh.uv -e
winget install --id Git.Git -e --source winget
winget install --id Microsoft.VisualStudioCode -e
uv python install 3.13
```

No **Mac** e no **Linux**, use os instaladores oficiais do
[uv](https://docs.astral.sh/uv/getting-started/installation/),
do [Git](https://git-scm.com/downloads/) e do
[VS Code](https://code.visualstudio.com/download). Depois do uv instalado, o
comando `uv python install 3.13` é igual nos três sistemas.

Para conferir, execute em uma janela nova:

| Comando | Resultado esperado |
|:--------------------|:-------------------------------------------|
| `uv --help` | Lista de comandos e opções do uv |
| `git --help` | Lista de comandos e opções do Git |
| `uv python list` | Uma instalação do Python 3.13 na listagem |

### 2. Baixe os materiais

```bash
git clone https://github.com/lab-dados/programacao-aplicada-ao-direito.git
cd programacao-aplicada-ao-direito
uv sync
```

O `uv sync` cria a pasta `.venv` dentro do projeto e instala as bibliotecas do
curso.

### 3. Abra o notebook

1. Abra a pasta do curso no VS Code (`File` e depois `Open Folder...`).
2. Instale as extensões **Python** e **Jupyter**, ambas da Microsoft.
3. Abra `aulas/01-introducao/notebook.ipynb`.
4. Clique em `Select Kernel` e escolha o `.venv` do projeto.
5. Execute a primeira célula com `Shift+Enter`.

Se apareceu a versão do Python, está tudo pronto. Se algo falhar, traga a
mensagem de erro para a aula.

## Durante o curso

- Rode `git pull` antes de cada aula para receber as atualizações.
- Trabalhe em uma **cópia** do notebook, com o seu nome no arquivo. Assim o
  `git pull` não sobrescreve o que você escreveu.
- Dúvidas e erros podem virar
  [issues](https://github.com/lab-dados/programacao-aplicada-ao-direito/issues).

## Para quem edita o material

Os slides são feitos em [Quarto](https://quarto.org). O site é publicado a cada
`push` na `main`, pelo workflow em `.github/workflows/publish.yml`, e é gerado a
partir deste próprio README.

```bash
quarto preview                                # site
quarto render aulas/01-introducao/slides.qmd  # um deck
```

A pasta `_extensions/fgv/` contém o tema Quarto com as cores e a tipografia do
manual de identidade visual da FGV. Extensões do Quarto precisam ficar
versionadas no repositório para que a publicação automática funcione.

## Licença

Textos, slides e notebooks sob
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.pt-br). Código sob
[MIT](LICENSE).

O quadrinho usado nos slides do Encontro 1 é
[xkcd 1987](https://xkcd.com/1987/), de Randall Munroe, sob licença
[CC BY-NC 2.5](https://creativecommons.org/licenses/by-nc/2.5/).
