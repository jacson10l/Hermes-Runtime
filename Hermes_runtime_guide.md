# Hermes Genesis v4

## AI-Native Context Engineering System

> Hermes v4 不再是传统 PM 框架。
>
> 它是：
>
> - AI 长期工程记忆系统
> - Context Compression Layer
> - Skill Injection Runtime
> - Agent Governance Protocol
>
> 核心目标：
>
> 1. 极低 token 消耗
> 2. 长期 AI 协作
> 3. 动态上下文加载
> 4. 多 Agent 兼容
> 5. relevance retrieval
> 6. summary-first memory
>
> 适用于：
>
> - Claude
> - GPT
> - Cursor
> - Kiro
> - Windsurf
> - Gemini
> - 任意 AI Coding Agent

---

# 核心原则

## 1. 永远不要全量加载上下文

错误：

```text
读取全部 ADR
读取全部 Retro
读取全部 Ticket
```

正确：

```text
runtime
→ retrieval
→ relevant summaries
→ relevant skills
```

---

## 2. Summary First

AI 默认只读取：

- summary
- indexes
- active context

只有需要时才展开 archive。

---

## 3. Skills 必须动态加载

禁止：

```text
一个超级 skills.md
```

必须：

```text
按领域拆分 skills
按需注入
```

---

## 4. 历史默认归档

archive 永远不自动进入 prompt。

---

## 5. AI 的上下文预算是有限资源

所有文档设计必须：

- 极短
- 可压缩
- machine-readable
- relevance friendly

---

# AI 执行指令

AI agent 在初始化 Hermes v2 时必须：

1. 创建完整目录结构
2. 创建 runtime
3. 创建 retrieval index
4. 创建 summary memory
5. 创建 modular skills
6. 创建 agent roles
7. 创建 context budget rules

---

# 目录结构

```text
hermes/
├── runtime/
│   ├── current-state.yaml
│   ├── active-context.md
│   └── context-budget.yaml
│
├── memory/
│   ├── summaries/
│   ├── episodic/
│   └── archive/
│
├── retrieval/
│   ├── adr-index.md
│   ├── memory-index.md
│   └── skill-index.md
│
├── skills/
│   ├── architecture/
│   ├── backend/
│   ├── frontend/
│   ├── websocket/
│   ├── testing/
│   ├── security/
│   └── deployment/
│
├── agents/
│   ├── architect.md
│   ├── implementer.md
│   ├── reviewer.md
│   └── qa.md
│
├── tickets/
│   └── active/
│
└── scripts/
```

---

# Runtime Layer

## current-state.yaml

这是唯一永远自动注入的文件。

必须保持：

# < 300 tokens

示例：

```yaml
project: polymarket-trading-system

current_ticket: websocket-reconnect

phase: realization

active_goal: stabilize websocket reconnect logic

active_constraints:
  - single websocket ownership
  - max reconnect 5
  - no duplicate subscriptions

active_skills:
  - websocket/reconnect
  - backend/state-machine

active_agents:
  - implementer
  - reviewer
```

---

# Context Budget

## context-budget.yaml

```yaml
system_prompt: 1200

runtime: 300

active_ticket: 2000

skills: 2000

memory_summary: 1000

diff_context: 3000

hard_limit: 12000
```

---

# Summary Memory System

## memory/summaries/

每个 ticket 必须生成：

```text
<ticket>-summary.md
```

限制：

# ≤ 300 tokens

结构：

```markdown
# websocket-reconnect-summary

## decisions

- unified websocket manager
- heartbeat 15s

## pitfalls

- reconnect race condition

## constraints

- single ownership only

## related

- adr-0002
```

---

# Archive Rules

## memory/archive/

允许存放：

- full retro
- full release note
- full ADR
- logs
- long discussions

规则：

# archive 永远不自动进入 prompt

只能：

relevance retrieval。

---

# Retrieval Layer

## adr-index.md

禁止 AI 读取全部 ADR。

必须先读：

```markdown
# ADR Index

## adr-0001 websocket ownership

single manager architecture

## adr-0002 reconnect strategy

exponential backoff

## adr-0003 state machine

event-driven lifecycle
```

---

## memory-index.md

```markdown
# Memory Index

## websocket reconnect

- reconnect race condition
- heartbeat ownership

## orderbook sync

- snapshot replay issue
```

---

# Skills System

## 规则

skills 必须：

- 小
- 独立
- machine-readable
- 可动态加载

禁止：

```text
mega skills prompt
```

---

# Skill 格式

## websocket/reconnect.md

```yaml
trigger:
  - websocket
  - reconnect
  - ws

inject:
  - reconnect-strategy
  - heartbeat-pattern

constraints:
  - single-owner
  - exponential-backoff
  - retry-limit

anti_patterns:
  - duplicate websocket instances
  - nested reconnect loops

best_practices:
  - unified connection manager
  - explicit state machine
```

---

# Agent System

## architect.md

```markdown
# Architect Agent

职责：

- 系统设计
- ADR 决策
- 边界划分
- 技术选型

禁止：

- 直接实现复杂业务逻辑
```

---

## implementer.md

```markdown
# Implementer Agent

职责：

- 实现代码
- 遵循 requirements
- 遵循 design
- 最小化改动

禁止：

- 擅自修改架构
- 绕过 constraints
```

---

## reviewer.md

```markdown
# Reviewer Agent

职责：

- review diff
- 检查 anti-pattern
- 检查 regression
- 检查 consistency
```

---

## qa.md

```markdown
# QA Agent

职责：

- 测试
- edge cases
- regression validation
- failure simulation
```

---

# Ticket System

## Ticket 原则

ticket 不再保存长历史。

ticket 只保存：

- 当前目标
- 当前 requirements
- 当前 design
- 当前状态

旧上下文必须 summary 化。

---

# Active Context

## runtime/active-context.md

这是：

AI 当前工作区。

只能包含：

- 当前目标
- 当前 diff
- 当前 blockers
- 当前 files

禁止：

- 长篇历史
- 全量 release notes
- 全量 retro

---

# AI Workflow

## 开始新任务

AI 必须：

1. 读取 current-state.yaml
2. 读取 active-context.md
3. 检索 relevant summaries
4. 检索 relevant skills
5. 读取相关 ADR summary
6. 开始工作

禁止：

```text
全仓库扫描
全历史扫描
```

---

# Token Optimization Rules

## 必须遵守

### 1. summary first

永远先读 summary。

---

### 2. lazy loading

只有相关内容才允许加载。

---

### 3. archive isolation

archive 永远不自动注入。

---

### 4. no giant prompts

禁止：

- mega system prompt
- giant skills.md
- full project memory injection

---

### 5. machine-readable first

优先：

```yaml
json
structured markdown
```

而不是：

```text
长 prose
```

---

# 长期目标

Hermes v2 的目标不是：

```text
项目管理
```

而是：

# AI Context Operating System

核心：

- Context Engineering
- Memory Compression
- Skill Routing
- Agent Governance
- Retrieval Architecture

---

# 版本

Hermes Genesis v2
AI-Native Context Engineering Edition
2026
