import FundDetails from "./FundDetails";
import Row from "./Row";
import List from "./List";
import NewFund from "./NewFund";
const FundList = (props) => {
	const state = props.state;
	const fundList = {
		title: 'List of Funds',
		columns: ['Fund Name', 'Member Count', 'Total Zigs', 'My Zigs', 'Actions'],
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
					)[0]?.zigs,
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
			<List data={fundList}/>
	);
};

export default FundList;
