const todoItems = [{ title: 'default item', description: 'This is default todo.', done: true, archive: false }]

riot.observable(todoItems)

todoItems.on('refresh', () => {
  riot.update()
})

export default todoItems
