require_relative "../questions/question_1"
require "mastery_answer_code_quality"

describe "Q1. Todo list" do
  describe Todo do
    describe "creating a new Todo" do
      it "creates a new todo object" do
        expect(Todo.new("get milk")).to be_instance_of Todo
      end
    end

    describe "getting text on todo" do
      it "returns text stored on todo" do
        expect(Todo.new("get milk").text).to eq("get milk")
      end
    end
  end

  describe TodoList do
    describe "creating a TodoList" do
      it "creates a new todo list object" do
        expect(TodoList.new).to be_instance_of TodoList
      end
    end

    describe "adding todos" do
      let(:todo) { Todo.new("get milk") }
      let(:todo_list) { TodoList.new }

      it "adds a todo without raising an error" do
        expect { todo_list.add(todo) }.to_not raise_error
      end
    end

    describe "printing todos" do
      let(:todo) { Todo.new("get milk") }
      let(:todo_list) { TodoList.new }

      context "one todo" do
        it "prints a single todo with a bullet point" do
          todo_list.add(todo)

          expect { todo_list.print }.to output("* get milk\n").to_stdout
        end
      end

      context "many todos" do
        let(:todo_1) { Todo.new("get milk") }
        let(:todo_2) { Todo.new("get the paper") }
        let(:todo_3) { Todo.new("get orange juice") }
        let(:todo_list) { TodoList.new }

        let(:expected_output) { ["* get milk",
                                "* get the paper",
                                "* get orange juice"].join("\n") +
                               "\n" }

        it "prints the todos, separated by newlines" do
          todo_list.add(todo_1)
          todo_list.add(todo_2)
          todo_list.add(todo_3)

          expect { todo_list.print }.to output(expected_output).to_stdout
        end
      end
    end
  end

  it "has acceptable code quality" do
    code_quality = MasteryAnswerCodeQuality.build(__FILE__)
    expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
  end
end
