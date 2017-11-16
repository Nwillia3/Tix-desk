@TixForm = React.createClass
  getInitialState: ->
    date: ''
    tag: ''
    task: ''
    comment: ''
    priority: ''
    user_id: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.date && @state.tag && @state.task && @state.comment && @state.priority && @state.user_id
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { tix: @state }, (data) =>
      @props.handleNewTix data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'       
        React.DOM.input
          type: 'date'
          className: 'form-control'
          placeholder: 'Date'
          name: 'date'
          value: @state.date
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Tag'
          name: 'tag'
          value: @state.tag
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Task'
          name: 'task'
          value: @state.task
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'comment'
          name: 'comment'
          value: @state.comment
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'priority'
          name: 'priority'
          value: @state.priority
          onChange: @handleChange
       React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'user_id'
          name: 'user_id'
          value: @state.user_id
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create tix'