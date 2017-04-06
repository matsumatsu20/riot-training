<todo>
  <li class="{ done: todo.done } form-check">
    <input class="form-check-input" type="checkbox" checked={ todo.done } onchange="{ callback }">
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

    self.callback = opts.callback || () => {}
  </script>
</todo>
