# Programação Aplicada ao Direito

Curso de programação em Python do **LabDados**, FGV Direito SP: seis encontros de
2h30 sobre os fundamentos da linguagem, seguidos de quatro workshops temáticos
sobre dados judiciais, tratamento de dados e uso de modelos de linguagem.

Página do curso: <https://lab-dados.github.io/programacao-aplicada-ao-direito/>

## Aulas

| # | Encontro | Material |
|:--|:---------|:---------|
| 1 | Por que programar e preparação do ambiente | [slides](https://lab-dados.github.io/programacao-aplicada-ao-direito/aulas/01-introducao/slides.html) · [**abrir no Colab**](https://colab.research.google.com/github/lab-dados/programacao-aplicada-ao-direito/blob/main/aulas/01-introducao/notebook.ipynb) · [notebook](https://lab-dados.github.io/programacao-aplicada-ao-direito/aulas/01-introducao/notebook.ipynb) · [gabarito](https://github.com/lab-dados/programacao-aplicada-ao-direito/blob/main/aulas/01-introducao/gabarito.ipynb) |
| 2 | Tipos básicos e funções | em preparo |
| 3 | Condicionais, loops, listas e dicionários | em preparo |
| 4 | Objetos, classes e herança | em preparo |
| 5 | Manipulação de dados com pandas | em preparo |
| 6 | Conceitos de IA e engenharia de contexto | em preparo |

Workshops de aprofundamento, ainda em preparo: dados judiciais com `juscraper`;
tratamento de dados e engenharia de variáveis; leitura de decisões com LLMs;
análises e visualizações.

## Como acompanhar

A primeira aula começa **no navegador**, pelo Google Colab, para que ninguém
dependa de instalação. Na segunda metade do encontro levamos o mesmo notebook
para o seu computador.

### Na aula: só clicar

Clique em **abrir no Colab** na tabela acima. Não precisa instalar nada. Assim
que abrir, use `Arquivo` e depois `Salvar uma cópia no Drive`, senão o que você
escrever se perde ao fechar a aba.

### Traga um áudio

Na aula 1 vamos transcrever um áudio. Grave de 20 a 30 segundos lendo em voz alta
um trecho de uma decisão, de uma lei ou de um contrato. O `Gravador de Voz` do
Windows e do Mac serve, e um áudio de WhatsApp também.

## Instalando no seu computador

Fazemos isso juntos na última parte da primeira aula. Se você quiser adiantar em
casa, melhor: o passo 2 baixa cerca de 400 MB.

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

### 2. Crie o seu projeto

O `uv init` cria a pasta do projeto já com um repositório Git dentro, e o
`uv add` instala as bibliotecas e anota no `pyproject.toml` de quais o projeto
depende.

```bash
uv init programacao-direito
cd programacao-direito
uv add jupyter "labdados[transcricao]"
```

Depois, baixe do Colab a sua cópia do notebook (`Arquivo`, depois `Fazer
download`, `.ipynb`) e salve dentro da pasta do projeto.

### 3. Abra no VS Code

1. Abra a pasta do projeto no VS Code (`File` e depois `Open Folder...`).
2. Instale as extensões **Python** e **Jupyter**, ambas da Microsoft.
3. Abra o notebook que você baixou do Colab.
4. Clique em `Select Kernel` e escolha o `.venv` do projeto.
5. Refaça a Parte C, agora na sua máquina.

### 4. Suba para o GitHub

Crie um repositório **vazio** no GitHub, sem README e sem licença. Depois, na
pasta do projeto:

```bash
git branch -M main
git add .
git commit -m "aula 1"
git remote add origin https://github.com/SEU-USUARIO/programacao-direito.git
git push -u origin main
```

O `git branch -M main` renomeia a branch que o `uv` criou (`master`) para o nome
que o GitHub usa. Repita `git add`, `git commit` e `git push` ao fim de cada
aula: no fim do curso, o repositório mostra o que você fez.

Dúvidas e erros podem virar
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

Existe um modelo de projeto em
[`lab-dados/projeto-programacao-direito`](https://github.com/lab-dados/projeto-programacao-direito),
que **não está em uso**: no Encontro 1 os alunos criam o projeto do zero com
`uv init`, para ver de onde cada arquivo vem.

O modelo de transcrição usado no Encontro 1 é baixado pelo próprio `labdados`
(a partir da versão 0.9), que o serve de uma release sua em vez do Hugging Face.
O HF bloqueia requisições anônimas vindas de IPs de datacenter, que é o caso do
Colab, e pedia um `HF_TOKEN` que os alunos não têm.

## Licença

Textos, slides e notebooks sob
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.pt-br). Código sob
[MIT](LICENSE).

O quadrinho usado nos slides do Encontro 1 é
[xkcd 1987](https://xkcd.com/1987/), de Randall Munroe, sob licença
[CC BY-NC 2.5](https://creativecommons.org/licenses/by-nc/2.5/). O modelo de
transcrição vem de
[`Systran/faster-whisper-tiny`](https://huggingface.co/Systran/faster-whisper-tiny),
conversão do [Whisper](https://github.com/openai/whisper) da OpenAI, ambos sob
licença MIT.
