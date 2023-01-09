// top bar for creating new funds
import Row from "./Row";
import List from "./List";
import { poke, subscribe, unit, dedup } from "../../utils";
const FundDetails = (props) => {
	poke('collective', 'collective-action', {update : { fundid: '0x123' }});
	const state = props.state;
	const newFund = props.state.newFund;
	const setNewFund = props.state.setNewFund;
	const basicInfo = {
		title: "Basic Settings",
		columns: [],
		list: [
			[
				{ type: "text", content: "Fund Name" },
				{
					type: "input",
					placeholder: "e.g. My Super Fund",
					value: newFund.name,
					onChange: (value) => setNewFund({ ...newFund, name: value }),
				},
			],
		],
	};
	const memberInput = {
		title: "",
		columns: [],
		list: [
			[
				{
					type: "input",
					value: newFund.tmpMember.ship,
					placeholder: "ship (e.g. ~sampel-palnet)",
					onChange: (value) =>
						setNewFund({
							...newFund,
							tmpMember: { ...newFund.tmpMember, ship: value },
						}),
				},
				{
					type: "input",
					value: newFund.tmpMember.address,
					placeholder: "address (e.g. 0x1234...)",
					onChange: (value) =>
						setNewFund({
							...newFund,
							tmpMember: { ...newFund.tmpMember, address: value },
						}),
				},
				{
					type: "button",
					onClick: (args) => {
						setNewFund({
							...args[0],
							members: args[0].members.concat(args[1]),
						});
					},
					onClickArg: [
						newFund,
						{
							ship: newFund.tmpMember.ship,
							address: newFund.tmpMember.address,
						},
					],
					content: "Add Member",
				},
			],
		],
	};
	const members = {
		title: "New Members",
		columns: ["Ship", "Address", "Actions"],
		list: newFund.members.map((member) => {
			const items = [
				{ type: "text", content: member.ship },
				{ type: "text", content: member.address },
				{
					type: "button",
					onClick: (args) =>
						setNewFund({
							...args[0],
							members: args[0].members.filter(
								(m) =>
									!(m.ship === args[1].ship && m.address === args[1].address)
							),
						}),
					onClickArg: [newFund, member],
					content: "Remove Member",
				},
			];
			return items;
		}),
	};
	const create = {
		title: "",
		columns: [],
		list: [
			[
				{
					type: "button",
					onClick: (args) => {
						state.hackathon_pCreate({
							...args[0],
							members: args[0].members.concat(args[1]),
						});
					},
					onClickArg: [
						newFund,
						{
							ship: newFund.tmpMember.ship,
							address: newFund.tmpMember.address,
						},
					],
					content: "Create",
				},
			],
		],
	};
	return (
		<div>
			<List data={basicInfo} />
			<List data={members} />
			<List data={memberInput} />
			<button
				class="text-blue-400 hover:text-blue-600 float-right m-9"
				onClick={() => {state.hackathon_pCreate(newFund)}}
			>
				Create
			</button>
		</div>
	);
};

export default FundDetails;
