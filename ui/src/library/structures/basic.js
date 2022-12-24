import { createComponent } from "../../utils";

// export const Text = createComponent(
// 	(style, state, actions) => <div>{style}</div>,
// 	{ style: "teststyle" }
// );

export const Text2 = (props) => <div style={props[0]}> {props[1]}</div>;

