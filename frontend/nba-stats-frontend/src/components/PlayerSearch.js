import React, { useState } from "react";

const PlayerSearch = ({ onSearch }) => {
  const [playerName, setPlayerName] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    onSearch(playerName);
  };

  return (
    <form onSubmit={handleSubmit} style={{ marginBottom: "20px" }}>
      <input
        type="text"
        placeholder="Search for a player"
        value={playerName}
        onChange={(e) => setPlayerName(e.target.value)}
        style={{ padding: "10px", width: "300px" }}
      />
      <button type="submit" style={{ padding: "10px 20px", marginLeft: "10px" }}>
        Search
      </button>
    </form>
  );
};

export default PlayerSearch;
