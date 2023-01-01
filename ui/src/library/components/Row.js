import Stack from "@mui/material/Stack";
import Grid from "@mui/material/Grid";
import TextField from "@mui/material/TextField";
import Paper from "@mui/material/Paper";
import Button from "@mui/material/Button";
import Box from "@mui/material/Box";

const Row = (props) => {
	const items = props.items;
	return (
		<Paper variant="outlined">
		<Grid container item direction="row" alignItems='center'   justifyContent="space-between">
			{items.map((item) => {
				if (item.type === "text") return  (
						<Grid item xs>
				<Box sx={{
					float: 'left',
							}}> {item.content} </Box>
						</Grid>
				)
				if (item.type === "input")
					return (
						<TextField
							value={item.value}
							onChange={(e) => item.onChange(e.currentTarget.value)}
						/>
					);
				if (item.type === "button")
					return (
						<Grid item xs={1}>
						<Button variant="contained" fullWidth fullHeight onClick={() => item.onClick(item.onClickArg)}>
							{" "}
							{item.content}{" "}
						</Button>
						</Grid>
					);
			})}
		</Grid>
		</Paper>
	);
};

export default Row;
