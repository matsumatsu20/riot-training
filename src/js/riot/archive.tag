<archive>
  <div class="container mt-3">
    <h2>This is archive page.</h2>
    <button class="btn mb-3" onclick="{ destroyAllArchiveItem }">Destroy All!!!</button>
    <li each="{ todo in archiveTodoItems() }" class="{ done: todo.done } form-check">
      <span>{ todo.title }</span><br/>
      <small>{ todo.description }</small>
    </li>

    <a href="#">Go to Top page</a>
  </div>

  <style type="scss">
    li {
      list-style: none;
    }
  </style>

  <script>
    import todoItems from '../model/todoItems'

    const self = this

    self.todoItems = todoItems

    self.archiveTodoItems = () => self.todoItems.filter(item => item.archive)

    self.destroyAllArchiveItem = () => {
      // 単純にforEachを使ってループを回すと、削除していく間にindexがずれるので
      // 削除が行わなかった場合のみindexのインクリメントを行うようにする
      for (let i = 0; i < todoItems.length;) {
        if (todoItems[i].archive) {
          todoItems.splice(i, 1)
        } else {
          i++
        }
      }

      self.todoItems.trigger('refresh')
    }
  </script>
</archive>
