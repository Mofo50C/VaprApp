import { addFormValidityTo } from "./form_validity_checker"

function checkPassword($form) {
    var $password = $form.find("#user_password")
    var value = $password.val()
    var element = $password[0]
    
    if (/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/.test(value)) {
        element.setCustomValidity("")
    } else {
        element.setCustomValidity("error")
    } 
}

function confirmPassword($form) {
    var $password = $form.find("#user_password")
    var $pass_verify = $form.find("#user_password_confirmation")
    var value = $password.val()
    var value2 = $pass_verify.val()
    var element = $pass_verify[0]

    if (value2 == value) {
        element.setCustomValidity("")
    } else {
        element.setCustomValidity("error")
    }
}

$(function() {
    const $register_form = $("#register_form")

    $register_form.find("#user_password").on("input", function() {
        checkPassword($register_form)
        confirmPassword($register_form)
    })

    $register_form.find("#user_password_confirmation").on("input", function() {
        confirmPassword($register_form)
    })

    addFormValidityTo($register_form)
    
})