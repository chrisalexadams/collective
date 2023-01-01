import FundDetails from "./FundDetails";
import Row from "./Row";
import NewFund from "./NewFund";
import Stack from "@mui/material/Stack";
import Grid from "@mui/material/Grid";

const list = (props) => {
	const state = props.state;
	const title = props.data.title;
	const columns = props.data.columns;
	const list = props.data.list;
	return (
		<div>
			<div class='w-full text-left mb-5 font-bold text-xl'> {title} </div>
			<table class="border-collapse w-full mb-9">
				<thead>
					<tr>
						{columns.map((col) => {
							return (
								<th
									class="
									p-3 font-bold 
									uppercase bg-gray-200 text-gray-600 
									border border-gray-300 hidden 
									lg:table-cell
									"
								>
									{col}
								</th>
							);
						})}
					</tr>
				</thead>
				<tbody class='border-t-8 lg:border-0'>
					{list.map((items) => {
						return <Row columns={columns} items={items} />;
					})}
				</tbody>
			</table>
		</div>
	);
};

export default list;
