# U社 - BtoB営業支援SaaS

## 基本情報

| 項目 | 詳細 |
|------|------|
| **期間** | 2021年2月 - 2022年2月 |
| **職種** | バックエンドエンジニア |
| **チーム規模** | 4名（アジャイル開発） |
| **役割** | バックエンドエンジニア - API開発・パフォーマンス最適化担当 |

---

## 技術スタック

```
Kotlin • Spring Boot • PostgreSQL • Redis • Elasticsearch • Azure • GraphQL
MS Dynamics 365 • Salesforce • CRM連携
```

---

## プロジェクト概要

> 営業支援SaaSプロダクトのバックエンドAPI開発を担当。Salesforce/MS Dynamics 365との双方向データ同期機能とGraphQL APIを実装し、営業データ管理の効率化を実現。

---

## 主な実装と成果

### 課題と解決策

### パフォーマンス最適化

| 課題 | 解決策 | 結果 |
|------|--------|------|
| **APIレスポンスの遅延** | Kotlin Coroutinesによる非同期並行処理 | **応答性能の大幅改善** |
| **大量営業データの検索性能** | Elasticsearch全文検索の導入・最適化 | **検索速度の向上** |
| **CRM同期のボトルネック** | Redis SDIFFによる差分同期処理 | **同期処理の効率化** |


### CRM連携API開発

| 課題 | 解決策 | 結果 |
|------|--------|------|
| **複数CRMプラットフォーム対応** | Salesforce/MS Dynamics 365統一APIの設計 | **開発効率の向上** |
| **クライアントのCRMデータ更新** | GraphQL APIによるリアルタイム同期 | **データ反映の高速化** |

---

## 技術的な工夫・改善

<table>
<tr>
<td valign="top" width="50%">

### データ処理基盤構築
- **ELKスタック**: Logstashパイプラインによるデータ連携
- **Kotlin Coroutines**: 非同期処理による並行API処理
- **Redis SDIFF**: CRMデータの差分同期最適化

</td>
<td valign="top" width="50%">

### CRM統合実装
- **双方向同期**: Salesforce/MS Dynamics 365連携
- **API設計**: GraphQLによる型安全な実装
- **データ整合性**: リアルタイム同期機構

</td>
</tr>
</table>

---

## 技術的な成果・貢献

```diff
+ GraphQL APIによる柔軟なデータ取得で、クライアント側の体験が大幅に向上
+ Kotlin Coroutinesによる非同期処理で、高負荷環境でも安定稼働を実現
+ Elasticsearch導入により、大規模営業データの高速検索が可能に
+ Salesforce/MS Dynamics 365の統一API実装により、マルチCRM対応を効率化
+ Logstashパイプライン構築により、リアルタイムデータ連携基盤を確立
+ 負荷テストに基づくAPI仕様策定により、本番環境での安定稼働を実現
```