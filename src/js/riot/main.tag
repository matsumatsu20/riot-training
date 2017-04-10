<main>
  <div class="container mt-3">
    <button class="btn mb-3" onclick="{ archive }" disabled="{ onlyDone().length == 0 }">Archive</button>
    <todo each="{ todo in activeTodoItems() }" callback="{ parent.update }"></todo>

    <div class="form-inline">
      <input id="title" class="form-control mb-2 mr-sm-2 mb-sm-0" name="title" type="text" value="{ title }" placeholder="title" onkeyup="{ watchTitle }" />
      <input id="description" class="form-control mb-2 mr-sm-2 mb-sm-0" name="description" type="text" value="{ description }" placeholder="description" onkeyup="{ watchDescription }" />
      <button class="btn btn-primary mb-2 mr-2 mb-sm-0" onclick="{ addTodo }" disabled="{ !title || !description }">Add</button>
    </div>

    <a href="#archive">Go to Archive page</a>
  </div>

  <script>
    import todoItems from '../model/todoItems'

    const self = this

    self.todoItems = todoItems
    self.activeTodoItems = () => self.todoItems.filter(item => !item.archive)

    self.title = ''
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

      self.title = ''
      self.description = ''
    }

    self.archive = () => {
      self.todoItems.forEach(element => {
        if (element.done) { element.archive = true }
      })
      self.todoItems.trigger('refresh')
    }

    self.onlyDone = () => self.todoItems.filter(item => item.done)
  </script>
</main>
