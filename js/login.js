document.querySelectorAll(".button__login").forEach((button) => {
  button.addEventListener("click", (e) => {
    const usuario = e.target.innerText;
    if (usuario === "Aluno") {
      e.target.style.backgroundColor = "lightgreen";
      document.querySelector("#button__professor").style.backgroundColor =
        "white";
    } else if (usuario === "Professor") {
      e.target.style.backgroundColor = "lightgreen";
      document.querySelector("#button__aluno").style.backgroundColor = "white";
    }
  });
});

document.querySelector("#button__login").addEventListener("click", () => {
  const usuarioInput = document.querySelector(
    ".input__login[type='text']"
  ).value;
  const senhaInput = document.querySelector(
    ".input__login[type='password']"
  ).value;

  if (usuarioInput && senhaInput != "" && document.querySelector("#button__professor").style.backgroundColor == "lightgreen") {
    window.location.href = "professor.html";
  }
  else if( usuarioInput && senhaInput != "" && document.querySelector("#button__aluno").style.backgroundColor == "lightgreen")
  {
    window.location.href = "aluno.html";
  }
  else {
    alert("Por favor, preencha todos os campos.");
  }
});
