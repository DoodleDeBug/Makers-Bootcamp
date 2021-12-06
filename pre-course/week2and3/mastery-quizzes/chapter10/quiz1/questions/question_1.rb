# Write a program that keeps a list of todos. It should:
# * Have two classes:
#   * `Todo`
#     * Has two methods:
#       * `initialize`: Creates a new todo object. Takes a string as a
#         parameter and stores it on the todo object.
#       * `text`: Takes no parameters. Returns the string that was
#         stored when the todo object was created.
#   * `TodoList`
#     * Has three methods:
#       * `initialize`: Creates a new todo list object. Takes no parameters.
#       * `add`: Takes a todo object as a parameter.  Stores it on the
#         todo list object.
#       * `print`: Takes no parameters.  Creates a string of all the
#         stored todos, one per line.  Each line should start with a
#         `* `.  `puts`es the string.
#         * e.g.
#           ```
#           * get milk
#           * get the papers
#           ```

# * Note: When you run the automated tests, make sure to remove from
#   the top level of the file any calls to any methods.

class Todo
  def initialize(item)
    @item = item.to_s
  end

  def text
    return @item
  end
end

class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo)
    @todo_list.push(todo)
  end

  def print
    final_list = ""
    @todo_list.each do |item|
      final_list += "* #{item.text}\n"
    end
    puts final_list
  end
end