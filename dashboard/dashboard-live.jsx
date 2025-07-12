import React, { useEffect, useState } from 'react';
import { MapContainer, TileLayer, Marker, Popup, LayersControl } from 'react-leaflet';
import 'leaflet/dist/leaflet.css';
import '../cmp/dashboard.css'; // ملف ستايل اختياري

const { BaseLayer, Overlay } = LayersControl;

export default function DashboardLive() {
  const [flights, setFlights] = useState([]);
  const [threats, setThreats] = useState([]);
  const [weather, setWeather] = useState(null);

  useEffect(() => {
    fetch('/api/flights-live').then(res => res.json()).then(setFlights);
    fetch('/api/threats').then(res => res.json()).then(setThreats);
    fetch('/api/weather-current').then(res => res.json()).then(setWeather);
  }, []);

  return (
    <div className="dashboard-live">
      <h2>Smart EFIS Global: Live Operations Dashboard</h2>

      <MapContainer center={[30.0444, 31.2357]} zoom={4} style={{ height: '75vh', width: '100%' }}>
        <LayersControl position="topright">
          <BaseLayer checked name="OpenStreetMap">
            <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
          </BaseLayer>
          <Overlay name="Flight Paths">
            {flights.map((f, idx) => (
              <Marker key={idx} position={[f.lat, f.lon]}>
                <Popup>
                  <b>Flight:</b> {f.id}<br />
                  <b>Status:</b> {f.status}
                </Popup>
              </Marker>
            ))}
          </Overlay>
          <Overlay name="Threat Zones">
            {threats.map((t, idx) => (
              <Marker key={idx} position={[t.lat, t.lon]} icon={L.divIcon({ className: 'threat-icon' })}>
                <Popup>
                  <b>Threat:</b> {t.level}<br />
                  <b>Detected:</b> {t.source}
                </Popup>
              </Marker>
            ))}
          </Overlay>
        </LayersControl>
      </MapContainer>

      {weather && (
        <div className="weather-summary">
          <h4>🌦️ Weather Update: {weather.name}</h4>
          <p>{weather.description}</p>
          <p>🌡 Temp: {weather.temp}°C | 💨 Wind: {weather.wind_speed} km/h</p>
        </div>
      )}
    </div>
  );
}