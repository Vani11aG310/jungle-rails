describe('Navigation', () => {
  it('should navigate to product details page when clicking on product', () => {
    cy.visit('/');
    cy.contains('Giant Tea').click();
  });
})