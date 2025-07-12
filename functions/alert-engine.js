// 🚨 Alert Engine

export class AlertEngine {
  constructor(db) {
    this.db = db;
  }

  async detectThreats() {
    const logs = await this.db.collection('logs').where("status", "==", "anomaly").get();
    if (!logs.empty) {
      await this.db.collection('alerts').add({
        level: "medium",
        category: "log",
        text: { en: "Anomaly detected in logs", ar: "تم اكتشاف خلل في السجلات" },
        resolved: false,
        timestamp: Date.now()
      });
    }
  }
}