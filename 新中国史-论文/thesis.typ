// --- 1. 字体设置 ---

// 设置字体栈：
// 英文在前，中文在后。
// Typst 会先尝试用 Times New Roman 渲染，
// 如果字符（如中文）不在该字体中，则自动回退到 仿宋。
#let en_font = "Times New Roman"
#let zh_font = "FangSong" // 你的系统需要安装“仿宋”字体
#let font_stack = (en_font, zh_font)

// --- 2. 中文号数与磅数 (pt) 对应关系 ---
// 三号 = 16pt
// 小三 = 15pt
// 小四 = 12pt

// --- 3. 设置全局正文样式 ---
#set text(
  font: font_stack,
  size: 12pt, // 正文 (小四)
  lang: "zh", // 启用中文排版规则
)
#set par(
  leading: 1.5em, // 1.5 倍行距
  first-line-indent: 2em, // 首行缩进 2 字符
)

// --- 4. 设置标题 (一级) ---
// 标题：仿宋，三号 (16pt)，加粗，居中
#show heading.where(level: 1): it => {
  set text(font: font_stack, size: 16pt, weight: "bold")
  align(center, it)
}

// --- 5. 设置分节标题 (二级) ---
// 分节标题：仿宋，小三 (15pt)，加粗
#show heading.where(level: 2): it => {
  set text(font: font_stack, size: 15pt, weight: "bold")
  it
}

#show heading.where(level: 3): it => {
  set text(font: font_stack, size: 14pt, weight: "bold")
  it
}

/* --- 以下是示例文本 --- */

= 这是主标题 (Main Title)

这是正文，使用仿宋小四字体。这段文字会自动首行缩进两个字符，并且设置了 1.5 倍行距。This part is English, and it should automatically render in Times New Roman.

这是第二段正文。它同样遵循正文的排版规则。

== 这是一个分节标题 (Section 1)

这里是第一节的内容。Typst 的混合排版能力非常出色。

=== 哈哈

== 第二个分节标题 (Section 2)

这里是第二节的内容，用于展示格式。
