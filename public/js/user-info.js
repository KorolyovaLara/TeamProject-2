var modal = document.querySelectorAll("#modal");
const gameTitle = $("#gameTitle");
const gameDescription = $("#gameDescription");
const gameTrailer = $("#gameTrailer");
const form = $("form");

$("#new-game-modal-button").click(function () {
  var target = $(this).data("target");
  $("html").addClass("is-clipped");
  $(target).addClass("is-active");
});

$("#modal-close").click(function () {
  $("html").removeClass("is-clipped");
  modal[0].classList.remove("is-active");
});

const closeNotification = $("#close_error_banner");
const banner = $("#error_banner");
closeNotification.on("click", () => {
  banner.addClass("is-hidden");
});

const handleSubmit = async (e) => {
  e.preventDefault();

  banner.addClass("is-hidden");

  const title = gameTitle.val().trim();
  const description = gameDescription.val().trim();
  const trailer = gameTrailer.val().trim();

  const errors = {};
  if (!title) {
    errors.title = "Please write a title";
  } else if (!description) {
    errors.lastName = "Please write a description";
  } else if (!trailer) {
    errors.username = "Please provide link of the trailer";
  }

  if (Object.keys(errors).length > 0) {
    console.log(errors);
    `${Object.keys(errors)
      .map((key) => {
        return `${errors[key]}\r`;
      })
      .join("")}
      `;
  } else {
    const res = await fetch("/api/game", {
      method: "POST",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        title,
        description,
        trailer,
      }),
    });
    if (res.ok) {
      location.reload();
      return;
    }
    const body = await res.json();

    banner.removeClass("is-hidden");
    $(".error-list").html(
      Array.isArray(body)
        ? body.map((err) => `<li>Invalid ${err}</li>`)
        : `<li>${body.message}</li>`
    );
  }
};

form.on("submit", handleSubmit);