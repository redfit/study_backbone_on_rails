class Raffler.Views.EntriesIndex extends Backbone.View

  template: JST['entries/index']

  events:
    'submit #new_entry': 'createEntry'

  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @render, @)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendEntry)
    @

  appendEntry: (entry) ->
    view = new Raffler.Views.Entry()
    $('#entries').append(view.render().el)
    @

  createEntry: (event) ->
    event.preventDefault()
    @collection.create (name: $('#new_entry_name').val())
