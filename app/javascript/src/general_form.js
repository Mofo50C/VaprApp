import { addFormValidityTo } from "./form_validity_checker"

$(function() {
    $(".needs-validation").each(function() {
        addFormValidityTo($(this))
    })
})