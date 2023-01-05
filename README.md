# 平家物語ゲーム

国語の授業の宿題「平家物語に関するものづくり」の作品．

## 部門

テクニカル

## テーマ

平家物語を楽しく覚える

## コンセプト

Web アプリで覚える！祇園精舎

## 説明

- https://heikemonogatari-game.web.app/
- https://github.com/kuroyei/heikemonogatari_game/

平家物語 祇園精舎 の冒頭部と同じ語順になるように、正しい語句を選択していくゲームです．似た語句に惑わされないよう注意しましょう！
```
祇園精舍の鐘の声、諸行無常の響きあり。娑羅双樹の花の色、盛者必衰の理をあらはす。驕れる人も久しからず、ただ春の夜の夢のごとし。猛き者もつひにはほろびぬ、ひとへに風の前の塵に同じ。
```

- 連続タップするとバグるかもしれません．
- 音量 $> 0$ でプレイするのをお勧めします．
- Firebase Hosting の転送量が 10GB/月 なので、アクセスし過ぎないでください．
- アプリの公開は予告なく終了します．
- 語句の選択肢は、ChatGPT に似た語句を生成させることで作りました．
- 選択時には、ずんだもんが正しい語句を言ってくれます．(音声は VOICEVOX で生成)
- ずんだもん立ち絵素材は坂本アヒルさんが描いたものです．
- Web アプリの制作には Flutter を用いました．

## 感想

アプリ開発及び Flutter はほぼ未経験でしたが、ネット上で見つけたプログラムを参考にして、なんとか完成させました．制作時間は約 18 時間．めちゃくちゃしょぼいゲームですが、自分の技術力ではこれくらいが限界です．

- 平家物語といえば東北かな～
- 東北といえばずんだもんかな～
- ずんだもんといえば緑かな～

ということで、アプリにはずんだもんが登場し、テーマカラーも緑になっています．

平家物語と東北は実際のところそこまで関わりが深いわけではないと思いますが、平家物語と奥の細道 平泉を同じ学期に勉強したので、混同しちゃっているんだと思います()

## Known Issues/Bugs

- ~~トップページの GitHub へのボタンが効かない．(デバッグモードでは動いてた)~~
    - `flutter clean` してビルドしたらうまく行った
- iOS 上のブラウザではずんだもんの画像が半透明にならない
    - Flutter が WebKit に対応しきれてない？
- 高速或いは連続でタップするとカードの色が変わらない又は音声が再生されないまま次へ飛ばされる

## スクリーンショット

![image](https://user-images.githubusercontent.com/81549868/210519084-4506844d-3950-4d44-b017-e41d841e2c5c.png)
