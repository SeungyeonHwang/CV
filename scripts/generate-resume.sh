#!/bin/bash

# 履歴書生成スクリプト
echo "📄 履歴書生成開始..."

# 1. 基本情報設定
OUTPUT_DIR="./output"
COMBINED_FILE="$OUTPUT_DIR/resume-complete.md"
PDF_FILE="$OUTPUT_DIR/resume-complete.pdf"

# 2. 出力ディレクトリ生成
mkdir -p "$OUTPUT_DIR"

# 3. 統合マークダウンファイル生成
echo "🔄 マークダウンファイル統合中..."

# README.md 内容追加 (docs/ リンク削除) - 最上部のタイトルをそのまま使用
# 最初の行 # 職務経歴書 の後に生成日を追加
head -1 README.md > "$COMBINED_FILE"
echo "" >> "$COMBINED_FILE"
echo "_**生成日**: $(date '+%Y年%m月%d日')_" >> "$COMBINED_FILE"
echo "" >> "$COMBINED_FILE"
tail -n +2 README.md | sed '/\*\*詳細情報\*\*:/d' >> "$COMBINED_FILE"
echo "" >> "$COMBINED_FILE"

# 各ドキュメントファイル内容追加
docs_files=(
    "docs/S社_AI連携企業材料データベース検索システム.md"
    "docs/C社_AI音声プラットフォーム開発.md"
    "docs/I社_統合ログ管理システム.md"
    "docs/U社_BtoB営業支援SaaS.md"
    "docs/H社_オフィス家具受発注システム.md"
)

for file in "${docs_files[@]}"; do
    if [ -f "$file" ]; then
        echo "📄 $file 追加中..."
        echo "---" >> "$COMBINED_FILE"
        echo "" >> "$COMBINED_FILE"
        
        # ファイル名から会社名抽出
        company=$(basename "$file" | cut -d'_' -f1)
        echo "# $company 詳細情報" >> "$COMBINED_FILE"
        echo "" >> "$COMBINED_FILE"
        
        cat "$file" >> "$COMBINED_FILE"
        echo "" >> "$COMBINED_FILE"
    fi
done

echo "✅ マークダウンファイル生成完了: $COMBINED_FILE"

# 4. HTML生成 (pandoc 使用)
if command -v pandoc &> /dev/null; then
    echo "🔄 HTML 生成中..."
    
    # スタンドアロンHTMLを生成（日本語対応）
    pandoc "$COMBINED_FILE" -o "${PDF_FILE%.pdf}.html" \
        --standalone \
        --metadata title="職務経歴書 - 黄 丞涓（ファン スンヨン）" \
        --metadata lang=ja \
        --toc \
        --toc-depth=2 \
        --from=markdown+raw_html \
        --template=<(cat <<'EOF'
<!DOCTYPE html>
<html lang="$lang$">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <title>$title$</title>
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Hiragino Sans", "Hiragino Kaku Gothic ProN", "メイリオ", sans-serif;
      line-height: 1.8;
      color: #333;
      max-width: 900px;
      margin: 0 auto;
      padding: 2rem;
      background: #fff;
    }
    div[data-align="center"] {
      text-align: center;
    }
    ul li {
      margin-bottom: 0.5em;
    }
    /* 特定セクションの中央揃え */
    h2#黄-丞涓ファン-スンヨン,
    h2#黄-丞涓ファン-スンヨン + p,
    h2#黄-丞涓ファン-スンヨン + p + p,
    h3#お問い合わせ,
    h3#お問い合わせ + p,
    h3#お問い合わせ + p + p {
      text-align: center;
    }
    h1, h2, h3, h4 {
      color: #2c3e50;
      margin-top: 1.5em;
    }
    h1 {
      border-bottom: 3px solid #3498db;
      padding-bottom: 0.5em;
    }
    h2 {
      border-left: 4px solid #3498db;
      padding-left: 0.5em;
    }
    table {
      border-collapse: collapse;
      width: 100%;
      margin: 1em 0;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }
    th {
      background-color: #f8f9fa;
    }
    code {
      background: #f4f4f4;
      padding: 2px 4px;
      border-radius: 3px;
    }
    pre {
      background: #f4f4f4;
      padding: 1em;
      border-radius: 5px;
      overflow-x: auto;
    }
    blockquote {
      border-left: 4px solid #3498db;
      padding-left: 1em;
      margin-left: 0;
      color: #666;
    }
    @media print {
      body {
        font-size: 12pt;
      }
      h1 {
        page-break-after: avoid;
      }
      h2, h3, h4 {
        page-break-after: avoid;
      }
      table {
        page-break-inside: avoid;
      }
    }
  </style>
</head>
<body>
$if(toc)$
<nav id="$idprefix$TOC" role="doc-toc">
<h2>目次</h2>
$table-of-contents$
</nav>
$endif$
$body$
</body>
</html>
EOF
)
    
    if [ $? -eq 0 ]; then
        echo "✅ HTML 生成完了: ${PDF_FILE%.pdf}.html"
        echo ""
        echo "💡 PDFに変換するには、生成されたHTMLファイルをブラウザで開いて印刷→PDFとして保存してください。"
    else
        echo "❌ HTML生成中にエラーが発生しました。"
    fi
else
    echo "⚠️  pandocがインストールされていないため、変換をスキップします。"
    echo "インストール方法: brew install pandoc"
fi

# 5. ファイルサイズ及び情報出力
echo ""
echo "📊 生成されたファイル情報:"
echo "- マークダウン: $(wc -l < "$COMBINED_FILE") 行"
if [ -f "$PDF_FILE" ]; then
    echo "- PDF: $(du -h "$PDF_FILE" | cut -f1)"
fi

echo ""
echo "🎉 履歴書生成完了！"
echo "📁 出力位置: $OUTPUT_DIR"