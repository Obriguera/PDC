const resetFormButtons = function(form) {
    form.querySelector("[name=guardar]").classList.add("d-none");
    form.querySelector("[name=guardar]").disabled = true;

    form.querySelector("[name=asignar]").classList.remove("d-none");
    form.querySelector("[name=asignar]").disabled = false;

    form.querySelector("[name=cancelar]").classList.add("d-none");
    form.querySelector("[name=cancelar]").disabled = true;
}

const loading = function(form) {
    form.querySelector("[name=botones]").classList.add("d-none");
    form.querySelector("[name=cargando]").classList.remove("d-none");
}

const cleanLoading = function(form) {
    form.querySelector("[name=botones]").classList.remove("d-none");
    form.querySelector("[name=cargando]").classList.add("d-none");
}

document.querySelectorAll("[name=asignar]").forEach(function(button) {
   button.addEventListener("click", function(event){
      let form = button.closest("form");
      form.querySelectorAll("input").forEach(function(input) {
         input.disabled = false;
      });

      form.querySelector("[name=guardar]").classList.remove("d-none");
      form.querySelector("[name=guardar]").disabled = false;

      form.querySelector("[name=cancelar]").classList.remove("d-none");
      form.querySelector("[name=cancelar]").disabled = false;

      button.classList.add("d-none");
      button.disabled = true;

      form.querySelector("input[name=apellido]").focus();
   });
});

document.querySelectorAll("[name=cancelar]").forEach(function(button) {
    button.addEventListener("click", function (event) {
        let form = button.closest("form");
        form.querySelectorAll("input[type=text],input[type=email]").forEach(function(input) {
            if(form.querySelector("input[name=nuevo]").value == "S"){
                input.value = "";
            }
            input.disabled = true;
        });

        resetFormButtons(form);
    });
});

document.querySelectorAll("form").forEach(function(form) {
   form.addEventListener("submit", async function(event) {
      event.preventDefault();

      document.getElementById("iError").classList.add("d-none");
      document.getElementById("iError").innerHTML = "";

      loading(form);

      const datos = new URLSearchParams(new FormData(form));

      const response = await fetch("./guardar.jsp", {
          method: "POST",
          body: datos,
          headers: {
              "Content-Type": "application/x-www-form-urlencoded"
          }
      });

      if(!response.ok) {
          cleanLoading(form);
          document.getElementById("iError").innerHTML = await response.text() || response.statusText;
          document.getElementById("iError").classList.remove("d-none");
          return;
      }

      form.querySelector("input[name=nuevo]").value = "N";
      form.querySelectorAll("input").forEach(function(input) {
           input.disabled = true;
      });
      resetFormButtons(form);
      cleanLoading(form);
   });
});