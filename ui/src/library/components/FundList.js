import FundDetails from "./FundDetails";
import Row from "./Row";
import List from "./List";
import NewFund from "./NewFund";
const FundList = (props) => {
	const state = props.state;
	const fundList = {
		title: 'Funds',
		columns: ['Fund Name', 'Member Count', 'Total Zigs', 'My Zigs', 'Threshold'],
		list: 
		state.hackathon_collectives.map((collective) => {
			const items = [
				{ type: "text", content: collective.fund.name },
				{ type: "text", content: collective.fund.members.length },
				{ type: "text", content: collective.fund.zigs },
				{
					type: "text",
					content: collective.fund.members.filter(
						(c) => c.ship === window.urbit.ship
					)[0].zigs,
				},
				{
					type: "button",
					onClick: state.setCollectiveDetails,
					onClickArg: collective,
					content: "Details",
				},
			];
			return items;
		})
	}
	return (
		<div>
			{state.route === "main" && (
				<div>
					<div>
						<span>Fund Name</span>
						<span>Member Count</span>
						<span>Total Zigs</span>
						<span>My Zigs</span>
						<span>Threshold</span>
					</div>
					{state.hackathon_collectives.map((collective) => {
						const items = [
							{ type: "text", content: collective.fund.name },
							{ type: "text", content: collective.fund.members.length },
							{ type: "text", content: collective.fund.zigs },
							{
								type: "text",
								content: collective.fund.members.filter(
									(c) => c.ship === window.urbit.ship
								)[0].zigs,
							},
							{
								type: "button",
								onClick: state.setCollectiveDetails,
								onClickArg: collective,
								content: "Details",
							},
						];
						return <Row items={items} collective={collective} />;
					})}
				</div>
			)}
			{state.route === "details" && <FundDetails state={state} />}
			{state.route === "newfund" && <NewFund state={state} />}
		</div>
	);
};

export default FundList;
