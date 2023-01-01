import Stack from "@mui/material/Stack";
import Grid from "@mui/material/Grid";
import TextField from "@mui/material/TextField";
import Paper from "@mui/material/Paper";
import Button from "@mui/material/Button";
import Box from "@mui/material/Box";

const Span = (props) => {
	console.log(props.content);
	if (props.content === undefined) return <div />;
	else
		return (
			<span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">
				{props.content}
			</span>
		);
};

const Row = (props) => {
	const items = props.items;
	return (
		<tr class="bg-white lg:hover:bg-gray-100 flex lg:table-row flex-row lg:flex-row flex-wrap lg:flex-no-wrap mb-0 lg:mb-0 border-b-8 lg:border-0">
			{items.map((item, idx) => {
				if (item.type === "text")
					return (
						<td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b block lg:table-cell relative lg:static">
							<Span content={props.columns[idx]} />
							<div> {item.content} </div>
						</td>
					);
				if (item.type === "input")
					return (
						<td class="w-full lg:w-auto p-0 text-gray-800 text-left border border-b block lg:table-cell relative lg:static">
							<Span content={props.columns[idx]} />
							<input
								class='p-3 w-full border-stone-400'
								value={item.value}
								placeholder={item.placeholder}
								onChange={(e) => item.onChange(e.currentTarget.value)}
							/>
						</td>
					);
				if (item.type === "button")
					return (
						<td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b block lg:table-cell relative lg:static">
							<Span content={props.columns[idx]} />
							<button
								class="text-blue-400 hover:text-blue-600"
								onClick={() => item.onClick(item.onClickArg)}
							>
								{item.content}
							</button>
						</td>
					);
			})}
		</tr>
	);
};

export default Row;
