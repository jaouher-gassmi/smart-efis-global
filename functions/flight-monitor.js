// ✈️ Flight Monitor Module

export class FlightMonitor {
  constructor(db) {
    this.db = db;
  }

  async trackFlights() {
    const flights = await this.db.collection('flights').get();
    flights.forEach(doc => {
      const flight = doc.data();
      if (flight.route.length > 100) {
        console.log("⚠️ رحلة تتجاوز الحد المسموح: ", flight.id);
      }
    });
  }
}