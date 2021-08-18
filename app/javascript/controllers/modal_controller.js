import { Controller } from "stimulus"
// import { tinymce } from "../tinymce/tinymce";

export default class extends Controller {
    static targets = ["form","tab","tabcontent"];

    new() {
        let form = this.formTarget.querySelector('form');

        if (form){
            form.reset();
        }

        this.bindmce();        
        this.open();
    }

    bindmce() {
        // this.tinyEl = this.formTarget.querySelector('.tinymce'); 
        
        // if (this.tinyEl) {
        //     this.tinimceInit();
        //     console.log('if');
        // }
        // else {
        //     console.log('else');
        let waiting = setInterval(() => {
            this.tinyEl = this.formTarget.querySelector('.tinymce');
            console.log('waiting');
            if (this.tinyEl) {
                this.tinimceInit();
                clearInterval(waiting);
            }
        }, 500);
        // }
    }

    open() {
        this.bindmce();        
        this.formTarget.style.display = "block";
    }

    tinimceInit(){
        tinymce.init({
            selector: '.tinymce',
            height: 300,
            menubar: true,
            plugins: [
              'advlist autolink lists link image charmap print preview anchor',
              'searchreplace visualblocks code fullscreen',
              'insertdatetime media table paste code help wordcount'
            ],
              toolbar: 'undo redo | formatselect | ' +
              ' bold italic backcolor | alignleft aligncenter ' +
              ' alignright alignjustify | bullist numlist outdent indent | ' +
              ' removeformat | help'
          });
    }

    close() {
        // this.style.display = "none";
        this.formTarget.style.display = "none";
        tinymce.remove('#article_body');
        // console.log( this.formTarget);
    }

    cancel(e) {
        // this.style.display = "none";
        e.preventDefault();
        this.formTarget.style.display = "none";
        // console.log( this.formTarget);
    }

    tabActive() {

    }
}