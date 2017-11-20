@Tix = React.createClass
	getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

	handleDelete: (e) ->
		e.preventDefault()
		$.ajax
			method: 'DELETE'
			url: "/tixes/#{ @props.tix.id }"
			dataType: 'JSON'
			success: () =>
				@props.handleDeleteTix @props.tix

	handleEdit: (e) ->
	  e.preventDefault()
	  data =
      date: this.refs.date.value
      tag: this.refs.tag.value
      task: this.refs.task.value
      comment: this.refs.comment.value
      priority: this.refs.priority.value
      user_id: this.refs.user_id.value
	    
	  $.ajax
	    method: 'PUT'
	    url: "/tixes/#{ @props.tix.id }"
	    dataType: 'JSON'
	    data:
	      tix: data
	    success: (data) =>
	      @setState edit: false
	      @props.handleEditTix @props.tix, data

	tixRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.tix.date
      React.DOM.td null, @props.tix.tag
      React.DOM.td null, @props.tix.task
      React.DOM.td null, @props.tix.comment
      React.DOM.td null, @props.tix.priority
      React.DOM.td null, @props.tix.user_id
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-info'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'

  tixForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'date'
          defaultValue: @props.tix.date
          ref: 'date'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.tix.tag
          ref: 'tag'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.tix.task
          ref: 'task'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.tix.comment
          ref: 'comment'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.tix.priority
          ref: 'priority'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.tix.user_id
          ref: 'user_id'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-primary'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'
  render: ->
    if @state.edit
      @tixForm()
    else
      @tixRow()
    