# 職務経歴書

## 基本情報

| key            | value                                   |
| -------------- | --------------------------------------- |
| 名前           | 黄　丞涓（ファン　スンヨン）            |
| 生息地         | 埼玉県 川口市                           |
| 年齢           | 30歳                                    |
| メールアドレス | syhwang.web@gmail.com                   |
| 学歴           | 大学卒                                  |
| 英語力         | TOEIC 845点 および アメリカ留学経験あり |
| ポートフォリオ   | [Goaal - タスク管理および共同作業ツール[Go]](https://github.com/SeungyeonHwang/tool-goaal) |
|    | [LOEN - 韓国コスメ専門ECサイト[Ruby on Rails]](https://github.com/SeungyeonHwang/ec-loen) |

## #1 バックエンドエンジニア
<u>I社【2021年03月 ～ 現在に至る】</u>

**【プロジェクト概要】**  
統合ログ管理システムのログ収集モジュール群の中のクラウドサービスに特化した収集モジュールの開発
この集モジュールはクラウドサービスが記録するログデータを収集・加工し、自社開発プロダクトへ格納します。

**【業務内容】**
クラウド連携製品の開発

**【メンバー数】**
４名（サーバサイドチーム）

**【担当フェーズ】**

    製品テスト全般(テストコード作成、単体テスト〜受入テスト)
    メンテナンス(プロファイリング·リファクタリング·クエリチューニング)
    トラブル·シューティング
    バージョンリリース

**【開発内容】**

- 開発・実装①
    - 【概要】
      - クラウドサービスの各種ログ（監査、システム）収集モジュールの開発・設計
    - 【どのような機能の開発・実装か】
      - 外部クラウドサービスのログ取得のための定期的な収集モジュールおよびバージョンアップツール
        - Microsoft Azure/Microsoft 365 (Azure SDK for Java/Microsoft Graph API)
        - SalesForce (SOQL)
    - 【課題・問題点】  
      - 製品の特性上、各クラウドサービスのログ取得API以外の処理が重複し、コードの重複が発生、開発工数が増加
      - 大量のログを扱うため、DB処理がボトルネックとなり、パフォーマンスが大幅に低下
    - 【打ち手・使用した技術】  
      -  ログ取得以外の部分（ユーザー認証情報、バリデーションなど）をMaven Repositoryに共通ライブラリとしてアップロードし、開発工数削減とコード重複解消
      -  Visual VMなどのプロファイリングツールを使用して、ボトルネックになる処理を特定。非効率的なデータ格納をバッチ単位で処理するように変更し、無意味なクエリの乱立や繰り返しをラムダ式、バッチインサートなどでバッチ単位に分けて処理するようにリファクタリング

---
- 開発・実装②
    - 【概要】
        - バージョンアップのためのフレームワーク開発
    - 【どのような機能の開発・実装か】
        - SaaSサービスではなく、オンプレミス環境のパッケージ製品であったため、バージョンアップを個別に行う必要があった
    - 【課題・問題点】
        - 修正事項が発生するたびに、各バージョンでのバージョンアップが正常に行われるかどうかをチェックする必要があり、検証にかかる工数が増加
    - 【打ち手・使用した技術】
        - 順次処理するためのフレームワークを開発  
        1.0 -> 3.0でバージョンアップをする場合、以前は1.0 -> 3.0、2.0 -> 3.0をすべて検証しなければならなかったが、1.0 -> 2.0 -> 3.0で順次バージョンアップを行うように修正したため、テストを1回だけすればよいという利点が生まれ、検証の工数を大幅に下げることができました。

**【開発環境】**

    マルチスレッドプログラミング | 低レイヤファイルI/O技術 | 文字列探索、加工技術 | JUnitテスト、CI(継続的インテグレーション) | REST-API、JSON | OAuth | TCP/UDP | TLS、HTTP(S) | Jenkins
    Java | Kotlin 
    Linux | Windows | VM
    Slack | RedMine | Git

**【役割】バックエンドエンジニア**

    ・ リリース済み製品の新バージョン開発および新規連携製品の開発
        対象クラウドサービスの機能やログ収集方法（SDK、APIなど）の仕様調査
        調査内容に基づいて開発内容を決定し、設計・実装・テストを行う
        製品マニュアルやリリースドキュメントの作成
        製品サポートチームからのエスカレーション対応
    ・ クラウドサービスや製品仕様の調査
        再現検証、ワークアラウンド検証、原因調査

**【仕事を通して学んだこと】**

    (1) 責任感
    他のチームメンバーが私の完了したタスクについてｋ詳しくは知らないので、私に尋ねたり、私が共有したときに勉強になったと言われたときにやりがいを感じることができました。
    この過程で自分のタスクを責任を持って最後まで遂行することが重要だと実感しました。もちろん助けを求めたり提供することもできますが、基本的に自分の担当分は自分が責任を持っ姿勢が大切だと思いました。

    (2) 積極性
    セールスフォースの性能検証をする時、ApexとPythonをㅇｍ用いて大量のログを収集できるログ収集ツールをｔ作ったり、Visual VMをIntellijと連動してプロファイリングを行う等、今まで使われていなかった方法を提案したことがあります。
    長年の経験があってもすべてを知っているわけではないため、自分が考えたより良いソリューションがある場合は積極的に提案したり、チームと共有することで互いに成長できると思いました。
    自分で調べたり検証した内容をチームメンバーに論理的に説明することが重要だと考えるため、常に根拠を持つことで技術的にもエンジニアとして成長し、同時にコミュニケーション能力も向上すると感じました。

## #2 バックエンドエンジニア
<u>U社【2021年03月 ～ 2022年02月】</u>

**【業務内容】**
**BtoBのSalestechプロダクトを開発「個人の位置情報とGISシステムを組み合わせたクラウド型の営業支援ツール」**

**【担当フェーズ】**

    事業拡大による新規開発全般（サーバサイド）　(アジャイル/スクラム)	
    メンテナンス（性能改善·リファクタリング）
    トラブル·シューティング
    システム運用監視(Azure)
    バージョンリリース

**【開発内容】**

- 開発・実装①
    - 【概要】
      - バッチ処理の開発・設計 
    - 【どのような機能の開発・実装か】
      - 外部CRM情報との情報同期のための定期インポート処理
        - SalesForce (SOQL)
        - Microsoft Dynamics365 (Web API)
    - 【課題・問題点】
      - バッチ処理のレコード差分を得るためにインポート処理で臨時テーブルを準備して比較しましたが、読み書きの頻度が高くなるとDBのストレージパーセントが増加し、結果負荷が増加やアプリが重くなるなどの問題が発生。(postgresSQLの仕様上、デッドチュープル発生)  
    - 【打ち手・使用した技術】
      - Redisを導入し、差分比較をRedis上で行い（SDIFF）、結果値だけをDBに保存するように改善(メモリが消えた場合も動くように実装)
      - 優先度の低いオブジェクトのバッチ処理を2つの部分に分けてそれぞれ違う頻度でインポートされるようにバッチ処理を再設計  
---
- 開発・実装②
    - 【概要】
        - 検索のAPIの性能低下
    - 【どのような機能の開発・実装か】
        - CRMに登録された取引先、リード、商談などのレコードがバッチ処理を通じてDBに保存された状態で、このレコードを各種条件で検索するできる機能
    - 【課題・問題点】
        - ほとんどのエンドユーザーは大企業であるため、検索対象のレコード数が多くなり、検索APIの応答速度が遅くなったりエラーが発生したりする問題発生
    - 【打ち手・使用した技術】
        - 既存の検索APIの性能改善のためにElastic Searchを導入
        - 既存のSQLクエリをElastic Search特有のクエリに変更（must、should、termなど）
        - RDB → Logstash → Elastic Searchの自動データ投入の仕組み

**【開発環境】**

    Kotlin | SpringBoot | PostgreSQL | SalseForce / Microsoft API | GraphQL | Docker | OAuth | Azure | Redis | Elastic Search | Jira | Teams, Slack, Google Meet | Git

**【メンバー数】**

４名（サーバサイドチーム）

**【役割】バックエンドエンジニア**

    主なタスクとしては自社サービスであるBtoBのSalestechプロダクトを開発·運用する役割でした。
    既存サービスのマルチプラットフォーム化やAPIの設計・開発を行い、
    サービス改善のためのソリューションを提案しました。
    また、サービスが支障なく運営されるよう性能改善やクラウド上のDB負荷の増加などを監視しました。

**【仕事を通して学んだこと】**

    (1) 自主性
    自社サービスの開発は発注元がないため、サービスの改善や課題について自主的に考えて行動することが求められる環境でした。単純に言われたことを開発するのではなく、自ら課題を見つけ、提案することが多かったです。
    その過程でProduct Ownerと先輩エンジニアを説得したり設計について説明したりすることが多かったです。
    以上の経験より、自分の考えを論理的に説明する能力を身につけることができました。

    (2) コミュニケーション能力

    業務は設計から実装、テストまで全てを行いましたが、時には自力で解決できない問題もありました。この時は問題を解決するために他のベテランエンジニアを巻き込んだり有識者に質問したりして問題を解決しました。
    また、お互いの認識違いによる手戻りが発生しないように積極的にコミュニケーションをとるように努力しました。

    (3) チーム意識
    少人数の開発チームだったので自分のタスクも重要ですが、他のエンジニアがどんな作業をしてどんな問題を解決したいのかにも興味を持つようにしました。
    当時開発したプロダクトはSalesForceの仕様を理解しないと開発できなかったので、他の人が何の目的で開発しているのかをよく理解し、分からないことがあれば積極的に質問するようにしました。 
    また、個人ではなくチームとして仕事を進める文化だったので、スプリント終了後には必ず振り返りを行って問題のあった部分をお互いに話し合い、改善するために次のアクションを決めました。

**【仕事で大変だったこと】**
    
    大変だったことは、実際にリリースされているサービスを開発するということで、常に顧客に与える影響を考えて開発しなければならないということでした。
    最初に経験した開発環境は、リリース前の業務系システムだったので最初には大変だと思いました。
    既存のサービスを改善していくことも大事ですが、顧客の立場では細かい変更もディグレとして感じられるため、開発と同時にビジネスサイドのバランスを取ることも重要だと感じました。
    また顧客の問い合わせからのトラブルシューティングも難しかったです。
    クラウド上のログを調べて原因を特定するには仕様についての理解も必要だったので、最初は仕様の理解のためにアプリを生活で直接使いながら仕様を理解するように努力しました。

## #3 バックエンドエンジニア
<u>H社【2020年02月 ～ 2021年02月】</u>

**【業務内容】**
**オフィス家具メーカーI社の受発注システム開発**

**【担当フェーズ】**

    - 新規開発全般（サーバサイド）　(アジャイル/スクラム)	
    - 新メンバーのフォロー

**【開発内容】**

- 開発・実装①
    - 【概要】
        - テストのためのダミーデータの準備および自動テストコードの作成
    - 【どのような機能の開発・実装か】
        - 「H2」という内蔵DBを使う形で、正常系、異常系に分けてそれぞれのAPIの動作を確認しました。 プロダクトに想定以外の事象がないかを確認するための実装です。
    - 【課題・問題点】
        - パターン漏れやテストケースが難解で見る側がわかりにくい問題がありました。
    - 【打ち手・使用した技術】
        - テストシナリオを設計してチームに共有してフィードバックを頂いた後に実装して漏れがないようにしました。 特にテストパターンの作り方について周りの先輩エンジニアに質問したりして身につけるように努力しました。 
        - また、何の目的でテストするのかどのようなポイントをテストしたいのかを見る側も分かりやすいように設計しました。
---
- 開発・実装②
    - 【概要】
        - 検索APIの設計、実装
    - 【どのような機能の開発・実装か】
        - 家具の発注状態を検索するためのAPIで各種配送状態、決済状態等、物流全般の情報が含まれます。
    - 【課題・問題点】
        - 仕様を完全に理解せずに開発して手戻りが頻繁に発生し、
        - 約束した納期に間に合わない問題が発生
    - 【打ち手・使用した技術】
        - 仕様に対する理解不足を解消するため、物流プロセスに関する書籍を読みながら勉強する
        - 手戻りを減らすために作業前にやることを先に洗い出して作業を進む（レビューをいただく）。
        - 開発遅延の原因を解るように「なぜなぜ分析」を行う。

**【開発環境】**

    Java | Groovy | SQL | Micronaut | Spock | Git ＆ GitLab | Docker | PostgreSQL
  
**【メンバー数】**  

    ４名（発注チーム）

**【役割】プログラマー**

    主なタスクとしてはプロダクトオーダー（PO）からの仕様説明を徹底的に聞いて
    仕様どおりにAPIの内部ロジックを実装、
    またはビジネスロジックの自動テストのためのテストコードを作成する役割でした。

**【仕事を通して学んだこと】**

    (1) 課題を見つけ、解決のためのプロセスを選択し、新しい価値を生み出すこと。

    日々やることはスプリントプラニング段階で詳細化しておくため、
    かなり明確ですが、私が担当した教務以外にもDBでの無駄なSQLが乱立して性能が低下されたり、ジャンクインサートの速度の問題点を見つけて、その単位を1000行ずつ読み取る形に変えたりしてアプリケーションの性能に貢献できるようにしました。

    この過程で公式ドキュメンタリーを参照して解決するように努力しました。(OpenCSV、Micronautなど) それらを読み込んでからコードを書き始めましたが、 分からないところが沢山ありましたので日本語、韓国語、英語を問わずグーグルで調べながらコードを書きました。 (Qiita、stackoverflowなど)
    自力で解決できそうにない問題である場合もすぐに諦めることではなく、開発リーダーやシニアエンジニアに質問し、工数を減らすことと共にアプリケーションのクォリティを上げることに貢献できるようにしました。

    (2) 日々、スキルを伸ばす努力

    毎日必要な部分を自習しておりますので、 個人的に技術的な疑問や提案があれば共有して皆が見られることができた方が良いと思い、プロジェクトマネージャに提案しました。 結果的にスラックのチャンネルが作られて全ての開発メンバーが必要な内容を質問したり回答したりすることができるようになりました。

**【仕事で大変だったこと】**

    開発作業を行う際に大変だったところは、開発側と設計側の認識のずれに伴い、仕様が大きく変わったり、 影響を及ぼす範囲が広くなって工数が増えてしまったりしたことでした。 また、実際に開発を始めないとどれくらい時間がかかるのかそれを開発に着手する前に把握するのが難しかったのですごく勉強になりました。下記の解決方法をTryとして実行していきたいと思います。

    過去の作業時間を振り返って逆算して所要時間を出す。
    全体会議や無駄話で時間が延びる時があるので少しのバッファを追加する。
    タスクを詳細化する際に全員と話しをすることで見積もりに甘いところを見つける可能性が高めること。
