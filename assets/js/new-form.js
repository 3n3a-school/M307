if (location.pathname.split("/").reverse()[0] == "new") {
    console.log("is new page")
    newPageValidator()
}


function updateRatePaypackDate(event) {
    let rate_count_value = event.target.rate_count_value
    console.log(rate_count_value)
}

function newPageValidator() {
    let rate_count = document.getElementById('loan_rate_count')
    rate_count.addEventListener('change', updateRatePaypackDate)
}