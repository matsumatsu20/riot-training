import 'riot-route/lib/tag'
import 'riot-hot-reload'

import './riot/app'
import './riot/main'
import './riot/archive'

const todoItems = [{ title: 'default item', description: 'This is default todo.', done: true }]
const archiveItems = []

const renderTodoItems = () => todoItems
const renderArchiveItems = () => archiveItems

riot.mixin('todoItems', {
  renderTodoItems: renderTodoItems,
  renderArchiveItems: renderArchiveItems
})

riot.observable(todoItems)
riot.observable(archiveItems)

todoItems.on('refresh', () => {
  riot.update()
})

archiveItems.on('refresh', () => {
  riot.update()
})

riot.mount('app')
