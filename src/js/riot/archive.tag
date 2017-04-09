<archive>
  <div class="container mt-3">
    This is archive page.
    <li each="{ todo in archiveItems }" class="{ done: todo.done } form-check">
      <span>{ todo.title }</span><br/>
      <small>{ todo.description }</small>
    </li>
  </div>

  <style type="scss">
  </style>

  <script>
    const self = this

    self.mixin('todoItems')

    self.todoItems = self.renderTodoItems()
    self.archiveItems = self.renderArchiveItems()
  </script>
</archive>
