const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const { SOEProcessor } = require("./soe-processor");
const { AlertEngine } = require("./alert-engine");
const { DataCollector } = require("./data-collector");
const { AIEngine } = require("./ai-core");

const db = admin.firestore();
const soe = new SOEProcessor(db);
const alerts = new AlertEngine(db);
const collector = new DataCollector(db);
const ai = new AIEngine(db);

// 🔁 مراقبة النظام وتشغيل SOE تلقائيًا
exports.monitorSystem = functions.firestore
  .document("system/core")
  .onUpdate(async (change, context) => {
    await soe.monitorSystemState();
    await ai.runThreatAnalysis();
  });

// 📡 جمع بيانات عند إضافة طائرة جديدة
exports.collectAircraft = functions.firestore
  .document("aircraft/{id}")
  .onCreate(async () => {
    await collector.collectStatus();
  });

// 🔔 تشغيل التنبيه الذكي عند تسجيل خلل
exports.handleLogAlert = functions.firestore
  .document("logs/{id}")
  .onCreate(async (snap, ctx) => {
    await alerts.detectThreats();
  });