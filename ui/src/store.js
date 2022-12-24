import * as R from 'ramda';
import create from 'zustand';
import hackathon from '../library/logic/hackathon';

// import {
// } from "../utils";

// const local = _.merge(genStyle(style1), genText({name:'textname', value: ''}));
// const state = {
// 	remoteState1: 'initvalue',
// 	state2: 'initvalue',
// }

// const pokes = {
// 	poke1: (data) => {},
// 	poke2: (data) => {},
// }
// const subscriptions = {
// }

	// setRoute: (route) => set((state) => ({ route: route })),

// export const useStore = create((set) => .merge(state, actions, subscriptions));

export const createStore = (logicModules) => create((set) => (R.mergeAll(...logicModules));
export const createApp = (logicList, Layout) => {
	const { getState, setState, subscribe, destroy } = createStore(logicList);
	const state = getState();
	return (
		<Layout state={state}/>
	);
}
