// 📡 Data Collector for Flight & Quantum Streams

export class DataCollector {
  constructor(db) {
    this.db = db;
  }

  async collectStatus() {
    const aircraft = await this.db.collection('aircraft').get();
    const statusSummary = aircraft.docs.map(doc => doc.data().status);

    await this.db.collection('system').doc('core').set({
      aircraftStatus: statusSummary,
      lastUpdated: Date.now()
    }, { merge: true });
  }
}