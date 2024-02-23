# データベースオブジェクトのREST有効化
## はじめに
このラボでは、スキーマとデータベース・オブジェクトをREST有効化する方法を学びます。

推定時間: 10分 
### 背景情報
このラボでは、EMPとDEPTテーブルを作成し、それらをREST有効化し、同じスキーマ内でアプリケーションを構築します。通常、ローカル・データベースのスキーマではなく、リモート・データベース・スキーマ内のデータベース・オブジェクトをREST有効化し、RESTエンドポイントを生成します。生成されたリモートのRESTエンドポイントを使用して、ローカルのアプリケーション内にRESTデータ・ソースを定義します。
![](images/rest-arch.png " ")
APEXアプリケーションでRESTデータソースが定義されると、APEXエンジンはローカル・データベース・オブジェクトを呼び出す代わりに、リモート・データベースからデータを検索するRESTエンドポイントを呼び出します。 PUT、POST、DELETEなどのハンドラが定義されている場合、APEXアプリケーションはリモート・データベース・オブジェクトに対して更新、挿入、削除などの操作を実行できます。
## タスク1: サンプルテーブルの作成
このラボでは一般的なEMPとDEPTテーブルを使用しています。これらは簡単にサンプル・データセットを使用してインストールできます。
1. ワークスペースにログインします。  
2. メインメニューで、**SQLワークショップ**を選択し、**ユーティリティ**を選択し、**サンプル・データセット**をクリックします。
     ![](images/go-samples.png " ")
3. サンプル・データセットのリストで、**EMP / DEPT**行の**インストール**をクリックします。
     ![](images/install-empdept.png " ")
4. **サンプル・データセット管理**ダイアログで、**次**をクリックします。
     ![](images/manage-sample-dataset.png " ")
5. **サンプル・データセットのロード**ダイアログで、**データセットのインストール**をクリックします。
     ![](images/install-dataset.png " ")
6. **サンプル・データセットのロード - 結果**ダイアログで、**終了**をクリックします。

     注意: テーブルに直接アプリケーションを作成する必要はありません。 
     ![](images/load-results.png " ") 

## タスク2: データベース・オブジェクトのREST有効化  
次のSQLスクリプトを実行すると、スキーマをREST有効化し、EMPおよびDEPTテーブルとEMP\_DEPT\_Vビューのモジュールと適切なハンドラーを作成できます。

または、SQLワークショップ> RESTfulサービスに移動してスキーマをREST有効化して、SQLワークショップ>オブジェクト・ブラウザーに移動し、各テーブル/ビューをクリックし、RESTを選択してRESTサービスを定義できます。ただし、SQLワークショップ>オブジェクト・ブラウザーを使用して作成されたハンドラーは、呼び出されるたびにデータ・ディクショナリ検索を利用します。これは、特に apex.oracle.com などの非常に大規模なデータ・ディクショナリを持つサービスの場合、手動で作成するサービスより効率が低くなります。apex.oracle.comには20,000以上のスキーマがあります。

1. メインメニューで、**SQLワークショップ**を選択し、**SQLスクリプト**をクリックします。 

     ![](images/go-scripts.png " ")  

2. **SQLスクリプト**ページで、**作成 >**をクリックします。

     ![](images/create-script.png " ")  

