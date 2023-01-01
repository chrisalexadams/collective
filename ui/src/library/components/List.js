import FundDetails from "./FundDetails";
import Row from "./Row";
import NewFund from "./NewFund";
import Stack from '@mui/material/Stack';
import Grid from "@mui/material/Grid";

const list = (props) => {
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
				<Stack spacing={1}
				>
				{list.map((items) => {
					return <Row items={items} />;
				})}
				</Stack>
			</div>
		</div>
	);
};

export default list;
