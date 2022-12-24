import FundDetails from "./FundDetails";
import Row from "./Row";
import NewFund from "./NewFund";
const FundList = (props) => {
	const state = props.state;
	const collectives = props.collectives;
	console.log(state);
	return (
		<div>
			{state.route === "main" && (
				<div>
					<div>
						<span>Ship</span>
						<span>Address</span>
					</div>
					{state.collectives.map((collective) => {
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
