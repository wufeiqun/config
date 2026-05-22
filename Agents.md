# Global AI Rules & Context

## 1. Tech Stack
*   **Backend**: Python 3 / FastAPI / UV / PostgreSQL
*   **Frontend**: Vue 3 / TypeScript / Vite / pnpm

## 2. Design Principles
遵循以下工程实践，拒绝过度设计：
*   **SOLID**、**DRY**、**KISS**、**YAGNI**
*   **Separation of Concerns** (关注点分离)
*   **High Cohesion, Low Coupling** (高内聚，低耦合)

## 3. Language & Localization
*   **主体语言**: 默认使用简体中文（注释、README、设计文档）。
*   **专业术语**: 技术术语、代码、配置项、协议名等保持英文原文，切勿翻译。

## 4. Coding & Logging Rules
*   **文档同步**: 修改代码时，必须同步更新相关文档和注释。
*   **意图注释**: 复杂逻辑必须写明注释，解释“为什么这样做（Why）”，而非“做了什么（What）”。
*   **日志规范**: 关键流程必须埋点日志，错误日志必须包含完整的 Context。

## 5. Git Workflow
完成独立功能后及时提交，`commit message` 规范如下：
*   **格式**: `[Emoji] [动词] 简短说明`
*   **内容**: 必须说明“做了什么”和“为什么做”。
