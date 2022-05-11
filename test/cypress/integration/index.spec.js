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
        //cy.get("body > div > main > form > div").should('be.visible')
        cy.get("button[type=submit]").click()
        cy.visit(URL)
        cy.get("body > div > main > table > tbody").children().should("have.length", 1)
    })

    it('should edit a loan', () => {
        cy.visit(URL)

        cy.get("body > div > main > table > tbody > tr > td:nth-child(8) > span:nth-child(2) > a").click()
        cy.get("#loan_email").clear().type("max.muster@suva.ch")
        cy.get("button[type=submit]").click()
        cy.visit(URL)
        cy.get("body > div > main > table > tbody > tr > td:nth-child(2)").should("have.text", "max.muster@suva.ch")
    })
})
