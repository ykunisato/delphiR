
# delphiR

<!-- badges: start -->
<!-- badges: end -->

RでDelphi調査をするためのRパッケージです。まだ**全く完成していません**。さしあたって，以下を実装したいと思います。

- jsPsychプラグインを使ってDelphi法のRound1の調査票を作る関数
- jsPsychプラグインを使ってDelphi法のRound2の調査票を作る関数
- jsPsychプラグインを使ってDelphi法のRound3の調査票を作る関数(対応表を使って個別IDごとに調査票を出力する)

## Installation

以下でインストールします。

```
# install.packages("remotes")
remotes::install_github("ykunisato/delphiR")
```

## Example
### Round1

set_round1でRound1の調査票を作ります。instに教示文，questionに自由記述についての質問，max_responseに最大の回答数，min_responseに最小の回答数を指定します（最小の回答数を指定すると，その回答数分回答しないと次へ進めません。0に設定することもできます）。実行するとround1というフォルダが作られて，そこに各種jsPsychのプラグインがダウンロードされて，HTMLファイルとJSファイルが生成されます。round1フォルダ内の”demo_round1.html”をブラウザで開くと調査票を確認できます。

```
library(delphiR)
set_round1(inst='<br><font size="6">デルファイ法ラウンド１調査</font><br><br>以下の質問への回答をお願いいたします。できるだけ多くの回答をお願いいたします。また，回答は思いついた順番で回答いただいてかまいません。なお，回答は少なくとも５個以上，１０個未満でお願いいたします。',
            question='専門領域における現在の優先して行うべき研究は何ですか？',
            max_response = 10,
            min_response = 5)
```
