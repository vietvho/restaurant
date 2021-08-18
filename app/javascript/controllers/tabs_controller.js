import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["tab","tabPanel"];

    change(e){
        console.log(e.target);
        this.tab = e.target.dataset.tab;
        this.showTab(this.tab)
    }

    showTab() {
        this.tabPanelTargets.forEach((el) => {
            if(el.id == this.tab){
              el.classList.remove('is-hidden')
            } else {
              el.classList.add('is-hidden')
            }
          })
      
          this.tabTargets.forEach((el) => {
            if(el.dataset.tab==this.tab){
              el.classList.add('is-active')
            } else {
              el.classList.remove('is-active')
            }
          })
    }
}