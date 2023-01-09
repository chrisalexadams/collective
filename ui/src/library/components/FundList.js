import FundDetails from "./FundDetails";
import Row from "./Row";
import List from "./List";
import NewFund from "./NewFund";
const FundList = (props) => {
	const state = props.state;
	const fundList = {
		title: 'List of Funds',
		columns: ['Fund Name', 'Member Count', 'My Shares', 'Actions'],
		list: 
		state.hackathon_collectives.map((collective) => {
			const items = [
				{ type: "text", content: collective.name },
				{ type: "text", content: collective.members.length },
				{
					type: "text",
					content: collective.members.filter(
						(c) => c.ship === ('~' + window.urbit.ship)
					)[0]?.shares,
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
