<main>
  <div class="container mt-3">
    <button class="btn mb-3" onclick="{ archive }" disabled="{ onlyDone().length == 0 }">Archive</button>
    <ul>
      <todo each="{ todo in todoItems }" callback="{ parent.update }"></todo>
    </ul>

    <div class="form-inline">
      <input id="title" class="form-control mb-2 mr-sm-2 mb-sm-0" name="title" type="text" value="{ title }" placeholder="title" onkeyup="{ watchTitle }" />
      <input id="description" class="form-control mb-2 mr-sm-2 mb-sm-0" name="description" type="text" value="{ description }" placeholder="description" onkeyup="{ watchDescription }" />
      <button class="btn btn-primary mb-2 mr-2 mb-sm-0" onclick="{ addTodo }" disabled="{ !title || !description }">Add</button>
    </div>

    <a href="#archive">Go to Archive page</a>
  </div>

  <script>
    const self = this
    self.todoItems = [{ title: 'default item', description: 'This is default todo.', done: true }]

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

      self.title = ''
      self.description = ''
    }

    self.archive = () => {
      self.todoItems = self.todoItems.filter(item => !item.done)
    }

    self.onlyDone = () => self.todoItems.filter(item => item.done)

  </script>
</main>
