$(function() {
    $(".needs-validation").each(function() {
        $(this).on("submit", function(e) {
            if (!this.checkValidity()) {
                e.preventDefault()
                e.stopPropagation()
            }
    
            $(this).addClass("was-validated")
        })
    })
})