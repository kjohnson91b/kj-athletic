import React from "react";

const PlayerStats = ({ stats }) => {
  if (!stats) return null;

  return (
    <div>
      <h2>Player Statistics</h2>
      <table border="1" cellPadding="10" style={{ width: "100%", textAlign: "left" }}>
        <thead>
          <tr>
            <th>Season</th>
            <th>Team</th>
            <th>Age</th>
            <th>Games Played</th>
            <th>Points</th>
            <th>Rebounds</th>
            <th>Assists</th>
          </tr>
        </thead>
        <tbody>
          {stats.map((stat, index) => (
            <tr key={index}>
              <td>{stat.SEASON_ID}</td>
              <td>{stat.TEAM_ABBREVIATION}</td>
              <td>{stat.PLAYER_AGE}</td>
              <td>{stat.GP}</td>
              <td>{stat.PTS}</td>
              <td>{stat.REB}</td>
              <td>{stat.AST}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default PlayerStats;
