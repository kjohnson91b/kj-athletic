import React, { useState } from "react";
import PlayerSearch from "./components/PlayerSearch";
import PlayerStats from "./components/PlayerStats";
import { getPlayerStats } from "./services/api";

const App = () => {
  const [stats, setStats] = useState(null);
  const [error, setError] = useState("");

  const handleSearch = async (playerName) => {
    try {
      const data = await getPlayerStats(playerName);
      setStats(data);
      setError("");
    } catch (err) {
      setError("Failed to fetch player stats. Please try again.");
      setStats(null);
    }
  };

  return (
    <div style={{ padding: "20px", fontFamily: "Arial, sans-serif" }}>
      <h1>NBA Player Stats</h1>
      <PlayerSearch onSearch={handleSearch} />
      {error && <p style={{ color: "red" }}>{error}</p>}
      <PlayerStats stats={stats} />
    </div>
  );
};

export default App;
