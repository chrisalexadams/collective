import FundDetails from "./FundDetails";
import Row from "./Row";
import NewFund from "./NewFund";
const FundList = (props) => {
	const state = props.state;
	const title = props.data.title;
	const columns = props.data.columns;
	const list = props.data.list;
	return (
		<div>
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
		</div>
	);
};

export default FundList;
