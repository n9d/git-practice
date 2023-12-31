# コマンド解説

## `git reset`

`--soft` `--hard`のどちらもついていない `reset`は、`HEAD`の位置を変更するだけで、
インデックスやワーキングツリーには影響を与えない。

なので、`git rebase <commit>; git reset <commit>; git add .; git commit -m <comment>`という操作は、
`<commit>`以後のコミットを一つにまとめる操作となる。


`--hard`をつけると、`HEAD`の位置を変更し、
インデックスやワーキングツリーにも影響を与える。

## `git checkout`

`checkout`は、`HEAD`の位置を変更し、`HEAD`の位置のコミットの内容でワーキングツリーの内容を変更する。

`git checkout .`は、ワーキングツリーの内容を`HEAD`の位置のコミットの内容に戻す
(`git checkout HEAD .`でも同じ)。
`git checkout <commit> <path>`は、`<commit>`の`<path>`の内容をワーキングツリーに反映する。これにより任意のファイルのみを任意の`<commit>`の内容に戻すことができる。

`-b`をつけると、新しいブランチを作成する。

## `git clean`

`git clean`は、ワーキングツリーから、Gitの管理下にないファイルを削除する。`git clean`を実行すると、Gitの管理下にないファイルが削除される。
`-f`オプションを使用することで、強制的に削除する。

## HEAD

`HEAD`は、通常、現在のブランチの最新のコミットを指す。
`git checkout <commit>`とすると、`HEAD`は、`<commit>`を指す。
また、`HEAD`は、コマンド入力時、`@`で代替できる。

`HEAD~`,`HEAD~1`,`@-1` は、`HEAD`の一つ前のコミットを指す。

`HEAD~~`,`HEAD~2`,`@~~`,`@~2`は、`HEAD`の二つ前のコミットを指す。

`HEAD~3`,`@-3`,`HEAD~4`,`@~4`は、`HEAD`の３つ前、４つ前のコミットを指す。

`HEAD^2`は、・・・

## `git rebase`

`rebase`は、指定したコミットを、指定したコミットの直前に移動する。
`git rebase <branch>`は、`<branch>`の最新のコミットの後ろに、現在のブランチのコミット群を移動する。
これでよく利用されるのが、`git rebase master`である。
なぜなら、`master`は皆によって共有されるブランチであり、常にコンフリクトが解消されているからで、現在のブランチの修正をマスター以降に移動することで、コンフリクトを解消することが容易になるからである。
