<main>
  <div class="container mt-3">
    <button class="btn mb-3" onclick="{ archive }" disabled="{ onlyDone().length == 0 }">Archive</button>
    <ul>
      <li each="{ todo in todoItems }" class="{ done: todo.done } form-check">
        <input class="form-check-input" type="checkbox" checked={ todo.done } onchange="{ complete }">
        <span>{ todo.title }</span><br/>
        <small>{ todo.description }</small>
      </li>
    </ul>

    <div class="form-inline">
      <input id="title" class="form-control mb-2 mr-sm-2 mb-sm-0" name="title" type="text" value="{ title }" placeholder="title" onkeyup="{ watchTitle }" />
      <input id="description" class="form-control mb-2 mr-sm-2 mb-sm-0" name="description" type="text" value="{ description }" placeholder="description" onkeyup="{ watchDescription }" />
      <button class="btn btn-primary mb-2 mr-2 mb-sm-0" onclick="{ addTodo }" disabled="{ !title || !description }">Add</button>
    </div>

    <a href="#archive">Go to Archive page</a>
  </div>


  <style type="scss">
    .done {
      color: grey;
      text-decoration: line-through;
    }
    li {
      list-style: none;
    }
  </style>

  <script>
    const self = this

    self.mixin('todoItems')

    self.todoItems = self.renderTodoItems()
    self.archiveItems = self.renderArchiveItems()

    self.title = 'asdfasdf'
    self.description = ''

    self.watchTitle = e => {
      self.title = e.target.value
    }

    self.watchDescription = e => {
      self.description = e.target.value
    }

    self.addTodo = () => {
      const todo = {}
      todo.title = self.title
      todo.description = self.description
      todo.done = false
      self.todoItems.push(todo)

      self.todoItems.trigger('refresh')
    }

    self.complete = e => {
      e.item.todo.done = e.target.checked
    }

    self.archive = () => {
      Array.prototype.push.apply(self.archiveItems, self.todoItems.filter(item => item.done))

      const filteredTodoItems = self.todoItems.filter(item => !item.done)
      self.todoItems.length = 0
      Array.prototype.push.apply(self.todoItems, filteredTodoItems)

      self.todoItems.trigger('refresh')
      self.archiveItems.trigger('refresh')
    }

    self.onlyDone = () => self.todoItems.filter(item => item.done)

  </script>
</main>
