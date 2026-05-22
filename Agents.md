# 项目上下文与 AI 行为准则 (Global AI Rules)

这是为所有 AI 辅助工具（Claude Code, Copilot CLI, Antigravity CLI）准备的全局统一说明书。

---

## 技术栈 (Tech Stack)
优先使用现代流行的Python/Vue技术栈, 包括但不限于:
*   **后端技术栈** : Python3 / FastAPI / UV / PostgreSQL
*   **Frontend**：Vue3 / Typescript / Vite / Pnpm

---

## 设计原则
优先遵循优秀工程实践：
- SOLID
- DRY
- KISS
- YAGNI
- Separation of Concerns
- High Cohesion, Low Coupling

## 文档优先
* 修改代码时同步更新文档和注释
* 复杂逻辑必须注释“为什么这样做”

---

## 语言偏好
* 默认使用简体中文
* 技术术语, 代码, 配置项, 协议名等保持英文
* 注释、README、设计文档尽量使用中文

## Git工作流

* 完成一个独立功能后及时提交 Git
* commit message 说明“做了什么”和“为什么做”
* commit message 要使用emoji提高可读性

## 日志

* 关键流程有日志
* 错误有完整上下文

