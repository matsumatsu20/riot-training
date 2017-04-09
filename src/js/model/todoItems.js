const todoItems = [
  { title: 'default item', description: 'This is default todo.', done: true, archive: false },
  { title: 'default archive item1', description: 'This is default archive item.', done: true, archive: true }
]

riot.observable(todoItems)

todoItems.on('refresh', () => {
  riot.update()
})

export default todoItems
