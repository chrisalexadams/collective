// top bar for creating new funds
import Row from "./Row";
import List from "./List";
const FundDetails = (props) => {
	const newFund = props.state.newFund;
	const setNewFund = props.state.setNewFund;
	const basicInfo = {
		title: "",
		columns: [],
		list: [
			[
				{ type: "text", content: 'Fund Name:' },
				{
					type: "input",
					value: newFund.name,
					onChange: (value) => setNewFund({ ...newFund, name: value }),
				},
			],
			[
				{ type: "text", content: 'Threshold:' },
				{
					type: "input",
					inputType: "number",
					value: newFund.threshold,
					onChange: (value) => setNewFund({ ...newFund, threshold: value }),
				},
			],
			[],
		],
	};
	const memberInput = {
		title: "",
		columns: [],
		list: [
			[
				{ type: "text", content: 'Add member:' },
				{
					type: "input",
					value: newFund.tmpMember.ship,
					onChange: (value) => setNewFund({ ...newFund, tmpMember: {...newFund.tmpMember, ship: value }}),
				},
				{
					type: "input",
					value: newFund.tmpMember.address,
					onChange: (value) => setNewFund({ ...newFund, tmpMember: {...newFund.tmpMember, address: value }}),
				},
				{
					type: "button",
					onClick: (args) => 
					{
						setNewFund({...args[0], members: args[0].members.concat(args[1])})},
					onClickArg: [newFund, {ship: newFund.tmpMember.ship, address: newFund.tmpMember.address} ],
					content: "Add Member",
				}
			],
		],
	};
	const members = {
		title: "",
		columns: ['Ship', 'Address'
		],
		list: newFund.members.map((member) => {
			const items = [
				{ type: "text", content: member.ship },
				{ type: "text", content: member.address },
				{
					type: "button",
					onClick: (args) => setNewFund({...args[0], members: args[0].members.filter(m => !(m.ship === args[1].ship && m.address === args[1].address))}),
					onClickArg: [ newFund, member ],
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
					onClick: (args) => 
					{
						setNewFund({...args[0], members: args[0].members.concat(args[1])})},
					onClickArg: [newFund, {ship: newFund.tmpMember.ship, address: newFund.tmpMember.address} ],
					content: "Create",
				}
			],
		],
	};
	return (
		<div>
			<div>new fund</div>
			<List data={basicInfo}/>
			<List data={memberInput}/>
			<List data={members}/>
			<List data={create}/>
		</div>
	);
};

export default FundDetails;
