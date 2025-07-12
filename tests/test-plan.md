# 🧪 Smart EFIS Global - Test Plan

## Unit Tests
- [x] SOE Processor (threat evaluation, fallback logic)
- [x] AI Engine (threat prediction)
- [x] Alert Engine (detect + create alerts)
- [x] Weather Sync (GFS fetch & transform)

## Integration Tests
- [x] Firebase Functions trigger chain (logs → alert → fallback)
- [x] API + Dashboard sync
- [x] Data flow from firestore.seed.json → map-view

## UI Tests
- [x] React Dashboard loads with layers
- [x] Map renders markers (flights, threats)
- [x] Responsive on mobile / PWA