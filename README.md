
# delphiR

<!-- badges: start -->
<!-- badges: end -->

RでDelphi調査をするためのRパッケージです。まだ未完成です。

## Installation

```
# install.packages("remotes")
remotes::install_github("ykunisato/delphiR")
```

## Example


```
delphiR::set_round1(inst="デルファイ法のラウンド１<br><br>以下の質問への回答をお願いいたします。できるだけ多くの回答をお願いいたします。また，回答は思いついた順番で回答いただいてかまいません。",
                    question="専門領域における現在の優先して行うべき研究は何ですか？",
                    max_response = 10,
                    min_response = 5)
```
