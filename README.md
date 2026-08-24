# Programação Aplicada ao Direito

Curso de programação em Python do **LabDados**, FGV Direito SP: seis encontros de
3 horas sobre os fundamentos da linguagem, seguidos de quatro workshops temáticos
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

Fazemos isso juntos na segunda metade da primeira aula. Se você quiser adiantar
em casa, melhor: o passo 2 baixa cerca de 400 MB.

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

### 2. Crie o seu repositório

Você vai trabalhar em um repositório **seu**, que serve de portfólio, e que já
vem com o notebook da aula dentro.

1. Crie uma conta no [GitHub](https://github.com/), se ainda não tiver.
2. Abra o modelo
   [`lab-dados/projeto-programacao-direito`](https://github.com/lab-dados/projeto-programacao-direito)
   e clique em **Use this template**, depois em **Create a new repository**.
   Sugestão de nome: `programacao-direito`.
3. Clone o repositório que você acabou de criar e monte o ambiente:

```bash
git clone https://github.com/SEU-USUARIO/programacao-direito.git
cd programacao-direito
uv sync
```

### 3. Abra no VS Code

1. Abra a pasta do projeto no VS Code (`File` e depois `Open Folder...`).
2. Instale as extensões **Python** e **Jupyter**, ambas da Microsoft.
3. Abra `aula-01.ipynb`, que já está na pasta. É o mesmo notebook do Colab.
4. Clique em `Select Kernel` e escolha o `.venv` do projeto.
5. Execute a primeira célula com `Shift+Enter`.

Ao final de cada aula, salve o seu trabalho:

```bash
git add .
git commit -m "aula 1"
git push
```

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

O modelo de projeto dos alunos fica em
[`lab-dados/projeto-programacao-direito`](https://github.com/lab-dados/projeto-programacao-direito)
e traz uma cópia de `aulas/01-introducao/notebook.ipynb` como `aula-01.ipynb`.
**Ao alterar o notebook aqui, copie a versão nova para lá.**

O modelo de transcrição usado no Encontro 1 está publicado na
[release `modelos-v1`](https://github.com/lab-dados/programacao-aplicada-ao-direito/releases/tag/modelos-v1)
deste repositório. O notebook baixa de lá, e não do Hugging Face, porque o HF
bloqueia requisições anônimas vindas de IPs de datacenter, que é o caso do Colab.

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
