$('#todosp').html("<%= j(render @todo_list.todos)%>")
$('#formp').html("<%= j(render 'todos/form')%>")
