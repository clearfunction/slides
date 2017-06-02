# mobx state tree

https://github.com/mobxjs/mobx-state-tree

a more opinionated mobx

<..>

## example

<pre>
    <code>
import { types, onSnapshot } from "mobx-state-tree"

const Todo = types.model("Todo", {
    title: types.string,
    done: false
}, {
    toggle() {
        this.done = !this.done
    }
})

const Store = types.model("Store", {
    todos: types.array(Todo)
})

// create an instance from a snapshot
const store = Store.create({ todos: [{
    title: "Get coffee"
}]})

// listen to new snapshots
onSnapshot(store, (snapshot) => {
    console.dir(snapshot)
})

// invoke action that modifies the tree
store.todos[0].toggle()
// prints: `{ todos: [{ title: "Get coffee", done: true }]}`    
    </code>
</pre>
