<archive>
  <div class="container mt-3">
    This is archive page.
    <li each="{ todo in archiveTodoItems() }" class="{ done: todo.done } form-check">
      <span>{ todo.title }</span><br/>
      <small>{ todo.description }</small>
    </li>
  </div>

  <style type="scss">
  </style>

  <script>
    import todoItems from '../model/todoItems'

    const self = this

    self.todoItems = todoItems

    self.archiveTodoItems = () => self.todoItems.filter(item => item.archive)
  </script>
</archive>
