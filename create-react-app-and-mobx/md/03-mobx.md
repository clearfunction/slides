# MobX

<..>

## What is it?

Simple, scalable, state management

<..>

## Philosophy
> Anything that can be derived from the application state, should be derived. Automatically.

<..>

## Observable State

<pre>
    <code data-trim data-noescape class="javascript">
class Todo {
    id = Math.random();
    <mark>@observable</mark> title = "";
    <mark>@observable</mark> finished = false;
}
    </code>
</pre>

Note:
Using observable is like turning the properties of an object into a spreadsheet cells. But unlike spreadsheets, these values can be not only primitive values, but also references, objects and arrays. You can even define your own observable data sources.

<..>

## Decorators

ESNext
<pre>
    <code data-trim data-noescape class="javascript">
class Todo {
    id = Math.random();
    <mark>@observable</mark> title = "";
    <mark>@observable</mark> finished = false;
}
    </code>
</pre>

ES5

<pre>
    <code data-trim data-noescape class="javascript">
function Todo() {
    this.id = Math.random()
    <mark>extendObservable</mark>(this, {
        title: "",
        finished: false
    })
}
    </code>
</pre>

<..>

## Computed

<pre>
    <code data-trim data-noescape class="javascript">
class TodoList {
    <mark>@observable</mark> todos = [];
    <mark>@computed</mark> get unfinishedTodoCount() {
        return this.todos.filter(todo => !todo.finished).length;
    }
}
    </code>
</pre>

<..>

## Reactions (react-mobx)

<pre>
    <code>
@observer
class TodoListView extends Component {
    render() {
        return (<div>
                  <ul>
                    {this.props.todoList.todos.map(todo =>
                        <TodoView todo={todo} key={todo.id} />
                    )}
                  </ul>
                  Tasks left: {this.props.todoList.unfinishedTodoCount}
                </div>);
    }
}
    </code>
</pre>

`@observer` subscribes this component to `@observables` and rendering occurs when anything being consumed here changes. basically... `@computed`

<..>

## Demo

Note:
REACT_APP_DECORATORS=true in .env for custom-react-scripts
add observable to the arry in the store
add observable to the bool on the model
add computed of number of complete
show injection if you have time

<..>

<pre>
    <code data-trim data-noescape class="ini">
        REACT_APP_DECORATORS=true
    </code>
</pre>

<..>

<pre>
    <code data-trim data-noescape class="cmd">
        yarn add mobx mobx-react
    </code>
</pre>

<..>

## Provider and Injection

<pre>
    <code data-trim class="xml">
        <Provider store={myStoreInstance}>
    { ... child components can now @inject("store") }
    { it would be as if it was passed as a prop normally this.props.store }
</Provider>
    </code>
</pre>

A component to allow you to more easily share stores (or anything) without having to pass it through props explicitly.

