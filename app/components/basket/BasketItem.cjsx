React = require('react')

deleteAction = (actionContext, payload, done) ->
  console.log arguments
  actionContext.dispatch 'REMOVE_FROM_BASKET', payload
  done()

Component = React.createClass
  contextTypes: {
    executeAction: React.PropTypes.func.isRequired
  },

  getDefaultProps: () ->
    key: 0
    name: 'Default item'
    quantity: 1

  onDeleteClick: () ->
    console.log('DELETE CLICK')
    @context.executeAction deleteAction, @props

  render: () ->
    (
      <div className="basket-item">
        <div>Picture</div>
        <h2>{@props.name}</h2>
        <p><small>Quantity {@props.quantity}</small></p>
        <button onClick={@onDeleteClick}>Delete</button>
        <hr />
      </div>
    )

module.exports = Component
