import List from "./List";
const FundDetails = (props) => {
	const state = props.state;
	const collective = props.state.collectiveDetails;
	const details = {
		title: "Basic Info",
		columns: [],
		list: [
			[
				{ type: "text", content: "Group" },
				{
					type: "text",
					content:
						"~" + collective.resource.ship + "/" + collective.resource.name,
				},
			],
			[
				{ type: "text", content: "Name" },
				{ type: "text", content: collective.fund.name },
			],
		],
	};
	console.log(collective);
	const members = {
		title: "Members",
		columns: ["Ship", "Address", "Shares"],
		list: collective.fund.members.map((member) => {
			const items = [
				{ type: "text", content: member.ship },
				{ type: "text", content: member.address },
				{ type: "text", content: member.shares },
			];
			return items;
		}),
	};
	const assets = {
		title: "Assets",
		columns: ["Contract", "Metadata", "Amount", "Account"],
		list: collective.fund.assets.map((asset) => {
			const items = [
				{ type: "text", content: asset.contract },
				{ type: "text", content: asset.metadata },
				{ type: "text", content: asset.amount },
				{ type: "text", content: asset.account },
			];
			return items;
		}),
	};
	const actions = {
		title: "Actions",
		columns: [],
		list: [
			[
				{
					type: "input",
					value: state.newAsset.contract,
					placeholder: "My Account",
					onChange: (value) =>
						state.setNewAsset({ ...state.newAsset, contract: value }),
				},
				{
					type: "input",
					value: state.newAsset.contract,
					placeholder: "Asset Account",
					onChange: (value) =>
						state.setNewAsset({ ...state.newAsset, contract: value }),
				},
				{
					type: "input",
					value: state.newAsset.contract,
					placeholder: "Asset Metadata",
					onChange: (value) =>
						state.setNewAsset({ ...state.newAsset, contract: value }),
				},
				{
					type: "input",
					value: state.newAsset.contract,
					placeholder: "Asset Amount",
					onChange: (value) =>
						state.setNewAsset({ ...state.newAsset, contract: value }),
				},
				{
					type: "button",
					onClick: (args) => 
					{
						state.setNewAsset({...args[0], members: args[0].members.concat(args[1])})},
					onClickArg: [state.newAsset],
					content: "Send Funds",
				}
			],
		],
	};
	return (
		<div>
			<List data={details} />
			<List data={members} />
			<List data={assets} />
			<List data={actions} />
		</div>
	);
};

export default FundDetails;