3. **スクリプト・エディタ**に次の内容を入力します。
    - **スクリプト名:** **Define REST Endpoints for EMP and DEPT**と入力します。
    - **スクリプト・エディタ:** 次の内容を切り取って貼り付けます。

    ```
    <copy>begin
        ords.enable_schema;
    end;
    /

    begin
    ords.delete_module(
        p_module_name => 'emp.rest' );
    ords.define_module(
        p_module_name => 'emp.rest',
        p_base_path => '/emp/' );

    ords.define_template(
        p_module_name => 'emp.rest',
        p_pattern     => 'hol/' );
    ords.define_template(
        p_module_name => 'emp.rest',
        p_pattern     => 'hol/:empno' );

    ords.define_handler(
        p_module_name => 'emp.rest',
        p_pattern     => 'hol/',
        p_method      => 'GET',
        p_source_type => ords.source_type_collection_feed,
        p_source      => 'select * from emp' );
    ords.define_handler(
        p_module_name => 'emp.rest',
        p_pattern     => 'hol/:empno',
        p_method      => 'GET',
        p_source_type => ords.source_type_collection_item,
        p_source      => 'select * from emp where empno = :empno' );
    ords.define_handler(
        p_module_name => 'emp.rest',
        p_pattern     => 'hol/',
        p_method      => 'POST',
        p_source_type => ords.source_type_plsql,
        p_source      => 'begin insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
            values (:empno,:ename,:job,:mgr,:hiredate,:sal,:comm,:deptno);:forward_location:=:empno;:status_code:=201;end;' );
    ords.define_handler(
        p_module_name => 'emp.rest',
        p_pattern     => 'hol/:empno',
        p_method      => 'PUT',
        p_source_type => ords.source_type_plsql,
        p_source      => 'begin update emp set ename=:ename, job=:job, mgr=:mgr, hiredate=:hiredate, sal=:sal, comm=:comm, deptno=:deptno
            where empno=:empno; :forward_location:=:empno;:status_code:=200;end;' );
    ords.define_handler(
        p_module_name => 'emp.rest',
        p_pattern     => 'hol/:empno',
        p_method      => 'DELETE',
        p_source_type => ords.source_type_plsql,
        p_source      => 'begin delete emp where empno=:empno;:status_code:=200;htp.p(''{"status":"success"}'');end;' );
    end;
    /

    begin
    ords.delete_module(
        p_module_name => 'dept.rest' );

    ords.define_module(
        p_module_name => 'dept.rest',
        p_base_path => '/dept/' );

    ords.define_template(
        p_module_name => 'dept.rest',
        p_pattern     => 'hol/' );
    ords.define_template(
        p_module_name => 'dept.rest',
        p_pattern     => 'hol/:deptno' );

    ords.define_handler(
        p_module_name => 'dept.rest',
        p_pattern     => 'hol/',
        p_method      => 'GET',
        p_source_type => ords.source_type_collection_feed,
        p_source      => 'select * from dept' );
    ords.define_handler(
        p_module_name => 'dept.rest',
        p_pattern     => 'hol/:deptno',
        p_method      => 'GET',
        p_source_type => ords.source_type_collection_item,
        p_source      => 'select * from dept where deptno = :deptno' );
    ords.define_handler(
        p_module_name => 'dept.rest',
        p_pattern     => 'hol/',
        p_method      => 'POST',
        p_source_type => ords.source_type_plsql,
        p_source      => 'begin insert into dept (deptno, dname, loc)
            values :deptno,:dname,:loc);:forward_location:=:deptno;:status_code:=201;end;' );
    ords.define_handler(
        p_module_name => 'dept.rest',
        p_pattern     => 'hol/:deptno',
        p_method      => 'PUT',
        p_source_type => ords.source_type_plsql,
        p_source      => 'begin update dept set dname=:dname, loc=:loc
            where deptno=:deptno; :forward_location:=:deptno;:status_code:=200;end;' );
    ords.define_handler(
        p_module_name => 'dept.rest',
        p_pattern     => 'hol/:deptno',
        p_method      => 'DELETE',
        p_source_type => ords.source_type_plsql,
        p_source      => 'begin delete dept where deptno=:deptno;:status_code:=200;htp.p(''{"status":"success"}'');end;' );
    end;
    /

    begin
    ords.delete_module(
        p_module_name => 'empdeptv.rest' );

    ords.define_module(
        p_module_name => 'empdeptv.rest',
        p_base_path => '/empdeptv/' );

    ords.define_template(
        p_module_name => 'empdeptv.rest',
        p_pattern     => 'hol/' );
    ords.define_template(
        p_module_name => 'empdeptv.rest',
        p_pattern     => 'hol/:empno' );

    ords.define_handler(
        p_module_name => 'empdeptv.rest',
        p_pattern     => 'hol/',
        p_method      => 'GET',
        p_source_type => ords.source_type_collection_feed,
        p_source      => 'select * from emp_dept_v' );
    ords.define_handler(
        p_module_name => 'empdeptv.rest',
        p_pattern     => 'hol/:empno',
        p_method      => 'GET',
        p_source_type => ords.source_type_collection_item,
        p_source      => 'select * from emp_dept_v where empno = :empno' );
    end;
    /<copy>
    ```
     *注意: スクリプトを次のURLからも切り取って貼り付けることができます。*  [https://www.oracle.com/technetwork/developer-tools/apex/application-express/apex-hol-rest-enable-5478504.txt](https://www.oracle.com/technetwork/developer-tools/apex/application-express/apex-hol-rest-enable-5478504.txt)

    **実行**をクリックします。

    ![](images/set-scripts.png " ")

4. **スクリプトの実行**ページで、**即時実行**をクリックします。

    ![](images/run-now.png " ")

5. 4つのステートメントが正常に処理されたことを確認します。

     ![](images/script-results.png " ")

## タスク3: RESTサービスの確認  

1. メインメニューで、**SQLワークショップ**を選択し、**RESTfulサービス**をクリックします。

     ![](images/go-restful.png " ")  

3. **ORDS RESTfulサービス**ページで、**モジュール**を展開し、**emp.rest**を展開し、**hol/**を展開します。         
     **GET**をクリックします。

     「クリップボードにコピー」アイコンをクリックします。(または手動で**完全なURL**をコピーします。)

     ![](images/show-get.png " ")  

4. ブラウザーで新しいタブ/ウィンドウを開き、完全なURLを貼り付けます。後で必要になるため、このタブを開いたままにするか、このURLをメモしておきます。

     ![](images/show-data.png " ")  

     *注意: ブラウザーによっては、上記の形式で表示される代わりに生のJSONドキュメントのみが表示される場合があります。*  

## **まとめ**
これでLab 2が完了しました。必要なハンドラーがすべて含まれているデータベース・オブジェクトをREST有効化する方法がわかりました。[Lab 3に移動するにはここをクリック](?lab=lab-3-defining-rest-data-sources)。  

## **謝辞**

 - **作成者/投稿者** -  Salim Hlayel, Principal Product Manager
 - **投稿者** - Oracle LiveLabs Team (Arabella Yao, Product Manager Intern | Jaden McElvey, Technical Lead | Jeffrey Malcolm Jr, Intern)
 - **最終更新日** - Ankita Beri ,Product Manager, June 2023
