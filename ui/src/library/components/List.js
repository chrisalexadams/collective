import FundDetails from "./FundDetails";
import Row from "./Row";
import NewFund from "./NewFund";
const FundList = (props) => {
	const state = props.state;
	const title = props.title;
	const columns = props.columns;
	const list = props.list;
	console.log(state);
	return (
		<div>
			{state.route === "main" && (
				<div>
					<div> {title} </div>
					<div>
						{columns.map((col) => {
							return <span>{col}</span>;
						})}
					</div>
					{list.map((items) => {
						return <Row items={items} />;
					})}
				</div>
			)}
			{state.route === "details" && <FundDetails state={state} />}
			{state.route === "newfund" && <NewFund state={state} />}
		</div>
	);
};

export default FundList;
