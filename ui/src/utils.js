import * as R from 'ramda';
import create from 'zustand';
export const createPage = (currentRoute, pageRoute, component) => {
}

export const poke = R.curry((app, mark, json) => {
	window.urbit.poke({
		app,
		mark,
		json,
		// onSuccess: () => {},
		// onError: () => {},
	});
});

export const subscribe = R.curry((app, path, handler) => {
	window.urbit.subscribe({
		app: app,
		path: path,
		event: handler,
	});
});

// export const createComponent = (component, style, state, actions) => <component/>);
// export const createComponent = (component, style, state, action) => <component {...test}/>);

export const createStore = (logicModules) => create((set) => (R.mergeAll(logicModules.map(x => x(set)))));

export const createApp = (logicList, Layout) => {
	// const { getState, setState, subscribe, destroy } = createStore(logicList);
	const useStore = createStore(logicList);
	return (props) => Layout(useStore);
}
