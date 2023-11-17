# はじめに

## ワークショップの概要
このワークショップでは、データベース・オブジェクトをREST有効化します。次に、生成されたRESTエンドポイントを使用して、アプリケーション内にRESTデータ・ソースを定義します。そして、ローカル・データベース・オブジェクトではなく、RESTデータ・ソースの上でアプリケーションのページを作成し、LOVコンポーネントを定義します。最後に、ページ内の数値フィールドを選択リストに変更し、プレーン・テキストをプレーン・テキスト(LOVに基づく)に変更して、ページを改善します。

推定時間: 45分

### 目的

* 無料開発環境の入手
* テーブルとビューのREST有効化 
* RESTエンドポイントに対するRESTデータ・ソースの定義
* RESTデータ・ソースを利用したアプリケーションの構築

*注意: このラボではOracle APEX 23.1を使用していることを前提としています。*

### ラボ

| # | モジュール | 推定時間 |
| --- | --- | --- |
| 1 | [APEXワークスペースへのサインアップ](?lab=lab-1-sign-up-for-apex-workspace) | 5分 |
| 2 | [データベースオブジェクトのREST有効化](?lab=lab-2-rest-enabling-database-objects)  | 10分 | 
| 3 | [RESTデータソースの定義](?lab=lab-3-defining-rest-data-sources) | 10分 |
| 4 | [ページの作成](?lab=lab-4-creating-pages) | 15分 |
| 5 | [リストの値の定義](?lab=lab-5-defining-list-values) | 10分 |

### **はじめましょう!**  

メニューが表示されない場合は、ページの上部にあるメニューボタン(![メニューアイコン](./images/menu-button.png))をクリックして開くことができます。

## ダウンロード

[ここをクリック](files/restdatasource-app.sql)して完成したアプリケーションをダウンロードします。

## さらに詳しく - 役立つリンク

- [APEX on Autonomous](https://apex.oracle.com/autonomous)
- [APEX コラテラル](https://apex.oracle.com) 
- [チュートリアル](https://apex.oracle.com/en/learn/tutorials) 
- [コミュニティ](https://apex.oracle.com/community)
- [外部サイト + Slack](http://apex.world)

## 謝辞

 - **作成者/投稿者** -  Salim Hlayel, Principle Product Manager
 - **投稿者** - Oracle LiveLabs Team (Arabella Yao, Product Manager Intern | Jaden McElvey, Technical Lead | Jeffrey Malcolm Jr, Intern)
 - **最終更新日** - Ankita Beri, Product Manager, June 2023