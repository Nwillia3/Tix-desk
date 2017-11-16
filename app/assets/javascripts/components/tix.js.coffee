@Tix = React.createClass
	render: ->
		React.DOM.tr null,
			React.DOM.td null, @props.tix.date
			React.DOM.td null, @props.tix.tag
			React.DOM.td null, @props.tix.task
			React.DOM.td null, @props.tix.comment
			React.DOM.td null, @props.tix.priority
			React.DOM.td null, @props.tix.user_id

