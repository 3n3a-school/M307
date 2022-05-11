try {
    if (document.getElementById('new-form-exists')) {
        newPageValidator()
    }
} catch (error) {
    console.log("")
}

Date.prototype.addDays = function(days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}

function updateRatePaypackDate(event) {
    let today = new Date()
    let rate_count_value = Number(event.target.value) * 15
    let payback_date = today.addDays(rate_count_value)
    let payback_string = payback_date.toLocaleDateString("en-US", {timeZone: "UTC", weekday: "long", year: "numeric", month: "numeric", day: "numeric"})
    let loan_rate_date = document.getElementById('loan_rate_payback_date')

    loan_rate_date.parentElement.parentElement.hidden = false
    loan_rate_date.innerHTML = `Pay loan back by ${payback_string}`
}

function newPageValidator() {
    let rate_count = document.getElementById('loan_rate_count')
    rate_count.addEventListener('change', updateRatePaypackDate)
}