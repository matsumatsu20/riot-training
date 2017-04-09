<todo>
  <li class="{ done: todo.done } form-check">
    <input class="form-check-input" type="checkbox" checked={ todo.done } onchange="{ complete }">
    <span>{ todo.title }</span><br/>
    <small>{ todo.description }</small>
  </li>

  <style type="scss">
    li {
      list-style: none;
    }
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
