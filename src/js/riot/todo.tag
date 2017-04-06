<todo>
  <li class="{ done: todo.done } form-check">
    <input class="form-check-input" type="checkbox" checked={ todo.done } onchange="{ complete }">
    <span>{ opts.todo.title }</span><br/>
    <small>{ opts.todo.description }</small>
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
      opts.todo.done = e.target.checked
      self.parent.update()
    }
  </script>
</todo>
