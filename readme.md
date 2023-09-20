# gitの練習

## はじめに

gitで作業者として作業してるとプルリクエストは作業結果を提出する大事な場所という認識だと思う。
しかし、一方で作業の履歴をバンバン取っていけるのもgitの醍醐味
これらを両立させるためにはgitにある程度習熟する必要がある。
特に、ブランチのマージや、複数コミットの単一化、作業ブランチの意味等を理解せずにgitを使うことは作業効率が落ちかえって害悪に近い。
この練習環境は、以上を習熟するための一歩となることを願い作成した。

また、これを見た誰でも、問題を作ってPRしてくれるのは大歓迎である。

## 環境

- 起動 `docker-compose run --rm ubuntu bash`
- 削除 `docker-compose down -v --remove-orphans`

- `ubuntu`フォルダに `.bashrc` と `.gitconfig` を置いてあるので自分の環境に持ってくるときには参考になる


## 練習問題の実行の仕方

```sh
docker-compose build
docker-compose run --rm ubuntu bash
```

した後、下記で問題用のフォルダ(repo)に移る

```sh
cd /src/practice/repo1
```

## 第11問

### 想定

- branch2で作業していた
- 気になることがあり branch3に分岐して作業中
- masterがbranch1を取り込み先に進んでしまった
- masterの後ろに自分の作業を全部置きたい

### 問題
- `cd practice/repo1` を実行し `./repo1` を以下の形にせよ


```sh
$ git log --graph --oneline --all
*   b8e41b0 (master) marge branch1
|\
| | * e734423 (HEAD -> branch3) B->O
| | * eb426f2 (branch2) L->M
| | * 7c603ab H->L
| | * b4b78ef C->K
| | * ab650de E->J
| |/
| * 45522bd (branch1) append GHI
| * 66017bf append DEF
| * b679aa9 append ABC
|/
* 4810272 initial commit
```

- 上を下にする

```sh
$ git log --graph --oneline --all
* d9c91b6 (HEAD -> branch3) B->O
* d4862c1 (branch2) L->M
* f732f8d H->L
* c3b2b99 C->K
* 1f07876 E->J
*   b8e41b0 (master) marge branch1
|\
| * 45522bd (branch1) append GHI
| * 66017bf append DEF
| * b679aa9 append ABC
|/
* 4810272 initial commit
```

### 解答

1. branch2をcheckoutし、masterでrebase
2. branch3をcheckoutし、branch2でrebase

```sh
git checkout branch2
git rebase master
git checkout branch3
git rebase branch2
```

## 第12問

### 想定

- branch2で作業していた
- 気になることがあり branch3に分岐して作業中
- masterがbranch1を取り込み先に進んでしまった
- その際、squashされてしまった。(gitlab等でよく起こる)
- masterの後ろに自分の作業を全部置きたい

### 問題
- `cd practice/repo2` を実行し `./repo2` を以下の形にせよ


```sh
$ git log --graph --oneline --all
*   a297867 (HEAD -> master) marge branch1
|\
| * 8475aa8 (branch1) append ABC
|/
| * 6099eb5 (branch2) L->M
| * a944668 H->L
| * 1fac641 C->K
| * 38eab62 E->J
| * fe37490 append GHI
| * 368ac44 append DEF
| * 555209e append ABC
|/
* f02e171 initial commit
```

- 上を下にする

```sh
$ git log --graph --oneline --all
* ced16a5 (HEAD -> branch2) L->M
* 05ac603 H->L
* 0d66b4b C->K
* 1a9a96a E->J
*   a297867 (master) marge branch1
|\
| * 8475aa8 (branch1) append ABC
|/
* f02e171 initial commit
```

### 解答

1. branch2をcheckoutし、分岐元でrebase このときsquashされたコミットを一つにする
2. masterでrebase

```sh
git checkout branch2
git rebase -i HEAD~7
git rebase master
```
- rebase内容
```
pick 555209e append ABC
s 368ac44 append DEF
s fe37490 append GHI
pick 38eab62 E->J
pick 1fac641 C->K
pick a944668 H->L
pick 6099eb5 L->M
```

3,4,5は昔に作って問題忘れた。
