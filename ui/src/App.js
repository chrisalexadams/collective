import logo from './logo.svg';
import './App.css';
import {Text2} from './library/structures/basic';
import Hackathon from './apps/hackathon';
import Urbit from "@urbit/http-api";

// const inject = (component, state, actions) => {
// 	return (
// 		() => {
// 			const testAttribute = getState();
// 			console.log(testAttribute);
// 			return (
// 				<div>{testAttribute.testAttribute}</div>
// 			// component(testAttribute,'')
// 			)
// 		}
// 	)
// }

// const component = (state, actions) => {
// 	return (
// 		<div>{state}</div>
// 	)
// }

// const appComponent = inject(component)();

function App() {
	window.urbit = new Urbit(
		"http://localhost:8080",
		"",
		"livtun-lapmud-talfyn-livsyt"
	);
	window.urbit.ship = "dinlug-pontun-pontus-fadpun";

  return (
    <div className="App">
			<Hackathon/>
    </div>
  );
}

export default App;
