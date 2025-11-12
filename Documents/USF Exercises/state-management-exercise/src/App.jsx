import { useState } from "react";
import "./App.css";

function App() {
  const [playerHealth, setPlayerHealth] = useState(100);
  const [enemyHealth, setEnemyHealth] = useState(100);
  const [gameStatus, setGameStatus] = useState("playing");

  function handleFire() {
    const playerDamage = Math.floor(Math.random() * 20);
    const enemyDamage = Math.floor(Math.random() * 20);

    const newPlayerHealth = Math.max(playerHealth - enemyDamage, 0);
    const newEnemyHealth = Math.max(enemyHealth - playerDamage, 0);

    setPlayerHealth(newPlayerHealth);
    setEnemyHealth(newEnemyHealth);

    if (newPlayerHealth === 0 && newEnemyHealth === 0) {
      setGameStatus("draw");
    } else if (newEnemyHealth === 0) {
      setGameStatus("won");
    } else if (newPlayerHealth === 0) {
      setGameStatus("lost");
    }
  }

  function handleRestart() {
    setPlayerHealth(100);
    setEnemyHealth(100);
    setGameStatus("playing");
  }

  return (
    <div className="app">
      <h1>🚀 Space Battle Game</h1>

      <div className="stats">
        <div>Player Health: {playerHealth}</div>
        <div>Enemy Health: {enemyHealth}</div>
      </div>

      {gameStatus === "playing" ? (
        <button onClick={handleFire}>Fire!</button>
      ) : (
        <button onClick={handleRestart}>Restart</button>
      )}

      <div className="status">
        {gameStatus === "won" && <p>You won! 🏆</p>}
        {gameStatus === "lost" && <p>You lost! 😵</p>}
        {gameStatus === "draw" && <p>It's a draw! 🤝</p>}
        {gameStatus === "playing" && <p>Attack your enemy!</p>}
      </div>
    </div>
  );
}

export default App;