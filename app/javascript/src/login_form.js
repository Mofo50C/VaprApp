$(function() {
    const $login_form = $("#login_form")

    $login_form.on("submit", function(e) {
        console.log("submitted login")
        if (!this.checkValidity()) {
            e.preventDefault()
            e.stopPropagation()
        }

        $(this).addClass("was-validated")
    })
    
})