# Exercise: Wiring & Shipping

## Goal
Complete the capstone pipeline and prepare it for production.

---

## Task 1: Production checklist (10 min)

Complete `starter/production-checklist.md`:
Go through each checklist item and mark as done or note what's still needed:
- [ ] Webhook signature validation
- [ ] API key rotation plan
- [ ] Rate limit handling
- [ ] Error alerting
- [ ] Cost monitoring
- [ ] Feature flag for emergency disable
- [ ] Idempotency (same PR doesn't get double-reviewed)
- [ ] Logging with correlation IDs

---

## Task 2: Monitoring design (10 min)

Complete `starter/monitoring-design.md`:
Design a simple monitoring setup:
- Key metrics to track
- Alerting thresholds
- Where to view logs
- On-call escalation path

---

## Task 3: End-to-end test plan (5 min)

Complete `starter/e2e-test-plan.md`:
Write a test plan for the complete pipeline:
- Test with a real small PR (what's a good test PR?)
- Expected outputs at each stage
- How to verify the PR comment was posted correctly

---

## Validation

`bash check.sh`
