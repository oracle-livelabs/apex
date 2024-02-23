# はじめに

## ワークショップの概要
このワークショップでは、Quick SQLを使ってローカル・データベースにテーブルを構築します。次に、コンマ区切りファイル(.csv)へのREST API呼び出しから作成したテーブルにデータをロードします。これでたくさんのデータを持つテーブルができたので、その上にAPEXアプリケーションを構築し、レポートとチャートを追加してアプリケーションを改善します。

使用するデータはエコノミストのビッグマック指数で、マクドナルドのビッグマックの価格を基準にして通貨間の購買力平価を測定するために使用されます。

*注意:このデータは6ヶ月に1度しか更新されません*

所要時間: 50分

### 目的

* RESTエンドポイントからデータをロード
* 新しいデータ上にアプリケーションを作成
* アプリケーションの改善

*注意:このラボではOracle APEX 23.1を使用していることを前提としています。*

### ラボ

| # | モジュール | 所要時間 |
| --- | --- | --- | 
| 1 | [テーブルの作成](?lab=lab-2-creating-table) | 10分 |
| 2 | [テーブルへのデータ入力](?lab=lab-3-populating-table) | 5分 |  
| 3 | [レポートの改善](?lab=lab-4-improving-report) | 15分 |
| 4 | [チャートの追加](?lab=lab-5-adding-chart) | 5分 |
| 5 | [チャートの更新条件の追加](?lab=lab-6-adding-chart-criteria) | 5分 |

### **はじめましょう!**  

メニューが表示されない場合は、ページの上部にあるメニュー・ボタン(![メニューアイコン](./images/menu-button.png))をクリックして開くことができます。

## ダウンロード

[ここをクリック](files/remotedatasource-app.sql)して完成したアプリケーションをダウンロードします。

## さらに詳しく - 役立つリンク

- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX コラテラル](https://apex.oracle.com) 
- [チュートリアル](https://apex.oracle.com/en/learn/tutorials) 
- [コミュニティ](https://apex.oracle.com/community)
- [外部サイト + Slack](http://apex.world)

## 謝辞

 - **作成者/投稿者** -  Salim Hlayel, Principle Product Manager
 - **投稿者** - Jaden McElvey, Technical Lead - Oracle LiveLabs Intern
 - **最終更新日** - Salim Hlayel, Principle Product Manager, November 2020

