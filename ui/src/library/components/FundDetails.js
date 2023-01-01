import List from "./List";
const FundDetails = (props) => {
	const collective = props.state.collectiveDetails;
	const details = {
		title: "Basic Info",
		columns: [],
		list: [
			[
				{ type: "text", content: "Group" },
				{ type: "text", content: '~' + collective.resource.ship + '/' + collective.resource.name },
			],
			[
				{ type: "text", content: "Name" },
				{ type: "text", content: collective.fund.name },
			],
			[
				{ type: "text", content: "Threshold" },
				{ type: "text", content: collective.fund.threshold },
			],
			[
				{ type: "text", content: "Status" },
				{ type: "text", content: collective.fund.status },
			],
		],
	};
	console.log(collective);
	const members = {
		title: "Members",
		columns: ["Ship", "Address"],
		list: collective.fund.members.map((member) => {
			const items = [
				{ type: "text", content: member.ship },
				{ type: "text", content: member.address },
			];
			return items;
		}),
	};
	const actions = {
		title: "Actions",
		columns: [],
		list: collective.fund.members.map((member) => {
			const items = [
				// { type: "text", content: member.ship },
				// { type: "text", content: member.address },
			];
			return items;
		}),
	};
	return (
		<div>
			<List data={details}/>
			<List data={members}/>
			<List data={actions}/>
		</div>
	);
};

export default FundDetails;
