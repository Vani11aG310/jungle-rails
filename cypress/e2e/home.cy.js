describe('Navigation', () => {
  it('should visit root', () => {
    cy.visit('/');
    cy.get(".products article").should("have.length", 2);
  });
})