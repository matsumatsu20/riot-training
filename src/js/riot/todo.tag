<todo>
  <li class="{ done: todo.done } form-check">
    <input class="form-check-input" type="checkbox" checked={ todo.done } onchange="{ this.parent.complete }">
    <span>{ todo.title }</span><br/>
    <small>{ todo.description }</small>
  </li>

  <style type="scss">
    .done {
      color: grey;
      text-decoration: line-through;
    }
  </style>
</todo>
