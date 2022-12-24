const Row = (props) => {
	const items = props.items;
	return (
		<div>
			{ items.map( item => {
				if(item.type === 'text')
					return (<text> {item.content} </text>);
				if(item.type === 'edit')
					return (<input value={item.value} onChange={(e) => item.onChange(e.currentTarget.value)}> {item.content} </input>);
				if(item.type === 'button')
					return (<button onClick={() => item.onClick(item.onClickArg)}> {item.content} </button>);
			})}
		</div>
	);
};

export default Row;
