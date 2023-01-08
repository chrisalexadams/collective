import { createApp } from "../utils";
import hackathon from "../library/logic/hackathon";
import FundList from "../library/components/FundList";
import Header from "../library/components/Header";
import NewFund from "../library/components/NewFund";
import FundDetails from "../library/components/FundDetails";
import Box from "@mui/material/Box";
import React, { useState, useEffect, Component } from "react";

const logic = (set) => {
	return {
		// main, newfund, details
		route: "main",
		collectiveDetails: null,
		newFund: {
			name: "",
			threshold: null,
			tmpMember: { ship: "", address: "" },
			members: [],
		},
		// newFund: {
		// 	name: 'Family Investments',
		// 	threshold: 50,
		// 	members: [
		// 		{ ship: "zod", address: "0x123" },
		// 		{ ship: "dev", address: "0x456" },
		// 	],
		// },
		// newAsset: {
		// 	contract: '0x123',
		// 	metadata: '0x456',
		// 	amount  : 400,
		// 	from    : '0x789'
		// },
		newAsset: {
			contract: '',
			metadata: '',
			amount  : null,
			from    : ''
		},
		setCollectiveDetails: (collective) =>
			set((state) => ({ collectiveDetails: collective, route: "details" })),
		setRoute: (route) => set((state) => ({ route })),
		setNewFund: (newFund) => set((state) => ({ newFund })),
		setNewAsset: (newAsset) => set((state) => ({ newAsset })),
	};
};

const Layout = (useStore) => {
	const state = useStore((state) => state);
	useEffect(() => {
		state.hackathon_sClient();
		console.log(state);
	}, []);

	return (
		<div>
			<div>
				<Header state={state} />
			<div class='mx-2 mt-9'>
				{state.route === "main" && <FundList state={state} />}
				{state.route === "details" && <FundDetails state={state} />}
				{state.route === "newfund" && <NewFund state={state} />}
			</div>
			</div>
		</div>
	);
};

export const Hackathon = createApp([hackathon, logic], Layout);

export default Hackathon;
