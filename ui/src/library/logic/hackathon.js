import { poke, subscribe, unit, dedup } from "../../utils";
const _poke = poke("hackathon", "hackathon-action");

const hackathon = (set) => {
	return {
		// STATE
		// hackathon_collectives: [],
		hackathon_collectives: [
			{
				fundID: '',
				resource: { ship: "dinlug-pontun-pontus-fadpun", name: "testgroup" },
				fund: {
					id: "",
					name: "testfundname",
					members: [
						{
							ship: "dinlug-pontun-pontus-fadpun",
							address: "0x123456789",
							shares: 100,
						},
						{
							ship: "hapsyl-mosmed-pontus-fadpun",
							address: "0x987654321",
							shares: 200,
						},
					],
					assets: [
						{
							contract: '0x123',
							metadata: '0x456',
							contract: 13,
							contract: '0x789',
						}
					],
					// open, sealed, liquidated
					// status: "open",
					actions: [],
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
					assets: [
						{
							contract: '0x123',
							metadata: '0x456',
							amount: 13,
							account: '0x789',
						}
					],
					zigs: 400,
					// status: "sealed",
					actions: [
						{}
					],
				},
			},
		],
		// POKES
		hackathon_pCreate: (json) => _poke('collective', 'collective-action', {'create': json}),
		// SUBSCRIPTIONS
		hackathon_sClient: (handler) => {
				console.log('sClient');
				subscribe("collective", "/client", (client) => {
				console.log('subscribed');
				console.log(client);
			});
		},
	};
};

export default hackathon;
