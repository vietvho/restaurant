export default class Tabs {
    constructor(element) {
        this.element = element;
        this.tabs = element.querySelectorAll(element.dataset.tab || ".c-tabs__tab");
        this.panels = element.querySelectorAll(element.dataset.tab || ".c-tabs__content");
        this.currentTab = element.querySelector(".active");
        this.bindTab();
        console.log(this.tabs)
        console.log(this.panels)
        console.log(this.currentTab)
    }

    bindTab() {
        if (this.tabs) {
            for (let i = 0;  i < this.tabs.length; i++) {
                this.tabs[i].addEventListener('click',(e)=>{
                    e.preventDefault();
                    this.openTab(e,i);
                })
            }
        }

        this.currentTab.click();
    }

    openTab(evt, index) {
        this.clearActive();
        this.panels[index].style.display = "block";
        this.tabs[index].classList.add("active");
    }   

    clearActive() {

        this.tabs.forEach(element => {
            element.classList.remove('active');
        });

        this.panels.forEach(element => {
            element.style.display = "none"
        })

    }
}