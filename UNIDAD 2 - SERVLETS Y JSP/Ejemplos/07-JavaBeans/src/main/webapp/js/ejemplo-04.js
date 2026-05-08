const jForm = {

    valid: function(evt) {
        if(document.querySelectorAll("input[name=categoria]:checked").length === 0) {
            evt.preventDefault();
            alert("Debe seleccionar al menos una categoría");
            document.querySelector("input[name=categoria]").focus();
            return false;
        }

    }

};
