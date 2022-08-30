

const update = (gang = null) => {
    const gangname = document.getElementById('gangname');
    gangname.className = '';
    gangname.innerHTML = gang.label + " - " + gang.grade.name;
    gangname.classList.add(gang.name);
};

const remove = () => {
    const gangname = document.getElementById('gangname');
    gangname.className = '';
    gangname.innerHTML = '';
}

window.addEventListener("message", (event) => {
    const data = event.data;
    const action = data.action;
    switch (action) {
        case "UPDATE":
            return update(data.gang);
        case "REMOVE":
            return remove();
        default:
            return;
    }
});