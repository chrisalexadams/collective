import { poke, subscribe } from "../../utils";
const _poke = poke("hackathon", "hackathon-action");

const hackathon = (set) => {
	return {
		// STATE
		// hackathon_collectives: [],
		hackathon_collectives: [
			{
				resource: { ship: "dinlug-pontun-pontus-fadpun", name: "testgroup" },
				fund: {
					id: "",
					name: "testfundname",
					threshold: 50,
					members: [
						{
							ship: "dinlug-pontun-pontus-fadpun",
							address: "0x123456789",
							zigs: 100,
						},
						{
							ship: "hapsyl-mosmed-pontus-fadpun",
							address: "0x987654321",
							zigs: 200,
						},
					],
					assets: ["0x13579", "0x24680"],
					zigs: 300,
					// open, sealed, liquidated
					status: 'open',
					actions: []
				},
			},
			{
				resource: { ship: "zod", name: "testgroup2" },
				fund: {
					id: "",
					name: "testfundname2",
					threshold: 50,
					members: [
						{
							ship: "zod",
							address: "0x123456789",
							zigs: 100,
						},
						{
							ship: "dinlug-pontun-pontus-fadpun",
							address: "0x123456789",
							zigs: 100,
						},
						{
							ship: "hapsyl-mosmed-pontus-fadpun",
							address: "0x987654321",
							zigs: 200,
						},
					],
					assets: ["0x369", "0x147"],
					zigs: 400,
					status: 'sealed',
					actions: []
				},
			},
		],
		// POKES
		hackathon_pCreate: (json) => _poke(json),
		// SUBSCRIPTIONS
	};
};

export default hackathon;
