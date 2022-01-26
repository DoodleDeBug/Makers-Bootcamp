function constructToDos(page) {
  chrome.storage.sync.get("todos", ({ todos }) => {
    console.log(todos);
    // For each color we were provided…
    for (let todo in todos) {
      // …create a button with that color…
      let todoItem = document.createElement("li");
      todoItem.innerText = todos[todo].text;
      todoItem.className = "LI";
      todoItem.id = todo;
      if (todos[todo].checked == true) {
        console.log("am checked");
        todoItem.classList.add("checked");
      }

      //button.addEventListener("click", openEdit);

      page.appendChild(todoItem);
    }
  });
}

export { constructToDos };
