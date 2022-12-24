import { createApp } from "../utils";
import hackathon from "../library/logic/hackathon";
import FundList from "../library/components/FundList";
import Header from "../library/components/Header";

const logic = (set) => {
	return {
		// base, newfund, details
		route: "main",
		collectiveDetails: null,
		newFund: {
			name: '',
			threshold: 50,
			members: []
		},
		// newFund: {
		// 	name: 'Family Investments',
		// 	threshold: 50,
		// 	members: [
		// 		{ ship: "zod", address: "0x123" },
		// 		{ ship: "dev", address: "0x456" },
		// 	],
		// },
		setCollectiveDetails: (collective) =>
			set((state) => ({ collectiveDetails: collective, route: "details" })),
		setRoute: (route) => set((state) => ({ route })),
		setNewFund: (newFund) => set((state) => ({ newFund })),
	};
};

const Layout = (useStore) => {
	const state = useStore((state) => state);
	console.log(state);
	return (
		<div>
			<Header state={state} />
			<FundList state={state} />
		</div>
	);
};

export const Hackathon = createApp([hackathon, logic], Layout);

export default Hackathon;
