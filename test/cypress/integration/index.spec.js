const URL = "http://localhost:4002/loans"

describe('Integration Test', () => {
    it('should visit the main page', () => {
        cy.visit(URL)
    })

    it('should create a loan', () => {
        cy.visit(URL)

        cy.get("body > div > main > span > a").click()
        cy.get("#loan_name").type("New House")
        cy.get("#loan_email").type("max.muster@css.ch")
        cy.get("#loan_phone").type("+411234202030")
        cy.get("#loan_rate_count").type("7")
        cy.get("#loan_credit_package").select("8")
        // const today = new Date();
        // const paybackDate = new Date(
        //     today.getFullYear(), today.getMonth(), 
        //     today.getDay() + (cy.get("#loan_rate_count").value * 15))
    
        // cy.get("#loan_rate_payback_date").should("have.value", paybackDate)
        cy.get("button[type=submit]").click()
        cy.visit(URL)
        cy.get("body > div > main > table > tbody").children().should("have.length", 1)
    })

    it('should close a loan', () => {
        cy.visit(URL)
        cy.get("body > div > main > table > tbody > tr > td:nth-child(9) > span:nth-child(3) > a").click()
        cy.get("body > div > main > table > tbody").children().should("have.length", 0)
    })
})