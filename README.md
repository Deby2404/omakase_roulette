# おまかせルーレット
http://omakaseroulette.com/
<img width="1228" alt="スクリーンショット 2022-05-23 1 39 10" src="https://user-images.githubusercontent.com/98319814/169715724-70a7d690-96fa-4a94-8695-fd15d2d35e6d.png">
## サイト概要
* 1日の献立もしくは１週間分の献立から選びます。朝飯、昼飯、晩飯を選択し、料理のジャンルを選択したら自動的に献立を表示します。
* 登録をした場合は料理の投稿ができます。投稿した料理はルーレットに組み込まれます。

### サイトテーマ
* ランダムに献立を提示するアプリケーションです。

### テーマを選んだ理由
* 母が「毎日献立を考えるのが大変」、「なんでもいいと言われても困る」と言っていたのを思い出し、考えなくて済むようなアプリケーションがあれば解決すると、「おまかせルーレット」の作成を決断しました。

### ターゲットユーザ
* 主婦
* 一人暮らしの方

### 主な利用シーン
* 献立をおまかせしたいとき
* 何を作ったら良いかわからない時

## 設計書
* ワイヤーフレーム
https://app.moqups.com/gYYBJdUUT6ckCy1ZyJZkJETA5B15Qs37/view/page/abe4a59a2
* ER図
https://drive.google.com/file/d/1decRn3pz8qYzWba5LBWq81QgidJEhkiK/view?usp=sharing
* 画面遷移図
https://drive.google.com/file/d/1EMiW_p-1LUudjFSUFPT32pdzUM-qhHLX/view?usp=sharing
* テーブル提議書
https://docs.google.com/spreadsheets/d/10SiR4_QcYZ3XOGCi7l6N3pza-kne9vgvEsaw5GB3bbE/edit?usp=sharing

## 開発環境
- フロントエンド
  - Bootstrap4.5
  - SCSS
  - JavaScript
- バックエンド
  - Ruby 2.6.3
  - Rails 6.1.5.1
- インフラ
  - MySQL2
  - AWS
  - Nginx, Puma
## 機能一蘭
- ゲストログイン機能
- 会員機能
- 投稿機能
- ユーザー管理機能
- お問い合わせ機能
- 通知機能
- SNS認証機能(Google)
## 使用素材
- バックグラウンド画像
  - Unsplash
  - https://unsplash.com/
- ロゴ
  - Hatchful
  - https://hatchful.shopify.com/ja/
## 今後追加したい機能
- ヴィーガンやハラールフード、アレルギーのある方など誰でも使用できるようにする。
- 全世界の方に使ってもらいたいので英語と日本語で切り替えができるようにする。