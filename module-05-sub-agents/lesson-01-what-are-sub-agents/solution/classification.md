# Sub-agent Classification Worksheet

## Scenario 1
> Translate a user's message to French and reply to them in real-time.

**Decision:** Single call
**Reasoning:** Trivial single task, user is waiting, no benefit from spawning overhead.

## Scenario 2
> Given a new GitHub issue, simultaneously: categorise it, estimate complexity, and draft an initial response.

**Decision:** Sub-agents
**If sub-agents:** Parallel
**Reasoning:** Three independent tasks that don't depend on each other — run in parallel for 3× speed.

## Scenario 3
> Summarise 50 support tickets one by one, then compile a trend report.

**Decision:** Sub-agents
**If sub-agents:** Parallel (fan-out) for summaries, then sequential for trend report
**Reasoning:** Ticket summaries are independent (parallel). The trend report needs all summaries first (sequential after).

## Scenario 4
> Answer a simple factual question: "What is the capital of France?"

**Decision:** Single call
**Reasoning:** Trivially simple. Sub-agent overhead would cost more time and money than the task itself.

## Scenario 5
> Full security audit across 50 files (auth, SQL injection, XSS, secrets).

**Decision:** Sub-agents
**If sub-agents:** Parallel (4 specialised agents for 4 concern types)
**Reasoning:** Each concern is independent and requires deep focus. Parallel sub-agents prevent context dilution and finish faster.
