export default class TabController {
    constructor() {
        this.handlers = document.querySelectorAll(".js-tabs");
        console.log(this.handlers);
        if (this.handlers.length > 0) {
            import(/* webpackChunkName: "navigation" */ "../classes/Tabs")
                .then(({ default: Tabs }) => {
                    for (let i = 0; i < this.handlers.length; i++) {
                        new Tabs(this.handlers[i]);
                    }
                })
                .catch(err => console.error(err));
        }
    }
}