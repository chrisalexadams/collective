const header = (props) => {
	const state = props.state;
	return (
		<div>
			{state.route !== "main" && (
				<button onClick={() => state.setRoute("main")}> Back </button>
			)}
			<button className="font-bold" onClick={() => state.setRoute("newfund")}>
				New Fund
			</button>
		</div>
	);
};

export default header;
