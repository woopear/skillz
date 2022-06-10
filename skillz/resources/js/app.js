import "../css/app.css";
import "unpoly";
import "unpoly/unpoly.css";
import Alpine from "alpinejs";
window.Alpine = Alpine;
Alpine.start();

import { createSignal, onCleanup } from "solid-js";
import { render } from "solid-js/web";

const App = () => {
  const [count, setCount] = createSignal(0),
    timer = setInterval(() => setCount(count() + 1), 1000);

  onCleanup(() => clearInterval(timer));

  const style = `
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    font-size:128px;
    font-weight:bold;
    height:100vh;
  `;
  return <div style={style}>{count()}</div>;
};

render(() => <App />, document.getElementById("composant"));
