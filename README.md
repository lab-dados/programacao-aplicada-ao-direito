# Programação Aplicada ao Direito

Materiais do curso de programação em Python do **LabDados / FGV Direito SP**:
seis encontros de fundamentos e quatro workshops temáticos sobre dados
judiciais, tratamento de dados e uso de modelos de linguagem.

**Site do curso:** <https://lab-dados.github.io/programacao-aplicada-ao-direito/>

## Como usar

### 1. Prepare o ambiente

Instale `uv`, Git, Visual Studio Code e Python seguindo o
[tutorial de instalação](https://lab-dados.github.io/programacao-aplicada-ao-direito/instalacao.html)
(cerca de 20 minutos).

### 2. Baixe os materiais

```bash
git clone https://github.com/lab-dados/programacao-aplicada-ao-direito.git
cd programacao-aplicada-ao-direito
uv sync
```

O `uv sync` cria a pasta `.venv` e instala tudo o que o curso usa.

### 3. Abra o notebook da aula

Abra a pasta no Visual Studio Code, instale as extensões **Python** e
**Jupyter** (ambas da Microsoft), abra `aulas/01-introducao/notebook-01.ipynb` e
selecione o kernel `.venv`.

Antes de cada aula, rode `git pull` para receber as atualizações. Trabalhe sempre
em uma **cópia** do notebook (por exemplo, `notebook-01-meu.ipynb`) para que o
`git pull` não sobrescreva suas anotações.

### Sem instalar nada

Todo notebook também abre no Google Colab pelos links da
[página de aulas](https://lab-dados.github.io/programacao-aplicada-ao-direito/aulas.html).

## Organização do repositório

```
├── aulas/                  encontros do curso base
│   └── 01-introducao/      slides.qmd, notebook-01.ipynb, gabarito-01.ipynb
├── workshops/              workshops de aprofundamento
├── dados/                  bases pequenas usadas nos exercícios
├── pdf/                    fonte da versão em PDF do tutorial de instalação
├── _extensions/fgv/        formatos Quarto na identidade visual da FGV
├── _includes/              trechos compartilhados entre páginas
├── pyproject.toml          dependências do curso (uv)
└── _quarto.yml             configuração do site
```

## Para quem edita o material

Os slides e o site são feitos em [Quarto](https://quarto.org). Para trabalhar
localmente:

```bash
quarto preview                              # site inteiro
quarto render aulas/01-introducao/slides.qmd # apenas um deck
quarto render pdf/tutorial-instalacao.qmd    # PDF do tutorial
```

O site é publicado automaticamente no GitHub Pages a cada `push` na branch
`main`, pelo workflow em `.github/workflows/publish.yml`.

Os notebooks de exercício e gabarito do Encontro 1 são gerados a partir de uma
fonte única, para que enunciado e solução nunca fiquem fora de sincronia.

## Licença

Textos, slides e notebooks sob
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.pt-br). Código sob
[MIT](LICENSE). Use, adapte e compartilhe, citando a origem.
