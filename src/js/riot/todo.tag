<todo class="form-check">
  <input class="form-check-input" type="checkbox" checked={ todo.done } onchange="{ complete }">
  <span class="{ done: todo.done }">{ todo.title }</span><br/>
  <small class="{ done: todo.done }">{ todo.description }</small>

  <style type="scss">
    .done {
      color: grey;
      text-decoration: line-through;
    }
  </style>

  <script>
    const self = this

    self.complete = e => {
      self.todo.done = e.target.checked
      opts.callback()
    }
  </script>
</todo>
