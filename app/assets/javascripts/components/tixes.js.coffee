@Tixes = React.createClass
  getInitialState: ->
    tixes: @props.data
  getDefaultProps: ->
    tixes: []
  addTix: (tix) ->
    tixes = @state.tixes.slice()
    tixes.push tix
    @setState tixes: tixes
  render: ->
    React.DOM.div
      className: 'tixes'
      React.DOM.h2
        className: 'title'
        'tixes'
      React.createElement TixForm, handleNewTix: @addTix
      React.DOM.hr null
      React.DOM.table
	      className: 'table table-bordered'
	      React.DOM.thead null,
	        React.DOM.tr null,
	          React.DOM.th null, 'Date'
	          React.DOM.th null, 'Tag'
	          React.DOM.th null, 'task'
	          React.DOM.th null, 'comment'
	          React.DOM.th null, 'priority'
	          React.DOM.th null, 'User'
	      React.DOM.tbody null,
	        for tix in @state.tixes
          	React.createElement Tix, key: tix.id, tix: tix



