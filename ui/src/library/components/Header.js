const header = (props) => {
	const state = props.state;
	return (
		<div
			class='flex' 
		>
			{state.route !== "main" && (
				<button 
					class='mr-auto ml-9 mt-9 text-blue-400 hover:text-blue-600'
				onClick={() => state.setRoute("main")}> Back </button>
			)}
			<button 
					class='ml-auto mr-9 mt-9 text-blue-400 hover:text-blue-600'
				onClick={() => state.setRoute("newfund")}>
				New Fund
			</button>
		</div>
	);
};

export default header;
