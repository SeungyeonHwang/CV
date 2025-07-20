#!/bin/bash

# 履歴書生成スクリプト
echo "📄 履歴書生成開始..."

# スクリプトのディレクトリを取得
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"

# プロジェクトルートに移動
cd "$PROJECT_ROOT"

# 1. 基本情報設定
OUTPUT_DIR="./output"
COMBINED_FILE="$OUTPUT_DIR/resume-complete.md"
HTML_FILE="$OUTPUT_DIR/resume-complete.html"
PDF_FILE="$OUTPUT_DIR/resume-complete.pdf"

# 2. 出力ディレクトリ生成
mkdir -p "$OUTPUT_DIR"

# 3. 統合マークダウンファイル生成
echo "🔄 マークダウンファイル統合中..."

# README.md 内容追加 (docs/ リンク削除) - 最上部のタイトルをそのまま使用
# 最初の行 # 職務経歴書 の後に生成日を追加
head -1 README.md > "$COMBINED_FILE"
echo "" >> "$COMBINED_FILE"
echo "_**作成日**: $(date '+%Y年%m月%d日')_" >> "$COMBINED_FILE"
echo "" >> "$COMBINED_FILE"
# 改行を保持しながらREADMEを追加
tail -n +2 README.md | sed '/\*\*詳細情報\*\*:/d' | sed 's/^$/\n/' >> "$COMBINED_FILE"
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
    pandoc "$COMBINED_FILE" -o "$HTML_FILE" \
        --standalone \
        --metadata title="職務経歴書 - 黄 丞涓（ファン スンヨン）" \
        --metadata lang=ja \
        --toc \
        --toc-depth=2 \
        --from=markdown+raw_html+lists_without_preceding_blankline \
        --template=<(cat <<'EOF'
<!DOCTYPE html>
<html lang="$lang$">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <title>$title$</title>
  <style>
    body {
      font-family: "Hiragino Kaku Gothic ProN", "Hiragino Sans", "メイリオ", "Noto Sans CJK JP", sans-serif;
      font-size: 10.5pt;
      line-height: 1.4;
      color: #333;
      max-width: 210mm;
      margin: 0 auto;
      padding: 8mm 12mm;
      background: #fff;
    }
    /* 目次スタイル */
    #TOC {
      page-break-after: always;
      min-height: 80vh;
    }
    #TOC h2 {
      font-size: 18pt;
      text-align: center;
      margin-bottom: 2em;
      border-bottom: 3px solid #3498db;
      padding-bottom: 0.5em;
    }
    #TOC ul {
      list-style: none;
      padding-left: 0;
    }
    #TOC > ul > li {
      margin-bottom: 1em;
      font-weight: bold;
      font-size: 11pt;
    }
    #TOC > ul > li > a {
      color: #2c3e50;
      text-decoration: none;
    }
    #TOC ul ul {
      padding-left: 2em;
      margin-top: 0.5em;
    }
    #TOC ul ul li {
      margin-bottom: 0.3em;
      font-weight: normal;
      font-size: 10pt;
    }
    #TOC ul ul li a {
      color: #555;
    }
    #TOC a:hover {
      color: #3498db;
      text-decoration: underline;
    }
    /* 会社経歴部分を2列表示 */
    #TOC > ul > li:nth-child(2),
    #TOC > ul > li:nth-child(3),
    #TOC > ul > li:nth-child(4),
    #TOC > ul > li:nth-child(5),
    #TOC > ul > li:nth-child(6) {
      width: 48%;
      display: inline-block;
      vertical-align: top;
      margin-bottom: 1em;
    }
    #TOC > ul > li:nth-child(2),
    #TOC > ul > li:nth-child(4),
    #TOC > ul > li:nth-child(6) {
      margin-right: 2%;
    }
    div[data-align="center"] {
      text-align: center;
    }
    ul li {
      margin-bottom: 0.3em;
      display: list-item;
      list-style-position: outside;
    }
    /* 特定セクションの中央揃え */
    h2#黄-丞涓ファン-スンヨン,
    h2#黄-丞涓ファン-スンヨン + p,
    h2#黄-丞涓ファン-スンヨン + p + p,
    h3#連絡先,
    h3#連絡先 + p,
    h3#連絡先 + p + p {
      text-align: center;
    }
    h3 {
      font-size: 13pt;
    }
    h4 {
      font-size: 11pt;
    }
    p {
      font-size: 10.5pt;
      margin: 0.5em 0;
      white-space: normal;
    }
    h1, h2, h3, h4 {
      color: #2c3e50;
      margin-top: 1em;
      margin-bottom: 0.6em;
      font-weight: 600;
    }
    h1 {
      font-size: 18pt;
      border-bottom: 3px solid #3498db;
      padding-bottom: 0.5em;
      margin-top: 0;
    }
    h2 {
      font-size: 15pt;
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
      padding: 6px 8px;
      text-align: left;
      font-size: 8.5pt;
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
    /* 保有スキル・知識セクションの改ページを削除 */
    /* h2#保有スキル知識 {
      page-break-before: always;
    } */
    /* 職務経歴書ページのみスペーシング調整 */
    h2#職務要約 {
      margin-top: 1em;
      margin-bottom: 1em;
    }
    /* 職務要約の各段落を균등하게 */
    h2#職務要約 ~ p {
      margin: 1em 0;
      line-height: 1.6;
    }
    h2#職務要約 + p {
      margin-top: 0.8em;  /* 첫 단락은 제목과 가까이 */
    }
    /* 代表的な成果 섹션 */
    p:has(strong:contains("代表的な成果")) {
      margin-top: 1.5em;
      margin-bottom: 0.8em;
      font-weight: bold;
    }
    /* 成果リスト */
    p:has(strong:contains("代表的な成果")) + ul {
      margin: 0.8em 0 1.5em 0;  /* 하단 여백 추가 */
    }
    p:has(strong:contains("代表的な成果")) + ul li {
      margin-bottom: 0.5em;  /* 각 항목 간격 약간 축소 */
      line-height: 1.5;
    }
    /* スキルセットテーブルの前に余白追加 - 축소 */
    h2#スキルセット {
      margin-top: 1.8em;  /* 2.5em에서 축소 */
      margin-bottom: 0.8em;
    }
    /* スキルセットテーブルのスタイル調整 */
    h2#スキルセット + table {
      margin-top: 0.5em;
      margin-bottom: 1em;
    }
    h2#スキルセット + table td {
      vertical-align: top;
      padding: 10px 12px;
    }
    h2#スキルセット + table h3 {
      margin-top: 0;
      margin-bottom: 0.5em;
      font-size: 11pt;
    }
    /* スキルセットテーブル内のリスト項目フォントサイズ */
    h2#スキルセット + table ul li {
      font-size: 8.5pt;  /* 메인 크기 유지 */
      margin-bottom: 0.4em;
      line-height: 1.3;
    }
    /* リスト内の強調部分（言語名）は通常サイズ */
    h2#スキルセット + table ul li strong {
      font-size: 8.5pt;
    }
    /* 言語説明部分（インデントされた2行目）を小さく */
    h2#スキルセット + table ul li {
      white-space: pre-line;
    }
    h2#スキルセット + table ul li::first-line {
      font-size: 8.5pt;
    }
    /* Markdownの인덴트된 부분을 작게 표시 */
    h2#スキルセット + table ul ul li,
    h2#スキルセット + table ul li > br + *,
    h2#スキルセット + table ul li > p {
      font-size: 7pt !important;
      color: #555;
      margin-left: 1em;
    }
    /* 会社詳細情報（H1タイトル）の改ページ */
    h1#s社---ai連携企業材料データベース検索システム開発,
    h1#c社---ai音声プラットフォーム開発プロジェクト,
    h1#i社---統合ログ管理システム-クラウド連携モジュール開発,
    h1#u社---btob営業支援saasプロダクト開発,
    h1#h社---オフィス家具メーカー向け受発注システム開発 {
      page-break-before: always;
    }
    @media print {
      body {
        font-size: 10pt;
        padding: 8mm 12mm;
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
<h2>📑 目次</h2>
$table-of-contents$
</nav>
$endif$
$body$
</body>
</html>
EOF
)
    
    if [ $? -eq 0 ]; then
        echo "✅ HTML 生成完了: $HTML_FILE"
        
        # PDF生成試行
        echo ""
        echo "🔄 PDF 生成中..."
        
        # Chromeがインストールされているか確認（ヘッドレスPDF生成）
        if [ -d "/Applications/Google Chrome.app" ]; then
            echo "🔄 Chrome ヘッドレスモードでPDF生成中..."
            /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
                --headless \
                --disable-gpu \
                --print-to-pdf="$PDF_FILE" \
                --no-pdf-header-footer \
                --print-to-pdf-no-header \
                "file://$PWD/$HTML_FILE" 2>/dev/null
            
            if [ $? -eq 0 ] && [ -f "$PDF_FILE" ]; then
                echo "✅ PDF 生成完了: $PDF_FILE"
            else
                echo "⚠️  PDF生成に失敗しました。"
                echo "💡 代替案: HTMLファイルをブラウザで開いて印刷→PDFとして保存してください。"
            fi
        else
            # XeLaTeXがインストールされているか確認
            if command -v xelatex &> /dev/null; then
                pandoc "$COMBINED_FILE" -o "$PDF_FILE" \
                    --pdf-engine=xelatex \
                    --variable mainfont="Hiragino Sans" \
                    --variable papersize=a4 \
                    --variable geometry:margin=2cm \
                    --toc \
                    --toc-depth=2 2>/dev/null
                
                if [ $? -eq 0 ]; then
                    echo "✅ PDF 生成完了: $PDF_FILE"
                else
                    echo "⚠️  PDF生成に失敗しました。"
                    echo "💡 代替案: HTMLファイルをブラウザで開いて印刷→PDFとして保存してください。"
                fi
            else
                echo "⚠️  PDF生成ツールがインストールされていません。"
                echo "💡 推奨: HTMLファイルをブラウザで開いて印刷→PDFとして保存"
                echo ""
                echo "📌 手動でPDFを作成する方法:"
                echo "  1. open $HTML_FILE"
                echo "  2. Cmd + P (印刷)"
                echo "  3. 'PDFとして保存'を選択"
            fi
        fi
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
echo "- HTML: $(du -h "$HTML_FILE" | cut -f1)"
if [ -f "$PDF_FILE" ]; then
    echo "- PDF: $(du -h "$PDF_FILE" | cut -f1)"
fi

echo ""
echo "🎉 履歴書生成完了！"
echo "📁 出力位置: $OUTPUT_DIR"